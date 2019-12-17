//
//  ViewController.swift
//  AutoLayout_sample
//
//  Created by 高江洲順吉 on 2019/11/19.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        
//        textView.text = "Join us today in our fun and games !!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        // textView.contentMode = .scaleAspectFit
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        view.addSubview(turtlerockImageView)
        view.addSubview(descriptionTextView)
        // imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        setupLayout()
        
    }

    private func setupLayout() {
        /* ep2 */
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        
//        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.addSubview(turtlerockImageView)
        turtlerockImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        turtlerockImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        turtlerockImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        
//        turtlerockImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        turtlerockImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        turtlerockImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        turtlerockImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

