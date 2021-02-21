//
//  User.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import Foundation

struct User {
    var uid: String?
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
    
}
