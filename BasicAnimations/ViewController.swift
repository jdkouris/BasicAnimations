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
        let rotateButton = UIButton(type: .system)
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let keyButton = UIButton(type: .system)
        keyButton.setTitle("Key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        
        let springButton = UIButton(type: .system)
        springButton.setTitle("Spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        
        let squashButton = UIButton(type: .system)
        squashButton.setTitle("Squash", for: .normal)
        squashButton.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        
        let anticButton = UIButton(type: .system)
        anticButton.setTitle("Antic", for: .normal)
        anticButton.addTarget(self, action: #selector(anticButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(keyButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(squashButton)
        stackView.addArrangedSubview(anticButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func rotateButtonTapped() {
        // rotate clockwise 45 degrees
        UIView.animate(withDuration: 1, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        }) { (_) in
            // rotate counter-clockwise 45 degrees
            UIView.animate(withDuration: 1, animations: {
                self.label.transform = .identity
            })
        }
    }
    
    @objc func keyButtonTapped() {
        label.center = view.center
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            
            // rotate clockwise 45 degrees
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            })
            
            // rotate counter-clockwise 45 degrees
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.label.transform = .identity
            })
            
            // move up by some points
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.label.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 60)
            })
            
            // move back back down by same number of points
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.label.center = self.view.center
            })
            
        }, completion: nil)
    }
    
    @objc func springButtonTapped() {
        label.center = view.center
        label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    @objc func squashButtonTapped() {
        // start offscreen
        label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let animationBlock = {
            // animate down to center
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
                self.label.center = self.view.center
            })
            
            // squish horizontally (springy)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            })
            
            // squish vertically (springy)
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15, animations: {
                self.label.transform = .identity
            })
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    @objc func anticButtonTapped() {
        label.center = view.center
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.1, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/16)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: -1 * CGFloat.pi/16)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8, animations: {
                self.label.center = CGPoint(x: self.view.bounds.size.width + self.label.bounds.size.width, y: self.view.center.y)
            })
            
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations: animBlock, completion: nil)
    }
    
}

