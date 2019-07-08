//
//  LogginController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 07/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit
import Firebase

class LogginController: UIViewController {
	
	@IBOutlet weak var emailLoginTextField: UITextField!
	@IBOutlet weak var passwordLoginTextFied: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	
	@IBAction func singInButtonTapepd(_ sender: UIButton) {
		guard let email = emailLoginTextField.text, let password = passwordLoginTextFied.text else { print("email, password = nil, error"); return }
		
		if validate(password: password) {
			Auth.auth().signIn(withEmail: email, password: password) { (success, error) in
				
				if error != nil {
					print(error!._code)
					self.handleError(error!)
				}
				print("user logged in sucessfully")
				self.performSegue(withIdentifier: "fromLogginToTabBar", sender: self)
			}
		} else {
			print("bad password: error")
			return
		}
	}
	
	
	func validate(password: String) -> Bool {
		var isUppercase = false
		var isLowerCase = false
		for char in password {
			if char.isUppercase {
				isUppercase = true
			}
			if char.isLowercase {
				isLowerCase = true
			}
		}
		return password.count >= 6 && isLowerCase && isUppercase
	}
	
	
	@IBAction func signUpButtonTapped(_ sender: UIButton) {
		performSegue(withIdentifier: "fromLoginToRegister", sender: self)
	}
	
}

extension AuthErrorCode {
	var errorMessage: String {
		switch self {
		case .emailAlreadyInUse:
			return "Email уже используется с другим аккаунтом"
		case .userNotFound:
			return "Пользователь не найден"
		case .invalidEmail, .invalidSender, .invalidRecipientEmail:
			return "Попробуйте еще раз ввести корреткный email"
		case .networkError:
			return "Попробуйте еще раз"
		case .weakPassword:
			return "Пароль слишком простой, так не пойдет"
		case .wrongPassword:
			return "Пароль был введен не правильно"
		default:
			return "Что-то пошло не так, сорян"
		}
	}
}

extension UIViewController{
	func handleError(_ error: Error) {
		if let errorCode = AuthErrorCode(rawValue: error._code) {
			print(errorCode.errorMessage)
			let alert = UIAlertController(title: "Ошибка", message: errorCode.errorMessage, preferredStyle: .alert)
			
			let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
			
			alert.addAction(okAction)
			
			self.present(alert, animated: true, completion: nil)
			
		}
	}
	
	func alertCommand (title: String, message: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(action)
		self.present(alertController, animated: true, completion: nil)
	}
	
}
