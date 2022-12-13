//
//  RegisterView.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var authViewModel = AuthViewModel(service: AuthService())
    @Environment(\.presentationMode) var mode
    @State var email = ""
    @State var password = ""
    @State var password2 = ""
    @State private var showAlert = false
    var body: some View {
        VStack(alignment: .leading,spacing: 40){
            Spacer()
            
            
            registerTitle
     
            forms.foregroundColor(.white)
           
            Button{
                authViewModel.register(email: email, password: password,password2: password2)
                showAlert = true
            }label: {
                Text("Register")
                    .bold()
                    .frame(width: UIScreen.main.bounds.width / 1.1,height: UIScreen.main.bounds.height / 15)
                    .background(.white)
                    .foregroundColor(.indigo)
                    .clipShape(RoundedShape(corners: [.allCorners], radius: CGSize(width: 10, height: 10)))
            }
            if let user =  authViewModel.user {
                Text("")
                    .alert(isPresented: $showAlert) {
                           Alert(
                               title: Text("Succes"),
                               message: Text("You have successfully registered \n"+user.email)
                           )
                       }
            
            }
                    
   
            
            HStack{
                Spacer()
                Text("Already have an account?")
                    .foregroundColor(.white.opacity(0.8))
                    .font(.headline)
                Button{
                    mode.wrappedValue.dismiss()
                }label: {
                    Text("Login")
                        .bold()
                        .font(.headline)
                }.foregroundColor(.white)
               
                
                Spacer()
            }
            Spacer()
            
            
        }.padding()
            .ignoresSafeArea()
            .background(.indigo)
            .navigationBarBackButtonHidden(true)
        
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView{
    var registerTitle : some View {
        VStack(alignment: .leading){
            Text("Register")
                .font(.largeTitle)
                .bold().foregroundColor(.white)
       
                
            Text("Please enter details to register")
                .foregroundColor(.white.opacity(0.7))
        }
    }
    
    var forms : some View{
        VStack(alignment: .leading,spacing: 20){
            
            
            CustomTextField(text: $email, title: "Email..", icon: "person", isSecure: false,color: .white)
            
            CustomTextField(text: $password, title: "Password..", icon: "lock", isSecure: true,color: .white)
            
            CustomTextField(text: $password2, title: "Password Again..", icon: "lock", isSecure: true,color: .white)
            
        }
    }

}
