//
//  ConfirmationViewController.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import AWSCognitoIdentityProvider
import SVProgressHUD

class ConfirmationViewController: UIViewController {
    //Info mode
    @IBOutlet weak var codeTextField: StrideTextField!
    @IBOutlet weak var continueButton: CircularButton!
    @IBOutlet weak var reSendButton: CircularButton!
    
    private let disposeBag = DisposeBag()
    let viewModel = ConfirmationViewModel()
    var phoneNumber: String!
    var isSignUp: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setTitleNavigationBar(phoneNumber)
        self.showBack(with: "Edit Number")
        setupComponents()
        bindViewModel()
    }

    
    private func setupComponents() {
        viewModel.fromSignUp = isSignUp
        viewModel.phoneNumber = phoneNumber
        //Code
        self.codeTextField.keyboardType = UIKeyboardType.numberPad
        self.codeTextField.rx.text.asObservable().subscribe(onNext: { (value) in
            guard self.codeTextField.inputStatus != .error else { return }
            self.codeTextField.inputStatus = (value?.isEmpty == false) ? .valid : .none
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        //Buttons
        //Continue button
        self.continueButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
        
        //ReSend code button
        reSendButton.layer.borderColor = UIColor.StrideGreen.cgColor
        reSendButton.layer.borderWidth = 2.5
        self.reSendButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
    }
    
    private func bindViewModel() {
        //User info
        let input = ConfirmationViewModel.Input(continueTrigger: continueButton.rx.tap.asDriver(),
                                          resendCodeTrigger: reSendButton.rx.tap.asDriver(),
                                          code: codeTextField.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        output.canContinue.drive(continueButton.rx.isEnabled).disposed(by: disposeBag)
        output.continueTrigger.drive(onNext: { [weak self] (status) in
            if status == true {
                self?.finishComfirmed()
            } else { ///-> go to handle
                self?.goOnboarding()
            }
            
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        //Send Code
        output.resendCodeTrigger.drive(onNext: { [weak self] () in
            self?.showAlert(title: "Code resent successful!", msg: nil)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        //Validate error
        output.invalidCode.drive(onNext: { (error) in
            self.codeTextField.inputStatus = .error
            self.showToast(message: error.localizedDescription)
        }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        //API error
        output.error.drive(onNext: { (error) in
            self.showAlert(title: "Whoa!", msg: error.localizedDescription)
        }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        //Loading
        output.loading.drive(onNext: {[unowned self] (loading) in
            self.showLoading(loading)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func finishComfirmed() {
        if isSignUp {
            showSignUpAlert()
        } else {
            goHomePage()
        }
    }

    
    func showSignUpAlert() {
        let alert = UIAlertController(title: "Good news!", message: "You already have a mystride account. \nWould you like to login?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No thanks", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.dismiss(animated: false, completion: {
                AppDelegate.shared.showLogin()
            })
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func goOnboarding() {
        self.performSegue(withIdentifier: R.segue.confirmationViewController.toHandle, sender: nil)
    }
    
    func goHomePage() {
        AppDelegate.shared.showHomePage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
