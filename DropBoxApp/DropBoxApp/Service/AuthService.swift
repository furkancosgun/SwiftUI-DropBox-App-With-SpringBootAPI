//
//  AuthService.swift
//  DropBoxApp
//
//  Created by Furkan on 11.12.2022.
//

import Foundation
import Alamofire

class AuthService{
  
    init(){
        print("Serivce Online")
    }
    func login(email:String,password:String,completion: @escaping(User)->Void){
        
        let params: Parameters = [
            "email": email.lowercased(),
                "password":password
                ]
        
        
        AF.request(APIPath.login.path,method: .post, parameters:params,encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            print(response)
            guard let data = response.value else {return}
            completion(data)
            
        }
    }
    
    func register(email:String,password:String,completion: @escaping(User)->Void){
        
        let params: Parameters = [
            "email": email.lowercased(),
                "password":password
                ]
        AF.request(APIPath.register.path,method: .post, parameters:params,encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            print(response)
            guard let data = response.value else {return}
            completion(data)
        }
    }
}


