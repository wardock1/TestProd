//
//  AddViewController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 03/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit


class AddViewController: UIViewController {

	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var descriptionTextField: UITextField!
	
	@IBOutlet weak var redMarkerOutlet: UIButton!
	@IBOutlet weak var greenMarkerOutlet: UIButton!
	@IBOutlet weak var blackMarker: UIImageView!
	@IBOutlet weak var blackMarkerToGreen: UIImageView!
	
	let blackMarkerStorage = UIImage(named: "blackMarker")
	
	var isCheckRed = false
	var isCheckGreen = false
	
	@IBAction func redMarkerTapped(_ sender: UIButton) {
		isCheckRed = !isCheckRed
		
		if isCheckRed {
		blackMarker.image = blackMarkerStorage
		} else {
			blackMarker.image = nil
		}
	}
	
	
	@IBAction func greenMarkerTapped(_ sender: UIButton) {
		isCheckGreen = !isCheckGreen
		
		if isCheckGreen {
			blackMarkerToGreen.image = blackMarkerStorage
		} else {
			blackMarkerToGreen.image = nil
		}
	}
	
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	
	@IBAction func addButtonTapped(_ sender: UIButton) {
		if isCheckRed && isCheckGreen {
			self.alertCommand(title: "Некорректно выбран маркер", message: "Выберите один из двух цветовых маркеров")
		}
		
		if isCheckRed {
			let newNote = Note(noteTitle: titleTextField.text!, noteDescription: descriptionTextField.text!, marker: redMarkerOutlet.imageView!.image!)
			ListNotes.shared.listOfNotes.append(newNote)
			self.alertCommand(title: "Готово", message: "Заметка была добавлена в общий список")
		}

		if isCheckGreen {
			let newNote = Note(noteTitle: titleTextField.text!, noteDescription: descriptionTextField.text!, marker: greenMarkerOutlet.imageView!.image!)
			ListNotes.shared.listOfNotes.append(newNote)
			self.alertCommand(title: "Готово", message: "Заметка была добавлена в общий список")
		}
		
		if (isCheckRed && isCheckGreen) == false {
			self.alertCommand(title: "Не выбран цветовой маркер", message: "Выберите один из двух цветовых маркеров")
		}
		
		titleTextField.text = ""
		descriptionTextField.text = ""
		isCheckRed = false
		isCheckGreen = false
		blackMarker.image = nil
		blackMarkerToGreen.image = nil
	}
	
	
}
