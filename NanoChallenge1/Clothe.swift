//
//  Clothe.swift
//  NanoChallenge1
//
//  Created by Zacky Ilahi Azmi on 06/05/22.
//

import Foundation

struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}

struct Clothe {
    let type: String
    let content: [Model]
    let title: String
}
