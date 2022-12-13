//
//  LoginView.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//

import SwiftUI


struct LoginView: View {
    @State var loading = false
    @State var email : String = "furkan51cosgun@gmail.com"
    @State var password : String = "furkan123"
    @ObservedObject var authViewModel = AuthViewModel(service: AuthService())
    
    var body: some View {
        VStack(alignment: .leading){
                Text("Login")
                    .font(.largeTitle)
                    .foregroundColor(.indigo)
                    .bold()
            
            Text("Please login to your account")
                .foregroundColor(.gray)
                .padding(.bottom,50)
        
            
            VStack(alignment: .leading){
                CustomTextField(text: $email, title: "Email",icon: "person", isSecure: false)
                    
                Spacer().frame(height: 30)
                CustomTextField(text: $password, title: "Password",icon: "lock", isSecure: true)
            }
           
            
            Spacer().frame(height: 50)
            
            if authViewModel.user == nil{
                Button{
                    print("LOG:Login Clicked")
                    authViewModel.login(email: email, password: password)
                }label: {
                    Text("LOGIN")
                        .frame(width: UIScreen.main.bounds.width / 1.1,height: UIScreen.main.bounds.height / 15)
                        .background(.indigo)
                        .foregroundColor(.white)
                        .clipShape(RoundedShape(corners: [.allCorners], radius: CGSize(width: 5, height: 5)))
                        .bold()
                }
            }else{
                NavigationLink{
                    HomeView(user: authViewModel.user!)
                }label: {
                    Text("GO HOME")
                        .frame(width: UIScreen.main.bounds.width / 1.1,height: UIScreen.main.bounds.height / 15)
                        .background(.indigo)
                        .foregroundColor(.white)
                        .clipShape(RoundedShape(corners: [.allCorners], radius: CGSize(width: 5, height: 5)))
                        .bold()
                }
            }
            
            
            
            HStack{
                VStack{
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
                
                Text("OR")
                    .font(.title).foregroundColor(.indigo)
                
                VStack{
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                }
            }
            
                
            HStack(alignment: .center){
                Spacer()
                Text("Don't have any accoun?")
                
                NavigationLink{
                    RegisterView()
                }label: {
                    Text("Register")
                        .bold()
                        .foregroundColor(.indigo)
                }
               
                Spacer()
            }
                       
            
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(email:"Furkan51cosgun@gmail.com",password: "1234567890")
    }
}
