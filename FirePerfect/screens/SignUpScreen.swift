//
//  SignUpScreen.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//
import SwiftUI

struct SignUpScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    
    func doSignUp(){
        isLoading = true
        SessionStore().signUp(email: email, password: password, handler: {(res, err) in
            isLoading = false
            if err != nil {
                print("User not created")
                return
            }
            print("User created")
            presentation.wrappedValue.dismiss()
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    Spacer()
                    Text("Create your account").font(.system(size: 30)).foregroundColor(.red)
                    TextField("Fullname", text: $fullname).frame(height:45).padding(.leading, 15).background(Color.gray.opacity(0.2)).cornerRadius(25)
                    TextField("Email", text: $email).frame(height:45).padding(.leading, 15).background(Color.gray.opacity(0.2)).cornerRadius(25)
                    SecureField("Password", text: $password).frame(height:45).padding(.leading, 15).background(Color.gray.opacity(0.2)).cornerRadius(25)
                    Button(action: {
                        doSignUp()
                        
                    }, label: {
                        Spacer()
                        Text("Sign Up").foregroundColor(.white)
                        Spacer()
                    }).frame(height: 45).background(Color.red).cornerRadius(25)
                    Spacer()
                    VStack {
                        Spacer()
                        HStack{
                            Text("Already have an account?")
                            Button(action: {
                                presentation.wrappedValue.dismiss()
                            }, label: {
                                Text("Sign In")
                            }).padding(.leading, -5).foregroundColor(.red)
                            
                        }.font(.system(size: 13))
                    }.frame(maxWidth: .infinity, maxHeight: 200)
                }.padding()
                if isLoading {
                    ProgressView()
                }
            }
            
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
