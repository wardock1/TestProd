//
//  NoteAboutViewController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 04/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class NoteAboutViewController: UIViewController {
	
	
	@IBOutlet weak var titleDetailLabel: UILabel?
	@IBOutlet weak var descriptionDetailLabel: UILabel?
	
	var storageLabelTitle = ""
	var storageDescpLabel = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		titleDetailLabel?.text = storageLabelTitle
		descriptionDetailLabel?.text = storageDescpLabel
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		storageLabelTitle = ""
		storageDescpLabel = ""
	}

}
