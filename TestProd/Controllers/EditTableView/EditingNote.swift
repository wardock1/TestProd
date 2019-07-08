//
//  EditingNote.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 04/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class EditingNote: UITableViewController {
	
	@IBOutlet weak var editTitleTextField: UITextField!
	@IBOutlet weak var editDescriptionTextField: UITextField!
	
	var editStorageTitleLabel: String?
	var editStorageDescLabel: String?
	
	var index: Int?
	var segueArray:[Note]?
	
	override func viewDidLoad() {
		editTitleTextField.text = segueArray![index!].noteTitle
		editDescriptionTextField.text = segueArray![index!].noteDescription
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.section == 0 && indexPath.row == 0 {
			editTitleTextField.becomeFirstResponder()
			editDescriptionTextField.becomeFirstResponder()
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
	@IBAction func saveButtonTapped(_ sender: UIButton) {
		segueArray![index!].noteTitle = editTitleTextField.text
		segueArray![index!].noteDescription = editDescriptionTextField.text
		ListNotes.shared.listOfNotes = segueArray!
		self.alertCommand(title: "Готово", message: "Заметка была отредактирована")
		editTitleTextField.text = ""
		editDescriptionTextField.text = ""
		
	}
}
