//
//  UrlBuilder.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 18/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import RxSwift
import Cleanse



class UrlBuilder<T: Codable> {
    
    private let baseUrl = "https://stagingapinero.uvcr.me"
    private var headers : HTTPHeaders = []
    private var URL : String!
    private var parameters: Parameters = [:]
    private let requestHeader : RequestHeader
    
    init(requestHeader : RequestHeader ) {
        self.requestHeader = requestHeader
    }
    
    func SetUrl(urlSegment : String) -> UrlBuilder {
        self.URL = baseUrl + urlSegment
        return self
    }
    
    func SetBasicHeader() -> UrlBuilder {
        self.headers.add(name: "device_utc_offset", value: requestHeader.getDeviceUtcOffset())
        self.headers.add(name: "fcm_token", value: requestHeader.getFcmToken())
        return self
    }
    
    
    func AddLoginHeader(username : String, password : String) -> UrlBuilder {
        let credentialData = "\(username):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
               let base64Credentials = credentialData.base64EncodedString()
        self.headers.add(name: "Authorization", value: "Basic \(base64Credentials)")
        return self
    }
    
    func AddParameter(key : String, value : Any) -> UrlBuilder {
        self.parameters.updateValue(value, forKey: key)
        return self
    }
    
    func AddHeader(key : String, value : String) -> UrlBuilder {
           self.headers.add(name: key, value: value)
           return self
       }
    
    func Execute(httpMethod : HTTPMethod) -> Observable<T> {
        
         Observable<T>.create { (observer) -> Disposable in
            AF.request(self.URL, method: httpMethod, parameters: self.parameters ,encoding: URLEncoding.default, headers: self.headers)
                .validate()
                .responseJSON { (response) in
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    switch response.result {
                    case .success(let result) :
                        do {
                            
                            let baseResponse = try decoder.decode(BaseResponse<T>.self, from: response.data!)
                            observer.onNext(baseResponse.data)
                            observer.onCompleted()
                        } catch (let err) {
                            observer.onError(err)
                        }
                       
                    case .failure(let error):
                        if let responseData = response.data {
                            do {
                                
                                let errorReponse =  try decoder.decode(ErrorResponse.self, from: response.data!)
                                observer.onError(RuntimeError(errorReponse.errors[0].message))
                            } catch (let err) {
                                observer.onError(err)
                            }
                        }
                        else{
                            observer.onError(error)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
    func ExecuteArrayData(httpMethod : HTTPMethod) -> Observable<[T]> {
        
         Observable<[T]>.create { (observer) -> Disposable in
            AF.request(self.URL, method: httpMethod, parameters: self.parameters ,encoding: URLEncoding.default, headers: self.headers)
                .validate()
                .responseJSON { (response) in
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    switch response.result {
                    case .success(let result) :
                        do {
                            
                            let baseResponse = try decoder.decode(BaseResponseArrayData<T>.self, from: response.data!)
                            observer.onNext(baseResponse.data)
                            observer.onCompleted()
                        } catch (let err) {
                            observer.onError(err)
                        }
                       
                    case .failure(let error):
                        if let responseData = response.data {
                            do {
                                
                                let errorReponse =  try decoder.decode(ErrorResponse.self, from: response.data!)
                                observer.onError(RuntimeError(errorReponse.errors[0].message))
                            } catch (let err) {
                                observer.onError(err)
                            }
                        }
                        else{
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    
}
