//
//  SchoolCollectionViewCell.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 2/5/25.
//

import Foundation
import UIKit

class SchoolCollectionViewCell: UICollectionViewCell {
    private var school: School?
    
    private struct Constants {
        static let leftInset: CGFloat = 10
        static let rightInsets: CGFloat = 10
        static let topInset: CGFloat = 10
        static let bottomInset: CGFloat = 10
        static let borderWdith: CGFloat = 0.5
        static let imageHeight: CGFloat = 80
        static let cornerRadius: CGFloat = 10.0
        static let wrapperViewInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
    }
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        return label
    }()
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 12)
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 12)
        return label
    }()
    
    private var wrapperView: UIView = {
        let view = UIView(forAutoLayout: <#T##()#>)
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.borderWidth = Constants.borderWdith
        return view
    }()
    
    
    
}
