//
//  Clothe.swift
//  NanoChallenge1
//
//  Created by Zacky Ilahi Azmi on 06/05/22.
//

import Foundation

struct Model {
    var text: String
    var imageName: String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}

struct Clothe {
    var type: String
    var content: [Model]
    var title: String
}
