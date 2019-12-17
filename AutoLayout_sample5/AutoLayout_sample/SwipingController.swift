//
//  SwipingController.swift
//  AutoLayout_sample
//
//  Created by jikichi on 2019/11/19.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    // 
    let pages = [Page(imageName: "strong0_0", headerText: "STRONGZERO:ビターレモン", bodyText: "ビターレモン"),
        Page(imageName: "strong0_1", headerText: "STRONGZERO: DRY", bodyText: "dry"),
        Page(imageName: "strong0_2", headerText: "STRONGZERO: 白桃", bodyText: "もももももももも"),
        Page(imageName: "strong0_3", headerText: "STRONGZERO: 巨峰グレープ", bodyText: "巨峰グレープの香り"),
        Page(imageName: "strong0_4", headerText: "STRONGZERO: シークァーサー", bodyText: "沖縄の香り"),
        Page(imageName: "strong0_5", headerText: "STRONGZERO: ダブルレモン", bodyText: "double Lemon"),
        Page(imageName: "strong0_6", headerText: "STRONGZERO: ビターライム", bodyText: "ビターなお味"),
        Page(imageName: "strong0_7", headerText: "STRONGZERO: ビターオレンジ", bodyText: "ビターなorange"),
        Page(imageName: "strong0_8", headerText: "STRONGZERO: グレープフルーツ", bodyText: "グレープフルーツの香り"),
        Page(imageName: "strong0_9", headerText: "STRONGZERO: 梅", bodyText: "うめ〜〜〜〜〜〜〜〜！")]
    
    // make sure you apply the correct encapsulation princples in your classes
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    @objc private func handlePrev() {
//        print("Trying to adcance to prev")
        
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    @objc private func handleNext() {
//        print("Trying to adcance to next")
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
//        print(pages.page.headerText[nextIndex])
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        //        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        //        bottomControlsStackView.axis = .vertical
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            //            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        print(pages.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
}

