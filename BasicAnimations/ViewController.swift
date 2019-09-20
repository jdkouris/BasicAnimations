//
//  ViewController.swift
//  BasicAnimations
//
//  Created by John Kouris on 9/19/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRedView()
    }
    
    func configureRedView() {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding the redView as a subview of the view controller's view
        view.addSubview(redView)
        
        let leadingConstraint = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 30)
        let verticalConstraint = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let aspectRatioConstraint = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([leadingConstraint, verticalConstraint, heightConstraint, aspectRatioConstraint])
    }


}

