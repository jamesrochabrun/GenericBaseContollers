//
//  BaseCollectionViewSearchController.swift
//  GenericBaseContollers
//
//  Created by James Rochabrun on 7/8/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewSearchController<T: BaseCollectionViewCell<V>, V>: UICollectionViewController, UISearchBarDelegate where V: Searchable {
    
    private var strongDataSource: GenericCollectionViewDataSource<T, V>?
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var models: [V] = [] {
        didSet {
            DispatchQueue.main.async {
                self.strongDataSource = GenericCollectionViewDataSource(models: self.models, configureCell: { cell, model in
                    cell.item = model
                    return cell
                })
                self.collectionView?.dataSource = self.strongDataSource
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(T.self)
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
        self.collectionView?.reloadData()
    }
}
