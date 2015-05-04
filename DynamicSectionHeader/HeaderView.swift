//
//  HeaderView.swift
//  DynamicSectionHeader
//
//  Created by Lammert Westerhoff on 04/05/15.
//  Copyright (c) 2015 Lammert Westerhoff. All rights reserved.
//

import UIKit

    class HeaderView: UIView {

        let titleLabel = UILabel()
        let subtitleLabel = UILabel()
        let expandButton = UIButton()
        
        var subtitleLabelHeightConstraint: NSLayoutConstraint!
        
        init() {
            super.init(frame: CGRectNull)
            
            titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
            subtitleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
            expandButton.setTranslatesAutoresizingMaskIntoConstraints(false)

            expandButton.setTitle("Expand / Collapse", forState: .Normal)
            
            addSubview(titleLabel)
            addSubview(subtitleLabel)
            addSubview(expandButton)
            
            let views = ["titleLabel": titleLabel, "subtitleLabel": subtitleLabel, "expandButton": expandButton]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[titleLabel]-[expandButton]|", options: nil, metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[subtitleLabel]|", options: nil, metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[titleLabel]-(>=0)-|", options: nil, metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(>=0)-[subtitleLabel]|", options: nil, metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[expandButton]-(>=0)-|", options: nil, metrics: nil, views: views))
            
            titleLabel.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
            subtitleLabelHeightConstraint = NSLayoutConstraint(item: subtitleLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20)
            subtitleLabel.addConstraint(subtitleLabelHeightConstraint)
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    }
