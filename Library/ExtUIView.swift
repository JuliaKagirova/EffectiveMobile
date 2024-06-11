//
//  ExtUIView.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit


public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for i in subviews {
            self.addSubview(i)
        }
    }
    
    func mask() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
extension UICollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

