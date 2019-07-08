//
//  ListTableViewController.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 03/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit


class ListTableViewController: UITableViewController {
	
	var listStorageTitleLabel: String = ""
	var listStorageDescLabel: String = ""
	
	@IBOutlet var listTableView: UITableView!
	
	var displayedNotes = [Note]() {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
			
		}
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		listTableView.dataSource = self
		listTableView.delegate = self
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		displayedNotes = ListNotes.shared.listOfNotes
		tableView.reloadData()
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "fromListNoteToAbout") {
				let noteAbout = segue.destination as! NoteAboutViewController
			noteAbout.storageLabelTitle = listStorageTitleLabel
			noteAbout.storageDescpLabel = listStorageDescLabel
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayedNotes.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath) as? ListTableViewCell {
			
			cell.titleLabelCell.text = displayedNotes[indexPath.row].noteTitle
			cell.descriptionLabelCell.text = displayedNotes[indexPath.row].noteDescription
			cell.markerImage.image = displayedNotes[indexPath.row].marker
			
			
//			cell.titleLabelCell.text = ListNotes.shared.listOfNotes[indexPath.row].noteTitle
//			cell.descriptionLabelCell.text = ListNotes.shared.listOfNotes[indexPath.row].noteDescription
			
			return cell
		}
		
        return UITableViewCell()
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		listStorageTitleLabel = self.displayedNotes[indexPath.row].noteTitle!
		listStorageDescLabel = self.displayedNotes[indexPath.row].noteDescription!
		performSegue(withIdentifier: "fromListNoteToAbout", sender: self)
		
	}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
            // Delete the row from the data source
//			tableView.deleteRows(at: ListNotes.shared.listOfNotes[indexPath.row], with: .fade)
//        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

