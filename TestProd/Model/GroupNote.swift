//
//  GroupNote.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 05/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import Foundation

struct GroupNote {
	
	var groupTitle: String?
	var groupDescription: String?
	var groupNotes: [Note]?
	
	init(groupTitle: String, groupDescription: String, groupNotes: [Note]) {
		self.groupTitle = groupTitle
		self.groupDescription = groupDescription
		self.groupNotes = groupNotes
	}
	
}
