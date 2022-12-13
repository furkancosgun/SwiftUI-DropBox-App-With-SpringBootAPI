//
//  ContentView.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authViewModel = AuthViewModel(service: AuthService())
    var body: some View {
     
                LoginView()
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
