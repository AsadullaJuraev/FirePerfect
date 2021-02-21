//
//  StarterScreen.swift
//  FirePerfect
//
//  Created by Asadulla Juraev on 19.02.2021.
//

import SwiftUI

struct StarterScreen: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack{
            if self.session.session != nil {
                HomeScreen()
            }else{
                SignInScreen()
            }
        }.onAppear{
            session.listen()
        }
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterScreen()
    }
}
