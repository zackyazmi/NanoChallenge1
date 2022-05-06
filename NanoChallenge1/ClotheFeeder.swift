//
//  ClotheFeeder.swift
//  NanoChallenge1
//
//  Created by Zacky Ilahi Azmi on 06/05/22.
//

import Foundation

struct ClotheFeeder {
    
    func getClothe() -> [Clothe] {
        return [
            Clothe(type: "Layers", content: [Model(text: "Jacket", imageName: "layers1"),
                                             Model(text: "Sweater", imageName: "layers2"),
                                             Model(text: "Brown Sweater", imageName: "layers3"),
                                             Model(text: "Mocca Sweater", imageName: "layers4"),
                                             Model(text: "Bomber", imageName: "layers5")],
                   title: "Layers"),
            Clothe(type: "Shirts", content: [Model(text: "Brown Shirt", imageName: "shirts1"),
                                             Model(text: "White Shirt", imageName: "shirts2"),
                                             Model(text: "Black Shirt", imageName: "shirts3"),
                                             Model(text: "White Shirt 2", imageName: "shirts4"),
                                             Model(text: "Outcast Shirt", imageName: "shirts5")],
                   title: "Shirts"),
            Clothe(type: "Pants", content: [Model(text: "Black Pants", imageName: "pants1"),
                                            Model(text: "Long Jeans", imageName: "pants2"),
                                            Model(text: "Short Jeans", imageName: "pants3"),
                                            Model(text: "Acne", imageName: "pants4"),
                                            Model(text: "LV Blue", imageName: "pants5")],
                   title: "Pants"),
            Clothe(type: "Shoes", content: [Model(text: "Nike Fan", imageName: "shoes1"),
                                            Model(text: "Red Nike", imageName: "shoes2"),
                                            Model(text: "Red Vans", imageName: "shoes3"),
                                            Model(text: "Nike Air Max", imageName: "shoes4"),
                                            Model(text: "Nike Black", imageName: "shoes5")],
                   title: "Shoes")
        ]
    }
    
}
