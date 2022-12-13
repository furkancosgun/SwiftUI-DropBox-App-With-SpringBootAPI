//
//  HomeViewModel.swift
//  DropBoxApp
//
//  Created by Furkan on 12.12.2022.
//

import Foundation

class HomeViewModel : ObservableObject{
    @Published var images :  Images?
    @Published var user : User?
    private var service : FileService
    
    init(fileService: FileService,user:User) {
        self.service = fileService
        self.user = user
        getAllImages(uid: user.id)
        print("HomeViewModel Worked")
    }
    func getAllImages(uid : Int){
        print("Get All Images Calisti")
        service.getAllImages(uid: uid.formatted()) { Images in
           
            self.images = Images
        }
    }
}
