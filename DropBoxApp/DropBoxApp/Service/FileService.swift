//
//  FileService.swift
//  DropBoxApp
//
//  Created by Furkan on 12.12.2022.
//
import Alamofire
import Foundation

class FileService {
    func getAllImages(uid:String,completion: @escaping(Images)->Void){
        AF.request(APIPath.getImages.path+uid,method: .post).responseDecodable(of:Images.self) { response in
            guard let data = response.value else {return}
            completion(data)
        }
    }
    
}
