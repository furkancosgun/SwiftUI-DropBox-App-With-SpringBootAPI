//
//  RoundedShape.swift
//  DropBoxApp
//
//  Created by Furkan on 8.12.2022.
//


import Foundation
import SwiftUI
struct RoundedShape : Shape{
    var corners : UIRectCorner
    var radius : CGSize
    
    func path(in rect:CGRect) ->Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,cornerRadii: radius)
        
        return Path(path.cgPath)
    }
}
