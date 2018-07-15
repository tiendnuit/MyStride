//
//  LoginViewController.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import ActionSheetPicker_3_0
import SVProgressHUD

class LoginViewController: UITableViewController {
    //Send Code mode
    @IBOutlet weak var sendCodeView: UIView!
    @IBOutlet weak var phoneTextField: StrideTextField!
    @IBOutlet weak var sendCodeButton: CircularButton!
    
    private let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()
    var selectedCountry = Country.default
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.showBack()
        setupComponents()
        bindViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let confirmVC = R.segue.loginViewController.toConfirm(segue: segue)?.destination {
            let phoneNumber = "(+\(selectedCountry.phonePrefix)) \(phoneTextField.text!)"
            confirmVC.phoneNumber = phoneNumber
            confirmVC.isSignUp = false
        }
    }
    
    
    private func setupComponents() {
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
        
        //Send code button
        self.sendCodeButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
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
        let input = LoginViewModel.Input(sendCodeTrigger: sendCodeButton.rx.tap.asDriver(),
                                          phoneNumber: phoneTextField.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        //Send Code
        output.sendCodeTrigger.drive(onNext: { [weak self] () in
            self?.performSegue(withIdentifier: R.segue.loginViewController.toConfirm, sender: nil)
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
}
