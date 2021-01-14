//
//  LoginViewController.swift
//  boilerplate mvvm
//
//  Created by Ultra Voucher on 12/08/20.
//  Copyright © 2020 ryomar. All rights reserved.
//

import UIKit
import RxBinding
import RxSwift
import RxCocoa
import Cleanse

class LoginViewController: BaseViewController<LoginViewModel> {
    
    
    @IBOutlet weak var txtuname: UITextField!
    @IBOutlet weak var txtpwd: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func btnRegister(_ sender: Any) {
        performSegue(withIdentifier: "homesegue", sender: nil)
    }
    
    
    static var storyboardName: storyboardType {
        return .prelogin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nextViewController(storyBoard: .home, viewController: HomeViewController.self)
        
        btnLogin.rx.tap
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                self.viewModel.login()
                
            })
            .disposed(by: disposeBag)
        
        viewModel.isSuccess
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (bool) in
                if bool {
                    self.ShowHome()
                }})
        
        txtuname.rx.text
            .orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        
        txtpwd.rx.text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)

    }
    
    private func ShowHome() {
        
//        self.nextViewController(storyBoard: .home, viewController: HomeViewController.self)
               
    }
    
}
