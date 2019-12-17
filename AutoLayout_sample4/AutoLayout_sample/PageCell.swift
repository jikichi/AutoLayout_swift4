//
//  PageCell.swift
//  AutoLayout_sample
//
//  Created by jikichi on 2019/11/19.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let turtlerockImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "turtlerock"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // 表示画面のき向きに関わらずアスペクト比を統一する
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games !!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        setupLayout()
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.addSubview(turtlerockImageView)
        turtlerockImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        turtlerockImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        turtlerockImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(codr:) has not been implemented")
    }
}
