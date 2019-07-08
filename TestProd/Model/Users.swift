//
//  Users.swift
//  TestProd
//
//  Created by Dmitry Kutlyev on 07/07/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import Foundation

struct Users {
	
	var email: String?
	var name: String?
	
	init(email: String, name: String) {
		self.email = email
		self.name = name
	}
}
