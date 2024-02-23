//
//  Model.swift
//  ProductList
//
//  Created by Ozan  Doruk on 23.02.2024.
//

import Foundation

struct Model {
    var title: String?
    var description: String?
    var price: Int?
    var thumbnail: String?
    var images: [Images]? // "cvar" yerine "var" kullanıldı
}

struct Images {
    var image: String? // Struct içindeki değişken adı düzeltilerek "image" yapıldı
}
