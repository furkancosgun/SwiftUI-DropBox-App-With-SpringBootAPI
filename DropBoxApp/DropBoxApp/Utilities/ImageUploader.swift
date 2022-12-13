//
//  ImageUploader.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import Foundation
import SwiftUI
import Alamofire
import MultipartFormData

struct ImageUploader{
    static func uploadImage(image:UIImage,uid:Int,completion : @escaping(Double)->Void){

        guard let img = image.jpegData(compressionQuality: 0.5) else {return}
        
        let imgId = NSUUID().uuidString

        let params: Parameters = [ "file": image ]
       
        AF.upload(multipartFormData: { multiPart in
               for (key, value) in params {
                   if let temp = value as? String {
                       multiPart.append(temp.data(using: .utf8)!, withName: key)
                   }
                   if let temp = value as? Int {
                       multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                   }
                   if let temp = value as? NSArray {
                       temp.forEach({ element in
                           let keyObj = key + "[]"
                           if let string = element as? String {
                               multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                           } else
                               if let num = element as? Int {
                                   let value = "\(num)"
                                   multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                           }
                       })
                   }
               }
            multiPart.append(img, withName: "file", fileName: imgId+".jpeg", mimeType: "image/jpeg")
        }, with: try! URLRequest(url: URL(string: APIPath.upload.path+uid.formatted())!, method: .post) )
               .uploadProgress(queue: .main, closure: { progress in
                   print("Upload Progress: \(progress.fractionCompleted)")
                   completion(progress.fractionCompleted)
               }).responseJSON(completionHandler: { data in
                   print("DATA",data.response)
               })
    }
}
