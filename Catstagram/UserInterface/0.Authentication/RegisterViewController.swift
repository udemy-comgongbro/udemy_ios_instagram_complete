//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 김우성 on 2022/02/02.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    // validation
    var isValidEmail: Bool = false { didSet { vaildateUserInfo() } }
    var isValidName: Bool = false { didSet { vaildateUserInfo() } }
    var isValidNickname: Bool = false { didSet { vaildateUserInfo() } }
    var isValidPassword: Bool = false { didSet { vaildateUserInfo() } }
    
    var userInfo: ((UserInfo) -> Void)?
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        return [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupLayout()
        setupActions()
    }
    
    // MARK: - Actions
    @IBAction func backbuttonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        self.userInfo?(userInfo)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func textFieldEditingChagned(_ sender: UITextField) {
        let text = sender.text ?? ""
        switch sender {
        case emailTextField:
            self.email = sender.text ?? ""
            isValidEmail = text.isValidEmail()
            
        case nameTextField:
            self.name = sender.text ?? ""
            isValidName = text.count > 1
            
        case nicknameTextField:
            self.nickname = sender.text ?? ""
            isValidNickname = text.count > 1
            
        case passwordTextField:
            self.password = sender.text ?? ""
            isValidPassword = text.isValidPassword()
            
        default:
            fatalError("Missing TextField")
        }
    }
    
    // MARK: - Helpers
    private func setupNavi() {
        self.navigationItem.hidesBackButton = true
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    private func setupLayout() {
        facebookLoginButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
    }
    
    // Validation
    private func vaildateUserInfo() {

        if isValidEmail &&
            isValidName &&
            isValidNickname &&
            isValidPassword {
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor(named: "facebookColor")
            }
            signupButton.isEnabled = true
        } else {
            signupButton.backgroundColor = UIColor(named: "disableButtonColor")
            signupButton.isEnabled = false
        }
    }
    
    private func setupActions() {
        // Add Target
        textFields.forEach { tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChagned(_:)),
                         for: .editingChanged)
        }
        
        
    }
    
    
}
extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)

        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
