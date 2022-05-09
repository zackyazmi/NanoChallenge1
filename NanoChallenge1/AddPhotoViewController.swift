//
//  AddPhotoViewController.swift
//  NanoChallenge1
//
//  Created by Zacky Ilahi Azmi on 29/04/22.
//

import Photos
import PhotosUI
import UIKit

protocol addItemDelegate {
    func getItem(_ category:Int, content: Model)
}

class AddPhotoViewController: UIViewController, PHPickerViewControllerDelegate {

    var delegate: addItemDelegate?
    
    @IBOutlet weak var layersCtg: CheckBox!
    @IBOutlet weak var shirtsCtg: CheckBox!
    @IBOutlet weak var pantsCtg: CheckBox!
    @IBOutlet weak var shoesCtg: CheckBox!
    
    @IBOutlet weak var itemName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func addItem(_ sender: Any) {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = .images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else {
                    return
                }
                print(image)
            }
        }
    }
    
    
    @IBAction func saveItem(_ sender: Any) {
        var category: Int = 0
        if layersCtg.isChecked {
            category = 0
        } else if shirtsCtg.isChecked {
            category = 1
        } else if pantsCtg.isChecked {
            category = 2
        } else if shoesCtg.isChecked {
            category = 3
        }
        guard let itemTitle = itemName.text else {
            fatalError("Item Name is Nil")
        }
        delegate?.getItem(category, content: Model(text: itemTitle, imageName: "layers1"))
        
        self.dismiss(animated: true)
    }
    
    
}
