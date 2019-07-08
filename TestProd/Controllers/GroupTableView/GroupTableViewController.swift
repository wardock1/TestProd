//
//  GroupTableViewController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 03/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {
	
	var groupList = [Note]()
	var newGroup = [GroupNote]()
	
	var storageLabel1: String? 
	var storagelabel2: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()

	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		CreateGroupList.closer = { data in
			self.storageLabel1 = data.groupTitle
			self.storagelabel2 = data.groupDescription
			if let iGroup = data.groupNotes {
				self.groupList = iGroup
			}
			self.nnewgroup()
			self.tableView.reloadData()
		}
	}
	
	func nnewgroup () {
		let data = GroupNote(groupTitle: storageLabel1!, groupDescription: storagelabel2!, groupNotes: groupList)
		newGroup.append(data)
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "fromCellGroupToDetail" {
			let destVC = segue.destination as? DetailGroupList
			destVC?.arry = newGroup
			destVC?.titleStorage = storageLabel1
			destVC?.descriptionStorage = storagelabel2
		}
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return newGroup.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "groupTableViewCell", for: indexPath) as? GroupTableViewCell {
			cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
//			cell.grouptitleLabel.text = storageLabel1
//			cell.groupdescriptionLabel.text = storagelabel2
			cell.grouptitleLabel.text = newGroup[indexPath.row].groupTitle
			cell.groupdescriptionLabel.text = newGroup[indexPath.row].groupDescription
			
			return cell
		}
		
		return UITableViewCell()
	}
}
