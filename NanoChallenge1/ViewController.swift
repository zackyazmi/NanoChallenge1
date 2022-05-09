//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Zacky Ilahi Azmi on 28/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, addItemDelegate {
    
    @IBOutlet var table: UITableView!
    
    var arrOfClothe: [Clothe]?
    
    var feeder = ClotheFeeder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrOfClothe = feeder.getClothe()
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.reloadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addPhoto))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoPage" {
            guard let vc = segue.destination as? AddPhotoViewController else{
                fatalError("Destination is misisng")
            }
            vc.delegate = self
        }
    }
    
    // Table
    @objc func addPhoto() {
        performSegue(withIdentifier: "AddPhotoPage", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfClothe?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.titleSection.text = arrOfClothe?[indexPath.row].title
        cell.configure(with: (arrOfClothe?[indexPath.row].content)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func getItem(_ category: Int, content: Model) {
        print(content)
        arrOfClothe?[category].content.append(content)
        self.table.reloadData()
    }
}
