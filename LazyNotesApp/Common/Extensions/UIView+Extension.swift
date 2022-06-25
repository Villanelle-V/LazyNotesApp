//
//  UIView+Extension.swift
//  LazyNotesApp
//
//  Created by Polina on 22.04.2022.
//

import Foundation
import UIKit

extension UIView {
    func addAndFill(_ subview: UIView) {
        let attributes: [NSLayoutConstraint.Attribute] = [.top, .bottom, .left, .right]
        let constraints = attributes.map {
            NSLayoutConstraint(item: subview,
                               attribute: $0,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: $0,
                               multiplier: 1,
                               constant: 0)
        }
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
        self.addConstraints(constraints)
    }
}

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
