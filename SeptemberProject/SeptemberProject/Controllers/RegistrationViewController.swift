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
    
    private let genderSwitcherM: CustomMemberButton = {
        let genderSwitcherM = CustomMemberButton(normalImageName: "ManOff",highlightedImageName: "ManOn", disabledImageName: "ManOff")
        genderSwitcherM.addTarget(self, action: #selector(buttonMPressed), for: .touchUpInside)
        return genderSwitcherM
    }()
    
    private let genderSwitcherW: CustomMemberButton = {
        let genderSwitcherW = CustomMemberButton(normalImageName: "WomanOff",highlightedImageName: "WomanOn", disabledImageName: "WomanOff")
        genderSwitcherW.addTarget(self, action: #selector(buttonWPressed), for: .touchUpInside)
        return genderSwitcherW
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
    
    @objc func buttonMPressed() {
        genderSwitcherM.isEnabled = true
        genderSwitcherW.isEnabled = false
    }
    
    @objc func buttonWPressed() {
        genderSwitcherM.isEnabled = false
        genderSwitcherW.isEnabled = true
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
    
    func configureBackgroundStyle() {
        
    }
    
    func configureGenderSwitcher() {
        
        contentView.addSubview(genderSwitcherM)
        contentView.addSubview(genderSwitcherW)
        
        genderSwitcherM.translatesAutoresizingMaskIntoConstraints = false
        genderSwitcherW.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genderSwitcherM.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
            genderSwitcherM.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            genderSwitcherM.heightAnchor.constraint(equalToConstant: 46),
            genderSwitcherM.widthAnchor.constraint(equalToConstant: 177)
        ])
        NSLayoutConstraint.activate([
            genderSwitcherW.topAnchor.constraint(equalTo: genderSwitcherM.topAnchor),
            genderSwitcherW.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            genderSwitcherW.heightAnchor.constraint(equalToConstant: 46),
            genderSwitcherW.widthAnchor.constraint(equalToConstant: 177)
        ])
       
        }
    
    func configureNameTextField() {
        contentView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: genderSwitcherM.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureEmailTextField() {
        contentView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePlaceTextField() {
        contentView.addSubview(placeTextField)
        NSLayoutConstraint.activate([
            placeTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            placeTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            placeTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureMobileTextField() {
        contentView.addSubview(mobileTextField)
        NSLayoutConstraint.activate([
            mobileTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 20),
            mobileTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mobileTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureBioTextFieald() {
        contentView.addSubview(bioTextField)
        NSLayoutConstraint.activate([
            bioTextField.topAnchor.constraint(equalTo: mobileTextField.bottomAnchor, constant: 20),
            bioTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bioTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePassTextField() {
        contentView.addSubview(passTextField)
        NSLayoutConstraint.activate([
            passTextField.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configurePass2TextField() {
        contentView.addSubview(pass2TextField)
        NSLayoutConstraint.activate([
            pass2TextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            pass2TextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pass2TextField.heightAnchor.constraint(equalToConstant: 60),
            pass2TextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
