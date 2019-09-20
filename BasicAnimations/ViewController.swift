//
//  ViewController.swift
//  BasicAnimations
//
//  Created by John Kouris on 9/19/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureRedView()
        configureLabel()
        configureButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        label.center = view.center
    }
    
    func configureRedView() {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding the redView as a subview of the view controller's view
        view.addSubview(redView)
        view.addSubview(blueView)
        
//        let leadingConstraint = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 30)
//        let verticalConstraint = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
//        let heightConstraint = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//        let aspectRatioConstraint = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1, constant: 0)
        
        let leadingConstraint = redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        let verticalConstraint = redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let heightConstraint = redView.heightAnchor.constraint(equalToConstant: 100)
        let aspectRatioConstraint = redView.widthAnchor.constraint(equalTo: redView.heightAnchor)
        
        let leadingBlueConstraint = blueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        let verticalBlueConstraint = blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 30)
        let heightBlueConstraint = blueView.heightAnchor.constraint(equalToConstant: 100)
        let aspectRatioBlueConstraint = blueView.widthAnchor.constraint(equalTo: redView.heightAnchor)
        
        NSLayoutConstraint.activate([
            leadingConstraint,
            verticalConstraint,
            heightConstraint,
            aspectRatioConstraint,
            leadingBlueConstraint,
            verticalBlueConstraint,
            heightBlueConstraint,
            aspectRatioBlueConstraint
        ])
    }
    
    func configureLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        
        label.text = "👨‍💻"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
    }
    
    func configureButtons() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        ])
    }
    
}

