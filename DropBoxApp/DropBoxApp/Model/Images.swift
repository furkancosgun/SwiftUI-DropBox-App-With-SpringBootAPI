//
//  ImageData.swift
//  DropBoxApp
//
//  Created by Furkan on 11.12.2022.
//

import Foundation

struct ImageData: Codable {
    let id: Int?
    let name, type, fileUrl: String?
}

typealias Images = [ImageData]
