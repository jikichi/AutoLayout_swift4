//
//  ViewController.swift
//  AutoLayout_sample
//
//  Created by 高江洲順吉 on 2019/11/19.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tutlerockImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "turtlerock"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games !!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tutlerockImageView)
        view.addSubview(descriptionTextView)
        // imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        setupLayout()
        
    }

    private func setupLayout() {
        tutlerockImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tutlerockImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tutlerockImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tutlerockImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: tutlerockImageView.bottomAnchor, constant: 120).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

