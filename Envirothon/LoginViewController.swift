//
//  LoginViewController.swift
//  Envirothon
//
//  Created by Cole Turner on 4/21/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	@IBOutlet weak var errorLabel: UILabel!
	@IBOutlet weak var passwordText: UITextField!
	@IBOutlet weak var emailText: UITextField!
	
	@IBAction func signUpButton(_ sender: UIButton) {
		performSegue(withIdentifier: "logInToSignUp", sender: sender)
	}
	
	@IBAction func logInButton(_ sender: UIButton) {
		let seguePerformed = shouldPerformSegue(withIdentifier: "logInToProfile", sender: sender)
		print("Segue perform from login to profile: \(seguePerformed)")
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		var check = false
		Auth.auth().signIn(withEmail: emailText.text ?? "", password: passwordText.text ?? "") { (user, error) in
			if let error = error {
				print(error.localizedDescription)
				self.errorLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
				self.errorLabel.text = "Your email or password was incorrect."
			} else {
				print("\(user!.email!) logged in!")
				check = true
				self.performSegue(withIdentifier: "logInToProfile", sender: sender)
			}
		}
		return check
	}



	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
}
