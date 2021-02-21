//
//  RealtimeStore.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase

class RealtimeStore: ObservableObject {
    var ref: DatabaseReference = Database.database().reference(withPath: "posts")
    @Published var items: [Post] = []
    
    func storePost(post: Post, completion: @escaping (_ success: Bool) -> ()) {
        var success = true
        let toBePosted = ["fname": post.fname!, "lname": post.lname!, "phone": post.phone!, "imgUrl": post.imgUrl!]
        
        ref.childByAutoId().setValue(toBePosted){ (error, ref) -> Void in
            if error != nil{
                success =  false
            }
        }
        completion(success)
    }
    
    func loadPosts(completion: @escaping () -> ()) {
        ref.observe(DataEventType.value) { (snapshot) in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    let value = snapshot.value as? [String: AnyObject]
                    let fname = value!["fname"] as? String
                    let lname = value!["lname"] as? String
                    let phone = value!["phone"] as? String
                    let imgUrl = value!["imgUrl"] as? String
                    self.items.append(Post(fname: fname, lname: lname, phone: phone, imgUrl: imgUrl))
                }
            }
            completion()
        }
    }
}
