//
//  HandleViewController.swift
//  MyStride
//
//  Created by Scor Doan on 7/12/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SVProgressHUD

class HandleViewController: UITableViewController {
    //Info mode
    @IBOutlet weak var nameTextField: StrideTextField!
    @IBOutlet weak var continueButton: CircularButton!

    
    private let disposeBag = DisposeBag()
    let viewModel = HandleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showBack(with: "Edit Number")
        setupComponents()
        bindViewModel()
    }
    
    
    private func setupComponents() {

        //Name
        self.nameTextField.rx.text.asObservable().subscribe(onNext: { (value) in
            guard self.nameTextField.inputStatus != .error else { return }
            self.nameTextField.inputStatus = (value?.isEmpty == false) ? .valid : .none
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        //Continue button
        self.continueButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
    }
    
    private func bindViewModel() {
        //User info
        let input = HandleViewModel.Input(continueTrigger: continueButton.rx.tap.asDriver(),
                                                name: nameTextField.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        output.canContinue.drive(continueButton.rx.isEnabled).disposed(by: disposeBag)
        output.continueTrigger.drive(onNext: { () in
                AppDelegate.shared.showHomePage()
            
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        output.handleAvailable.drive(onNext: { [weak self] (available) in
            guard let `self` = self else { return }
            if !available {
                self.nameTextField.inputStatus = .error
                self.showToast(message: "The Handle \(self.nameTextField.text!) is not available!")
            }
            
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        //Validate error
        output.invalidName.drive(onNext: { (error) in
            self.nameTextField.inputStatus = .error
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
}
