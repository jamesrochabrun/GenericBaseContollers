//
//  BaseTableViewSearchController.swift
//  GenericBaseContollers
//
//  Created by James Rochabrun on 7/8/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewSearchController<T: BaseTableViewCell<V>, V>: UITableViewController, UISearchBarDelegate where V: Searchable {
    
    private var strongDataSource: GenericTableViewDataSource<T, V>?
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var models: [V] = [] {
        didSet {
            DispatchQueue.main.async {
                self.strongDataSource = GenericTableViewDataSource(models: self.models, configureCell: { cell, model in
                    cell.item = model
                    return cell
                })
                self.tableView.dataSource = self.strongDataSource
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self)
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        strongDataSource?.search(query: searchText)
        self.tableView.reloadData()
    }
}
