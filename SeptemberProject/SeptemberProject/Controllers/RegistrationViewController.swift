//
//  RegistrationViewController.swift
//  SeptemberProject
//
//  Created by Павел Широкий on 11.09.2023.
//

import UIKit
import FirebaseAuth

final class RegistrationViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let genderSwitcher: CustomMemberButton = {
        let genderSwitcher = CustomMemberButton()
        return genderSwitcher
    }()
    
    private let nameTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Имя")
        return textField
    }()
    
    private let mobileTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Телефон")
        return textField
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "E-mail")
        return textField
    }()
    
    private let placeTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Местоположение")
        return textField
    }()
    
    private let bioTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "О себе")
        return textField
    }()
    
    private let passTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Введите пароль")
        return textField
    }()
    
    private let pass2TextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Повторите пароль")
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
}


// MARK: - Setting Views
private extension RegistrationViewController {
    func setupViews() {
        configureScrollView()
        configureContentView()
        configureGenderSwitcher()
        configureNameTextField()
        configureEmailTextField()
        configurePlaceTextField()
        configureMobileTextField()
        configureBioTextFieald()
        configurePassTextField()
        configurePass2TextField()
    }
}

// MARK: - Layout
private extension RegistrationViewController {
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureGenderSwitcher() {
       
        contentView.addSubview(genderSwitcher)
        
        NSLayoutConstraint.activate([
            genderSwitcher.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            genderSwitcher.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -50),
            //   genderSwitcher.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
            genderSwitcher.heightAnchor.constraint(equalToConstant: 46),
            genderSwitcher.widthAnchor.constraint(equalToConstant: 177)
        ])
    }
    
    func configureNameTextField() {
        contentView.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
        nameTextField.topAnchor.constraint(equalTo: genderSwitcher.bottomAnchor, constant: 20),
        nameTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    func configureEmailTextField() {
        contentView.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
        emailTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
        emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePlaceTextField() {
        contentView.addSubview(placeTextField)
        NSLayoutConstraint.activate([
        placeTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
        placeTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        placeTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureMobileTextField() {
        contentView.addSubview(mobileTextField)
        NSLayoutConstraint.activate([
        mobileTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 20),
        mobileTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        mobileTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureBioTextFieald() {
        contentView.addSubview(bioTextField)
        NSLayoutConstraint.activate([
        bioTextField.topAnchor.constraint(equalTo: mobileTextField.bottomAnchor, constant: 20),
        bioTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        bioTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePassTextField() {
        contentView.addSubview(passTextField)
        NSLayoutConstraint.activate([
        passTextField.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 20),
        passTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        passTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePass2TextField() {
        contentView.addSubview(pass2TextField)
        NSLayoutConstraint.activate([
        pass2TextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
        pass2TextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
        pass2TextField.heightAnchor.constraint(equalToConstant: 60),
        pass2TextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
