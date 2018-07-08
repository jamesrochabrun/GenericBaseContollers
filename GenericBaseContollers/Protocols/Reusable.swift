//
//  Reusable.swift
//  GenericBaseContollers
//
//  Created by James Rochabrun on 7/8/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable {}

/// MARK: - UITableView

extension Reusable where Self: UITableViewCell  {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UITableView {
    
    func register<T: UITableViewCell>(_ :T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell with identifier")
        }
        return cell
    }
}

/// MARK: - UITableView

extension Reusable where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UICollectionViewCell: Reusable {}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ :T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell with identifier")
        }
        return cell
    }
}

