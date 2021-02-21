//
//  PostCell.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    var post: Post
    
    var body: some View {
        HStack{
            if post.imgUrl != nil {
                WebImage(url: URL(string: post.imgUrl!))
                    .resizable()
                    .frame(height:100).frame(width:100)
            }else{
                Image("ic_profile").resizable().frame(height:100).frame(width:100)
            }
            VStack(alignment: .leading){
                HStack {
                    Text("\(post.fname!) \(post.lname!)".uppercased())
                        .fontWeight(.bold)
                }.foregroundColor(.red)
                Text(post.phone!).padding(.top,5)
            }.padding()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(fname: "Firstname", lname: "Lastname", phone: "Phone"))
    }
}
