//
//  RegisterController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 07/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: UIViewController {
	
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	@IBAction func registerButtonTapped(_ sender: UIButton) {
		if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text {
			
			Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
				if error != nil {
					print("error: \(String(describing: error))")
				}
				
				let ref: DatabaseReference!
				ref = Database.database().reference()
				
				guard let userUid = authResult?.user.uid else {
					print("error, cant find UID")
					return
				}
				let userReference = ref.child("users").child(userUid)
				let values = ["name": name, "email": email]
				
				userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
					
					if error != nil {
						print("error in userReference.updateChild")
						return
					}
				})
			}
			dismiss(animated: true, completion: nil)
		}
	}
}
