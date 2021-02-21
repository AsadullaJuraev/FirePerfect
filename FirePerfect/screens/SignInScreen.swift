//
//  SignInScreen.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var email = "tezkormedia@gmail.com"
    @State var password = "123qwe"
    @State var isPre = false
    @State var errtext = ""
    
    func doSignIn(){
        isLoading = true
        SessionStore().signIn(email: email, password: password, handler: {(res,err) in
            isLoading = false
            if err != nil {
                errtext = "Check email or password"
                return
            }
            print("User signed in")
            session.listen()
        })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Text("Welcome Back").font(.system(size: 30)).foregroundColor(.red)
                    TextField("Email", text: $email)
                        .frame(height:45).padding(.leading, 15)
                        .background(Color.gray.opacity(0.2)).cornerRadius(25)
                    SecureField("Password", text: $password)
                        .frame(height:45).padding(.leading, 15)
                        .background(Color.gray.opacity(0.2)).cornerRadius(25)
                    Button(action: {
                        doSignIn()
                    }, label: {
                        Spacer()
                        Text("Sign In").foregroundColor(.white)
                        Spacer()
                    }).frame(height:45).background(Color.red).cornerRadius(25)
                    Text(errtext).foregroundColor(.red).padding()
                    Spacer()
                    VStack {
                        Spacer()
                        HStack{
                            Text("Don't have an account?")
                            Button(action: {
                                isPre.toggle()
                            }, label: {
                                Text("Sign Up")
                            }).padding(.leading, -5).foregroundColor(.red)
                            .sheet(isPresented: $isPre, content: {
                                SignUpScreen()
                            })
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

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
