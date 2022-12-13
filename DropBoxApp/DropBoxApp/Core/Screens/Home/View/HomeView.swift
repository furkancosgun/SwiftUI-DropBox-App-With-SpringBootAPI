//
//  HomeView.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import SwiftUI
import Kingfisher
struct HomeView: View {
    @State private var showNewImageScreen = false
    @State private var text = ""
    var user : User
    @ObservedObject private var homeViewModel : HomeViewModel
    
    init(user : User){
        self.user = user
        homeViewModel =  HomeViewModel(fileService: FileService(),user: user)
    }
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    homeViewModel.getAllImages(uid: user.id)
                }label: {
                    Image(systemName: "arrow.counterclockwise")
                        .resizable()
                        .frame(width: 25,height: 30)
                        .padding(.horizontal)
                }
                Spacer()
                Button{
                    showNewImageScreen = true
                }label: {
                    Image(systemName: "square.grid.3x1.folder.badge.plus")
                        .resizable()
                        .frame(width: 30,height: 25)
                        .padding(.horizontal)
                }
            }
            .foregroundColor(.indigo)
            .fullScreenCover(isPresented: $showNewImageScreen, content:{
                ImageSave(user:user)
            })
            if let images = homeViewModel.images{
                if images.count > 0{
                    ScrollView{
                        LazyVStack{
                            ForEach(images,id:\.id){ image in
                                ImageContainer(image: image)
                            }
                        }
                    }
                }else{
                    Spacer()
                    Text("You do not have any files in the system!")
                    Spacer()
                }
            }
            else{
                Spacer()
                ProgressView()
                Spacer()
            }
          
           
        }.navigationBarBackButtonHidden(true)
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(id: 1, email: "asd"))
    }
}
