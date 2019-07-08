//
//  Note.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 03/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import Foundation
import UIKit

struct Note {
	
	var noteTitle: String?
	var noteDescription: String?
	var marker: UIImage?
	
	init(noteTitle: String, noteDescription: String, marker: UIImage) {
		self.noteTitle = noteTitle
		self.noteDescription = noteDescription
		self.marker = marker
	}
	
}
