//
//  UITableView+Utility.swift
//  Makestagram2
//
//  Created by Mark Wang on 7/6/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension CellIdentifiable where Self: UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellIdentifiable {}

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: CellIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
            fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }
        
        return cell
    }
}