//
//  CustomTextField.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text : String
    var title : String
    var icon : String
    var isSecure : Bool
    var color : Color = .black
    var body: some View {
        VStack{
            HStack(spacing: 20){
                    Image(systemName:icon)
                        .resizable()
                        .frame(width: 18,height: 20).foregroundColor(color)
                 
                if isSecure{
                    SecureField(title,text: $text).foregroundColor(color)
                        .placeholder(when: text.isEmpty, placeholder: {
                            Text(title).foregroundColor(color.opacity(0.7))
                        })
                }else{
                    TextField(title,text: $text).foregroundColor(color)
                        .placeholder(when: text.isEmpty, placeholder: {
                            Text(title).foregroundColor(color.opacity(0.7))
                        })
                }
            }.padding(.horizontal)
            Divider()
        }
     
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("Furkan"), title: "Username", icon: "person",isSecure: false)
    }
}
