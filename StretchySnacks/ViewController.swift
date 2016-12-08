//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Suvan Ramani on 2016-12-08.
//  Copyright © 2016 suvanr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var customNavBar: UIView!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
    }

    // MARK: Actions

    @IBAction func plusButton(_ sender: UIButton) {
        if navBarHeight.constant == 64 {
            expandNavBar()
        } else if navBarHeight.constant == 200 {
            collapseNavBar()
        }
    }
    
    func expandNavBar() {
        self.stackView.isHidden = false
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {() -> Void in
            self.navBarHeight.constant = 200
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.view.layoutIfNeeded()
        }, completion: { finished in
            
        })
    }
    
    func collapseNavBar() {
        self.stackView.isHidden = true
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {() -> Void in
            self.navBarHeight.constant = 64
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
            self.view.layoutIfNeeded()
        }, completion: { finished in
        })
    }
    
    // MARK: General Methods
    
    func createStackView() {
        customNavBar.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        
        constrainStackView()
        
        let oreo = UIImage(named: "oreos")
        let pizzaPocket = UIImage(named: "pizzaPocket")
        let popTarts = UIImage(named: "popTarts")
        let popsicle = UIImage(named: "popsicle")
        let ramen = UIImage(named: "ramen")
        
        let oreoButton = UIButton()
        oreoButton.setImage(oreo!, for: .normal)
        let pizzaPocketButton = UIButton()
        pizzaPocketButton.setImage(pizzaPocket!, for: .normal)
        let popTartsButton = UIButton()
        popTartsButton.setImage(popTarts!, for: .normal)
        let popsicleButton = UIButton()
        popsicleButton.setImage(popsicle!, for: .normal)
        let ramenButton = UIButton()
        ramenButton.setImage(ramen!, for: .normal)
        
        let snackArray = [oreoButton, pizzaPocketButton, popTartsButton, popsicleButton, ramenButton]
        
        for snackButton in snackArray {
            snackButton.contentMode = .scaleAspectFit
            snackButton.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(snackButton)
            
            self.customNavBar.addConstraint(NSLayoutConstraint(item: snackButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.customNavBar, attribute: NSLayoutAttribute.width, multiplier: 0.19, constant: 0))
            
            self.customNavBar.addConstraint(NSLayoutConstraint(item: snackButton, attribute: .height, relatedBy: .equal, toItem: self.customNavBar, attribute: .height, multiplier: 0.75, constant: 0))
        }
        
        stackView.isHidden = true
        
    }
    
    func constrainStackView() {
        let leftConstraint = NSLayoutConstraint(item: stackView,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: customNavBar,
                                                attribute: .leading,
                                                multiplier: 1,
                                                constant: 10)
        
        let rightConstraint = NSLayoutConstraint(item: stackView,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: customNavBar,
                                                 attribute: .trailing,
                                                 multiplier: 1,
                                                 constant: -10)
        
        let bottomConstraint = NSLayoutConstraint(item: stackView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: customNavBar,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: -10)
        
        let heightConstraint = NSLayoutConstraint(item: stackView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 150)
        
        customNavBar.addConstraint(leftConstraint)
        customNavBar.addConstraint(rightConstraint)
        customNavBar.addConstraint(bottomConstraint)
        stackView.addConstraint(heightConstraint)
    }

}

