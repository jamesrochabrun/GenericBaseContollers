//
//  ListTableViewController.swift
//  GenericBaseContollers
//
//  Created by James Rochabrun on 7/8/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewController: BaseTableViewSearchController<DogCell, Dog> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dogs = [Dog(name: "Zizou"), Dog(name: "Peluso"), Dog(name: "Cali")]
        self.models = dogs
    }
}

//// Models
struct Dog: Searchable {
    
    var query: String {
        return name
    }
    
    let name: String
}

struct DogViewModel {
    
    let name: String
    
    init(model: Dog) {
        self.name = model.name
    }
}

class DogCell: BaseTableViewCell<Dog> {
    
    override var item: Dog! {
        didSet {
            let vModel = DogViewModel(model: item)
            textLabel?.text = vModel.name
        }
    }
}














