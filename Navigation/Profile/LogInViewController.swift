//
//  LogInViewController.swift
//  Navigation
//
//  Created by Admin on 15.02.23.
//

import UIKit

private let login = "login"
private let password = "password"

class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let logoImageView: UIImageView = {
        $0.image = UIImage(named: "logo")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var userNameTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.tintColor = UIColor(named: "accentColor")
        $0.autocapitalizationType = .none
        $0.backgroundColor = .systemGray6
        $0.placeholder = "Email or phone"
        $0.delegate = self
        $0.indent(size: 20)
        return $0
    }(UITextField())
    
    private lazy var passwordTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.tintColor = UIColor(named: "accentColor")
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.backgroundColor = .systemGray6
        $0.placeholder = "Password"
        $0.delegate = self
        $0.indent(size: 20)
        return $0
    }(UITextField())
    
    private lazy var logInButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        $0.clipsToBounds = true
        $0.setTitle("Log In", for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(tappedAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let warningLabel: UILabel = {
        $0.text = "Предупреждение \nМинимальное количество символов пароля 8"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.numberOfLines = 0
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        layout()
        buttonStates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        userNameTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
        warningLabel.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        super.viewWillDisappear(animated)
        notification.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func tappedAction() {
        
        guard userNameTextField.text?.count ?? 0 > 0 else {
            userNameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            return
        }
        guard passwordTextField.text?.count ?? 0 > 0 else {
            passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            return
        }
        
        guard passwordTextField.text?.count ?? 1 > 7 else {
            warningLabel.isHidden = false
            return
        }
        
        guard userNameTextField.text == login else {
            checkForLogin()
            return
        }
        
        guard passwordTextField.text == password else {
            checkForLogin()
            return
        }
        
        
        
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func layout() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(userNameTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.addSubview(warningLabel)
        
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            userNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            warningLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            warningLabel.leftAnchor.constraint(equalTo: logInButton.leftAnchor),
            warningLabel.rightAnchor.constraint(equalTo: logInButton.rightAnchor),
            warningLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    func buttonStates() {
            switch logInButton.state {
            case .normal: logInButton.alpha = 1
            case .selected: logInButton.alpha = 0.8
            case .highlighted: logInButton.alpha = 0.8
            case .disabled: logInButton.alpha = 0.8
            default:
                break
            }
        }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

extension LogInViewController {
    private func checkForLogin() {
        let alert = UIAlertController(title: "Предупреждение", message: "Неправильно введен логин или пароль", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
}


