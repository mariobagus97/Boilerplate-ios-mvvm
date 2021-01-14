//
//  BaseViewController.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 11/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import UIKit
import JGProgressHUD
import RxSwift
import RxCocoa
import Cleanse

class BaseViewController<T : BaseViewModel> : UIViewController {
    
    let disposeBag = DisposeBag()
    var loadingViewController:LoadingViewController?
    var viewModel:T!
    
    var container = Container()
    
    
    func getViewModel() -> T? {
        
        if let vm = container.container.resolve(T.self) {
            return vm
        }
        
        return getViewModel()
    }
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
        
        viewModel = container.getViewModel(viewModel: T.self)
        
        viewModel.isLoading
            .asObservable()
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { value in
                if value {
                    self.showLoading()
                } else {
                    self.hideLoading()
                }
            }).disposed(by: disposeBag)
        
        
        viewModel.alertError
            .asObservable()
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (msgError) in
                if !msgError.isEmpty{
                    self.showAlert(title: "Kesalahan", message: msgError)
                }
            }).disposed(by: disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//    func checkStoryboardName() throws {
//        print(BaseViewController<T>.self)
//        if BaseViewController<T>.storyboardName == .none {
//            throw GeneralError.storyboardNameNotFound
//        }
//    }
    
    func showSuccessAlert(message : String) {
        showAlert(title: "Berhasil", message: message)
    }
    
    func showErrorAlert(message : String) {
        showAlert(title: "Kesalahan", message: message)
    }
    
    func showAlert(title : String, message : String) {
        let uialert = UIAlertController(title: title, message: message
                                   , preferredStyle: UIAlertController.Style.alert)
                           uialert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
    }
    
    //TODO : show loading component in each page
    func showLoading() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: storyboardType.prelogin.rawValue, bundle:nil)
        loadingViewController = storyBoard.instantiateViewController(withIdentifier: String(describing: LoadingViewController.self)) as! LoadingViewController
        
        self.present(loadingViewController!, animated: false, completion: nil)
    }
    
    //TODO : show loading component in each page
    func hideLoading() {
        
        if let vc = loadingViewController {
            vc.dismiss(animated: false, completion: nil)
            loadingViewController = nil;
        }
    }
    
    func nextViewController(storyBoard: storyboardType, viewController vc: UIViewController.Type, animated:Bool = true, isModal:Bool = false) {
        
        let nextViewController = getViewController(storyBoard: storyBoard, viewController: vc)
        
        if isModal {
            nextViewController.modalPresentationStyle = .overFullScreen
            self.navigationController!.pushViewController(nextViewController, animated: animated)
        } else {
            self.navigationController!.pushViewController(nextViewController, animated: animated)
        }
    }
    
    private func getViewController(storyBoard: storyboardType, viewController vc:UIViewController.Type) -> UIViewController {
        
        let vcName = String(describing: vc)
        let storyBoard : UIStoryboard = UIStoryboard(name: storyBoard.rawValue, bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: vcName)
        
        return nextViewController;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol StoryboardObject {
    
    static var storyboardName:storyboardType { get }
    
}
