//
//  SignUpViewController.swift
//  MyStride
//
//  Created by Scor Doan on 7/10/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import ActionSheetPicker_3_0
import SVProgressHUD

class SignUpViewController: UITableViewController {
    
    //Info mode
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var firstNameTextField: StrideTextField!
    @IBOutlet weak var lastnameTextField: StrideTextField!
    @IBOutlet weak var continueButton: CircularButton!
    
    //Send Code mode
    @IBOutlet weak var sendCodeView: UIView!
    @IBOutlet weak var phoneTextField: StrideTextField!
    @IBOutlet weak var sendCodeButton: CircularButton!
    
    private let disposeBag = DisposeBag()
    let viewModel = SignUpViewModel()
    var selectedCountry = Country.default
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showBack()
        setupComponents()
        bindViewModel()
    }
    
    private func setupComponents() {
        
        //Name
        self.firstNameTextField.rx.text.asObservable().subscribe(onNext: { (value) in
            self.firstNameTextField.inputStatus = (value?.isEmpty == false) ? .valid : .none
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        self.lastnameTextField.rx.text.asObservable().subscribe(onNext: { (value) in
            self.lastnameTextField.inputStatus = (value?.isEmpty == false) ? .valid : .none
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)

        //Phone
        let userDefaults = UserDefaults.standard
        if let countryCode = userDefaults.string(forKey: AppDefined.UserDefault.LastSelectedCountryCode), let index = DataManager.shared.countries.index(where: {$0.countryCode == countryCode}) {
            self.selectedCountry = DataManager.shared.countries[index]
            
        }
        selectedIndex = DataManager.shared.countries.index(where: {$0.countryCode == self.selectedCountry.countryCode}) ?? 0
        self.phoneTextField.rx.text.asObservable().subscribe(onNext: { (value) in
            guard self.phoneTextField.inputStatus != .error else { return }
            self.phoneTextField.inputStatus = (value?.isEmpty == false) ? .valid : .none
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        updatePhoneTextField()
    }
    
    private func updatePhoneTextField() {
        let prefix = "(+\(selectedCountry.phonePrefix))"
        let title = "\(selectedCountry.countryCode.uppercased()) ▼ "

        let attrs1 = [NSAttributedStringKey.font : R.font.montserratBold(size: 16)!, NSAttributedStringKey.foregroundColor : UIColor.StrideGreen]
        let attrs2 = [NSAttributedStringKey.font : R.font.montserratRegular(size: 16)!, NSAttributedStringKey.foregroundColor : UIColor.StrideText]
        
        let attributedString1 = NSMutableAttributedString(string: title, attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string:prefix, attributes:attrs2)
        
        attributedString1.append(attributedString2)
        phoneTextField.keyboardType = UIKeyboardType.phonePad
        phoneTextField.setLeftButton(attributedTitle: attributedString1) { [weak self] (_) in
            self?.showPicker()
        }
    }
    
    private func bindViewModel() {
        //User info
        let input = SignUpViewModel.Input(continueTrigger: continueButton.rx.tap.asDriver(),
                                          sendCodeTrigger: sendCodeButton.rx.tap.asDriver(),
                                          lastName: lastnameTextField.rx.text.orEmpty.asDriver(),
                                          firstName: firstNameTextField.rx.text.orEmpty.asDriver(),
                                          phoneNumber: phoneTextField.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        output.canContinue.drive(continueButton.rx.isEnabled).disposed(by: disposeBag)
        output.continueTrigger.drive(onNext: { [weak self] () in
            self?.showSendCodeView()
        }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        //Send Code
        output.sendCodeTrigger.drive(onNext: { [weak self] () in
            self?.performSegue(withIdentifier: R.segue.signUpViewController.toConfirm, sender: nil)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        output.canSendCode.drive(sendCodeButton.rx.isEnabled).disposed(by: disposeBag)
        
        
        //Validate error
        output.invalidPhone.drive(onNext: { (error) in
            self.phoneTextField.inputStatus = .error
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

    func showSendCodeView() {
        self.sendCodeView.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            self.userInfoView.alpha = 0.0
            self.sendCodeView.alpha = 1.0
        }) { (finished) in
            self.userInfoView.isHidden = true
            self.sendCodeView.isHidden = false
        }
    }
    
    func showPicker() {
        let rows = DataManager.shared.countries.map {$0.englishName}
        
        ActionSheetStringPicker.show(withTitle: "", rows: rows, initialSelection: selectedIndex, doneBlock: { [weak self] (picker, index, value) in
            guard let `self` = self else {
                return
            }
            self.selectedCountry = DataManager.shared.countries[index]
            self.selectedIndex = index
            self.updatePhoneTextField()
            UserDefaults.standard.set(self.selectedCountry.countryCode, forKey: AppDefined.UserDefault.LastSelectedCountryCode)
            UserDefaults.standard.synchronize()
            }, cancel: { (_) in
                return
        }, origin: self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIClient.shared.clearUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let confirmVC = R.segue.signUpViewController.toConfirm(segue: segue)?.destination {
            let phoneNumber = "(+\(selectedCountry.phonePrefix)) \(phoneTextField.text!)"
            confirmVC.phoneNumber = phoneNumber
        }
    }
}
