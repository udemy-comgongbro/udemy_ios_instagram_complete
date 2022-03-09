//
//  LoginViewController.swift
//  Catstagram
//
//  Created by 김우성 on 2022/02/02.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var email = String() { didSet { self.checkTextFieldContents()} }
    var password = String() { didSet { self.checkTextFieldContents()} }
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        setupLayout()
        
        self.userInfo = UserInfo(
            email: "email@gmail.com",
            name: "Uno",
            nickname: "Uno",
            password: "Q!w2e3r4")
    }
    
    
    // MARK: - Actions
    @IBAction func emailTextfieldEditingChanged(_ sender: UITextField) {
        self.email = sender.text ?? ""
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        self.password = sender.text ?? ""
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
        guard let userInfo = userInfo else { return }

        if userInfo.email == self.email
            && userInfo.password == self.password {
        
            // 화면전환
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            
            self.view.window?.windowScene?.keyWindow?.rootViewController = vc
        }
        
        
        
        
        
        
        
        
        
        
        
        /* 테스트 단계에서 넣은 더미데이터 */
//        if email == "email@gmail.com" &&
//            password == "Q!w2e3r4" {
//
            
//        }
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 스토리보드를 생성합니다.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // UIViewController의 서브클래스를 생성합니다.
        let registerViewController
        = storyboard.instantiateViewController(
            withIdentifier: "RegisterVC")
        as! RegisterViewController
        
        // 생성한 서브클래스를 화면에 보여줍니다.
        //       self.present(registerViewController,
        //                     animated: true)
        self.navigationController?
            .pushViewController(
                registerViewController,
                animated: true)
        
        registerViewController.userInfo = { (userInfo) in
            
        }
    }
    
    private func setupLayout() {
        loginButton.layer.cornerRadius = 5
    }
    
    private func checkTextFieldContents() {
        if email.isValidEmail() && password.count > 6 {
            self.loginButton.backgroundColor = .facebookColor
        }
    }
    
    
    func attribute() {
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = self.generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString {
        // UIButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.") }
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성한다.
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        // 텍스트에 맞는 설정을 추가한다.
        texts.indices.forEach { index in
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextsRanges[index])
            
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors[index],
                                          range: customTextsRanges[index])
        }
        return attributedString
    }
}



extension UIWindow {
    func replaceRootViewController(_ replaceVC: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        
        self.rootViewController = replaceVC
        
        if animated {
            UIView.animate(withDuration: 0.4) {
                //
            }
        } else {
            
        }
        
        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController!.dismiss(animated: false, completion: nil)
        } else {
            //
        }
        
    }
}
