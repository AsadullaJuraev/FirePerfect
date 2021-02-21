//
//  Post.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import Foundation

struct Post: Hashable {
    var fname: String?
    var lname: String?
    var phone: String?
    var imgUrl: String?
    
    init(fname: String?, lname: String?, phone: String?) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
    }
    
    init(fname: String?, lname: String?, phone: String?, imgUrl: String?) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.imgUrl = imgUrl
    }
}
