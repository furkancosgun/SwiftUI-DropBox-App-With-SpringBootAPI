//
//  ApiEndpoints.swift
//  DropBoxApp
//
//  Created by Furkan on 13.12.2022.
//

import Foundation

enum APIPath {
    case login
    case register
    case getImages
    case upload
    
    var path : String{
        let base = "http://localhost:8080/api/"
        switch self{
        case .login : return base+"auth/login"
        case .register : return base+"auth/register"
        case .upload : return base+"files/upload/"
        case .getImages: return base+"files?userId="
        }
    }
}
