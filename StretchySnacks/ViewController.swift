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

    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Actions

    @IBAction func plusButton(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {() -> Void in
                self.navBarHeight.constant = 200
                self.view.layoutIfNeeded()
        }, completion: { finished in
        })
    }

}

