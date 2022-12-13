//
//  PreviewView.swift
//  DropBoxApp
//
//  Created by Furkan on 11.12.2022.
//

import SwiftUI
import Kingfisher

struct PreviewView: View {
    var imageUrl : String
    @State private var scale: CGFloat = 1.0
       @State private var lastScale: CGFloat = 1.0
       @State private var viewState = CGSize.zero
    @Environment(\.presentationMode) private var mode
    @State private var displayMode = false
    var body: some View {
        VStack{
            HStack(spacing: 100){
            
            Button{
                mode.wrappedValue.dismiss()
            }label: {
                Text("Cancel")
            }
                
            Button{
                displayMode = !displayMode
            }label: {
                Text(displayMode ? "ScaledToFit":"ScaledToFill")
            }
                
            }
            if displayMode{
                
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .frame(width: .infinity,height: .infinity)
                    .scaledToFill().offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged { val in
                            self.viewState = val.translation
                        }
                    )
                    .gesture(MagnificationGesture()
                        .onChanged { val in
                            let delta = val / self.lastScale
                            self.lastScale = val
                            if delta > 0.94 { // if statement to minimize jitter
                                let newScale = self.scale * delta
                                self.scale = newScale
                            }
                        }
                        .onEnded { _ in
                            self.lastScale = 1.0
                        }
                    )
                    .scaleEffect(scale)
                
            }else{
                Spacer()
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .frame(width: .infinity,height: .infinity)
                    .scaledToFit().offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged { val in
                            self.viewState = val.translation
                        }
                    )
                    .gesture(MagnificationGesture()
                        .onChanged { val in
                            let delta = val / self.lastScale
                            self.lastScale = val
                            if delta > 0.94 { // if statement to minimize jitter
                                let newScale = self.scale * delta
                                self.scale = newScale
                            }
                        }
                        .onEnded { _ in
                            self.lastScale = 1.0
                        }
                    )
                    .scaleEffect(scale)
                Spacer()
            }
          
        }.navigationBarBackButtonHidden(true)
            .foregroundColor(.indigo)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fww1.prweb.com%2Fprfiles%2F2010%2F06%2F17%2F4161594%2F2_Getty04.jpg&f=1&nofb=1&ipt=2e2b5dfd78ad6f4d9baa5e245b4b99cae5e7347554c392011adde964d4b501dc&ipo=images")
    }
}
