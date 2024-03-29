//
//  SwipingController+extention.swift
//  AutoLayout_sample
//
//  Created by jikichi on 2019/11/27.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

extension SwipingController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        
        }) { (strongZero_) in
        }
        collectionViewLayout.invalidateLayout()
    }
}
