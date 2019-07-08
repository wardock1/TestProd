//
//  DetailGroup.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 05/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class DetailGroup: UIViewController {
	
	var detailGroup = [GroupNote]()
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
	}
	
}

extension DetailGroup: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return detailGroup.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "detalViewCell", for: indexPath) as? DetailGroupCell {
			cell.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
			cell.titleLabel.text = detailGroup[indexPath.row].groupTitle
			cell.descriptionLabel.text = detailGroup[indexPath.row].groupDescription
			
			return cell
		}
		
		return UITableViewCell()
	}
	
	
}
