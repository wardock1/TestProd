//
//  DetailGroupList.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 07/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class DetailGroupList: UIViewController {
	
	var arry = [GroupNote]() {
		didSet {
			iterate(data: arry)
		}
	}
	
	var arryForTable = [Note]()
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var tableViewController: UITableView!
	
	var titleStorage: String? 
	var descriptionStorage: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableViewController.delegate = self
		tableViewController.dataSource = self
		titleLabel.text = titleStorage
		descriptionLabel.text = descriptionStorage
	}
	
	func iterate (data: [GroupNote]) {
		var damn = [Note]()
		
		for i in data {
			damn = i.groupNotes!
		}
		arryForTable = damn
	}
}

extension DetailGroupList: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return arryForTable.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailGroupListCell {
			cell.titleOfGroupedNotes.text = arryForTable[indexPath.row].noteTitle
			
			cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
			return cell
		}
		
		return UITableViewCell()
	}
	
	
	
	
	
}
