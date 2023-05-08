//
//  CustomCell.swift
//  TabBarScrollToTop
//
//  Created by Brendon Crowe on 5/8/23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    public lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(cellLabel)
        cellLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    public func configureCell(row number: String) {
        cellLabel.text = number
    }
}
