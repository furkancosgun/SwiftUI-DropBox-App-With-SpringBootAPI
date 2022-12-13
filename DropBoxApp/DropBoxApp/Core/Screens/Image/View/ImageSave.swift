//
//  AddImage.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import SwiftUI



import SwiftUI

struct ImageSave: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @State private var isloaded = false
    @Environment(\.presentationMode) private var mode
    let user:User
    var body: some View {
        VStack(alignment: .center){
    
            Button{
                mode.wrappedValue.dismiss()
            }label: {
                Text("Close")
                    .foregroundColor(.indigo)
            }
          
            Spacer()
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedShape(corners: [.allCorners], radius: CGSize(width: 10, height: 10)))
                }else{
                    Image(systemName: "plus.circle")
                        .resizable()
                        .padding()
                        .frame(width: 300, height: 300)
                        .background(.indigo)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }.padding()
            
            if profileImage != nil {
                Button{
                    ImageUploader.uploadImage(image: selectedImage!, uid: user.id) { progress in
                        print("PROGRESS\(progress)")
                        if progress > 0.5{
                            isloaded = true
                        }
                    }
                }label: {
                    Text("Save")
                    .padding(.vertical,12)
                    .padding(.horizontal,120)
                    .background(.indigo)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }.padding()
            }
            if isloaded{
                Text("")
                    .alert(isPresented: $isloaded) {
                            Alert(
                                title: Text("Succes"),
                                message: Text("Successfully uploaded")
                            )
                        }
            }
            Spacer()
        }
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        print("DEBUG IMAGE: \(selectedImage)")
        profileImage = Image(uiImage: selectedImage)
    }
}


struct ImageSave_Previews: PreviewProvider {
    static var previews: some View {
        ImageSave(user: User(id: 1, email: "furkan51cosgun@gmail.com"))
    }
}
