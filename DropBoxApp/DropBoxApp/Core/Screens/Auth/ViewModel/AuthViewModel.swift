//
//  LogimViewModel.swift
//  DropBoxApp
//
//  Created by Furkan on 11.12.2022.
//

import Foundation

class AuthViewModel : ObservableObject{
    @Published var user :  User?
    private var service : AuthService
    
    init(service: AuthService) {
        self.service = service
    }
    
    
    func login(email:String,password:String){
        service.login(email: email, password: password) { User in
            self.user = User
            HomeViewModel(fileService: FileService(),user: User)
            print("LOGIN USER:"+User.email)
        }
    }
    
    func register(email:String,password:String,password2:String){
        if !password.isEmpty{
            if password == password2{
                service.register(email: email, password: password) { User in
                    print("REGISTER USER:"+User.email)
                    self.user = User
                }
            }
        }
       
    }
}
