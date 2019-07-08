//
//  CreateGroupList.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 04/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit


class CreateGroupList: UIViewController {
	
	var groupOfListNotes = [Note]()
	
	var newGroupList = [Note]()
	var NewGroup = [GroupNote]()
	
	var label1: String?
	var label2: String?
	static var closer: ((GroupNote) -> ())?
	
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var descriptionTextField: UITextField!
	
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBAction func saveButtonTapped(_ sender: UIButton) {
		let groupedNote = GroupNote(groupTitle: titleTextField.text ?? "", groupDescription: descriptionTextField.text ?? "", groupNotes: newGroupList)
		CreateGroupList.closer!(groupedNote)
		tableView.allowsMultipleSelection = false
		self.navigationController?.popToRootViewController(animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		groupOfListNotes = ListNotes.shared.listOfNotes
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		tableView.allowsMultipleSelection = true
		
	}
}

extension CreateGroupList: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ListNotes.shared.listOfNotes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "groupTableViewCell", for: indexPath) as? CreateTableViewCell {
			cell.titleLabel.text = ListNotes.shared.listOfNotes[indexPath.row].noteTitle
			cell.markerImage.image = ListNotes.shared.listOfNotes[indexPath.row].marker
			cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
			
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let path = indexPath.row
		newGroupList.append(groupOfListNotes[path])
		print("THIS IS PATH: \(path)")
		
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath)
		
		let deletePath = tableView.indexPathForSelectedRow
		if let pathDelete = deletePath?.row {
			newGroupList.remove(at: pathDelete)
		}
		
		cell!.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
		
	}
	

}
