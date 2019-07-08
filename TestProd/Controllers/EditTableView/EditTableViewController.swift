//
//  EditTableViewController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 03/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit
import Firebase

class EditTableViewController: UITableViewController {
	
	var editStorageLabelTitle = ""
	var editStorageLabelDescp = ""
	

    override func viewDidLoad() {
        super.viewDidLoad()
		fetchUserValue()
    }
	
	
	override func viewWillAppear(_ animated: Bool) {
		tableView.reloadData()
	}
	
		func fetchUserValue () {
			let uid = Auth.auth().currentUser?.uid
			let ref: DatabaseReference!
			ref = Database.database().reference()
			ref.database.reference().child("users").child(uid!).observe(.value, with: { (snapshot) in
				print("here is span SHOT!!!!!!!: \(snapshot)")
				if let dictionary = snapshot.value as? [String: Any] {
					self.navigationItem.title = dictionary["name"] as? String
				}
			}, withCancel: nil)
	
		}
	
//		@objc func searchAllusers () {
//			let searchUsersController = SearchAllUsersController()
//			present(searchUsersController, animated: true, completion: nil)
//
//
//		}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "fromEditToEditing" {
			let path = tableView.indexPathForSelectedRow
			let destination = segue.destination as? EditingNote
			
			destination?.editStorageTitleLabel = editStorageLabelTitle
			destination?.editStorageDescLabel = editStorageLabelDescp
			destination?.index = path?.row
			destination?.segueArray = ListNotes.shared.listOfNotes
		}
	}
	
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ListNotes.shared.listOfNotes.count
    }
	
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "editTableViewCell", for: indexPath) as? EditTableViewCell {
			cell.titleLabel.text = ListNotes.shared.listOfNotes[indexPath.row].noteTitle
			cell.descriptionLabel.text = ListNotes.shared.listOfNotes[indexPath.row].noteDescription
			cell.markerImage.image = ListNotes.shared.listOfNotes[indexPath.row].marker
			
			return cell
		}
		
		return UITableViewCell()
    }
}
