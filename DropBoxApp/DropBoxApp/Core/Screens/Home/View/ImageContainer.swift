//
//  ImageContainer.swift
//  DropBoxApp
//
//  Created by Furkan on 12.12.2022.
//

import SwiftUI
import Kingfisher
struct ImageContainer: View {
    var image : ImageData
    var body: some View {
        VStack{
            NavigationLink{
                PreviewView(imageUrl: image.fileUrl!)
            }label: {
                KFImage(URL(string: image.fileUrl!))
                    .resizable()
                    .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 3.5)
                    .scaledToFill()
                            .padding()
                
            }
            Divider()
        }
    }
}


 struct ImageContainer_Previews: PreviewProvider {
 static var previews: some View {
     ImageContainer(image: ImageData(id: 1, name: "", type: "", fileUrl: "localhost:8080/api/files/2"))
 }
 }
 
