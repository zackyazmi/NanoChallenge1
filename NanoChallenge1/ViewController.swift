//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Zacky Ilahi Azmi on 28/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var clothe: [Clothe] = [Clothe(type: "Layers",
                                   content: [Model(text: "First", imageName: "layers1"),
                                             Model(text: "Second", imageName: "layers2"),
                                             Model(text: "Third", imageName: "layers3"),
                                             Model(text: "Fourth", imageName: "layers4"),
                                             Model(text: "Fifth", imageName: "layers5")],
                                   title: "Layers"),
                            Clothe(type: "Shirts",
                                   content: [Model(text: "First", imageName: "shirts1"),
                                             Model(text: "Second", imageName: "shirts2"),
                                             Model(text: "Third", imageName: "shirts3"),
                                             Model(text: "Fourth", imageName: "shirts4"),
                                             Model(text: "Fifth", imageName: "shirts5")],
                                   title: "Shirts"),
                            Clothe(type: "Pants",
                                   content: [Model(text: "First", imageName: "pants1"),
                                             Model(text: "Second", imageName: "pants2"),
                                             Model(text: "Third", imageName: "pants3"),
                                             Model(text: "Fourth", imageName: "pants4"),
                                             Model(text: "Fifth", imageName: "pants5")],
                                   title: "Pants"),
                            Clothe(type: "Shoes",
                                   content: [Model(text: "First", imageName: "shoes1"),
                                             Model(text: "Second", imageName: "shoes2"),
                                             Model(text: "Third", imageName: "shoes3"),
                                             Model(text: "Fourth", imageName: "shoes4"),
                                             Model(text: "Fifth", imageName: "shoes5")],
                                   title: "Shoes")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.reloadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addPhoto))
    }
    
    // Table
    @objc func addPhoto() {
        performSegue(withIdentifier: "AddPhotoPage", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.titleSection.text = self.clothe[indexPath.row].title
        cell.configure(with: self.clothe[indexPath.row].content)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    
}

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
