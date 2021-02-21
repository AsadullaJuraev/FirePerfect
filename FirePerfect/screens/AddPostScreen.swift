//
//  AddPostScreen.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import SwiftUI

struct AddPostScreen: View {
    @ObservedObject var database = RealtimeStore()
    @ObservedObject var storage = StorageStore()
    @Environment(\.presentationMode) var presentation
    @State var isLoading = false
    @State var fname: String = ""
    @State var lname: String = ""
    @State var phone: String = ""
    
    @State var defImage = UIImage(imageLiteralResourceName: "ic_profile")
        @State var pickedImage: UIImage? = nil
        @State var showImagePicker: Bool = false
    
    func addNewPost(urlString: String){
        let post = Post(fname: fname, lname: lname, phone: phone, imgUrl: urlString)
        database.storePost(post: post, completion: { success in
            isLoading = false
            if success {
                self.presentation.wrappedValue.dismiss()
            }
        })
    }
    
    func uploadImage(){
        isLoading = true
        storage.uploadImage(pickedImage!, completion: {downloadURL in
            let urlString = downloadURL!.absoluteString
            print(urlString)
            addNewPost(urlString: urlString)
        })
    }
    
    var body: some View {
        ZStack{
            VStack{
                Button(action: {
                    self.showImagePicker.toggle()
                    }, label: {
                        Image(uiImage: pickedImage ?? defImage).resizable().frame(height: 100).frame(width: 100).scaledToFit()
                    })
                        .sheet(isPresented: $showImagePicker, onDismiss: {
                            self.showImagePicker = false
                        }, content: {
                            ImagePicker(image: self.$pickedImage, isShown: self.$showImagePicker)
                        })
                
                TextField("Firstname", text: $fname)
                                    .frame(height: 50).padding(.leading, 10)
                                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                TextField("Lastname", text: $lname)
                                    .frame(height: 50).padding(.leading, 10)
                                    .background(Color.gray.opacity(0.2)).cornerRadius(8)
                TextField("Phone", text: $phone)
                    .frame(height: 50).padding(.leading, 10).background(Color.gray.opacity(0.2)).cornerRadius(8)
                                
                Button(action: {
                    uploadImage()
                }, label: {
                Spacer()
                Text("Add").foregroundColor(.white)
                Spacer()
                })
                .frame(height: 45) .background(Color.red) .cornerRadius(8)
                Spacer()
                }.padding()
            if isLoading {
            ProgressView()
            }
        }
        .navigationBarTitle("Add Contact")
    }
}

struct AddPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPostScreen()
    }
}
