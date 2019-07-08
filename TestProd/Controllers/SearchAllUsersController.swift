//
//  SearchAllUsersController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 07/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit
import Firebase

class SearchAllUsersController: UITableViewController {
	
	@IBOutlet var tableViewController: UITableView!
	
	var users = [Users]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableViewController.dataSource = self
		tableViewController.delegate = self
		
		
		fetchUsers()
    }
	
	func fetchUsers () {
		let rootRef = Database.database().reference()
		let query = rootRef.child("users").queryOrdered(byChild: "name")
		query.observe(.value) { (snapshot) in
			for child in snapshot.children.allObjects as! [DataSnapshot] {
				if let value = child.value as? NSDictionary {
					let name = value["name"] as? String ?? "user not found"
					let email = value["email"] as? String ?? "email not found"
					let aa = Users(email: email, name: name)
					self.users.append(aa)
					
					DispatchQueue.main.async {
						self.tableView.reloadData()
					}
					
				}
			}
		}
		
	}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "usersTableViewCell", for: indexPath) as? SearchAllUsersCell {
			cell.nameLabel.text = users[indexPath.row].name
			cell.emailLabel.text = users[indexPath.row].email
			
			
			return cell
		}
		return UITableViewCell()
	}
}
