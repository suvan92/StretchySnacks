//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Suvan Ramani on 2016-12-08.
//  Copyright © 2016 suvanr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var customNavBar: UIView!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var stackView = UIStackView()
    var dataSource = [String]()
    var navBarTitle = UILabel()
  
    
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
        navBarTitle.text = "Add a SNACK"
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {() -> Void in
            self.navBarHeight.constant = 200
            self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.view.layoutIfNeeded()
        }, completion: { finished in
            
        })
    }
    
    func collapseNavBar() {
        self.stackView.isHidden = true
        navBarTitle.text = "SNACK"
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {() -> Void in
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
        oreoButton.addTarget(self, action: #selector (addOreoButton), for: .touchUpInside)
        let pizzaPocketButton = UIButton()
        pizzaPocketButton.setImage(pizzaPocket!, for: .normal)
        pizzaPocketButton.addTarget(self, action: #selector (addPizzaButton), for: .touchUpInside)
        let popTartsButton = UIButton()
        popTartsButton.setImage(popTarts!, for: .normal)
        popTartsButton.addTarget(self, action: #selector (addPoptartButton), for: .touchUpInside)
        let popsicleButton = UIButton()
        popsicleButton.setImage(popsicle!, for: .normal)
        popsicleButton.addTarget(self, action: #selector (addPopsicleButton), for: .touchUpInside)
        let ramenButton = UIButton()
        ramenButton.setImage(ramen!, for: .normal)
        ramenButton.addTarget(self, action: #selector (addRamenButton), for: .touchUpInside)
        
        let snackArray = [oreoButton, pizzaPocketButton, popTartsButton, popsicleButton, ramenButton]
        
        for snackButton in snackArray {
            snackButton.contentMode = .scaleAspectFit
            snackButton.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(snackButton)
            
            self.customNavBar.addConstraint(NSLayoutConstraint(item: snackButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.customNavBar, attribute: NSLayoutAttribute.width, multiplier: 0.19, constant: 0))
            
            self.customNavBar.addConstraint(NSLayoutConstraint(item: snackButton, attribute: .height, relatedBy: .equal, toItem: self.customNavBar, attribute: .height, multiplier: 0.7, constant: 0))
        }
        
        stackView.isHidden = true
        
         addNavBarTitle()
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
    
    func addNavBarTitle() {
        navBarTitle.text = "SNACKS"
        navBarTitle.translatesAutoresizingMaskIntoConstraints = false
        
        customNavBar.addSubview(navBarTitle)
        customNavBar.addConstraint(NSLayoutConstraint(item: navBarTitle, attribute: .centerX, relatedBy: .equal, toItem: customNavBar, attribute: .centerX, multiplier: 1.0, constant: 0))
        customNavBar.addConstraint(NSLayoutConstraint(item: navBarTitle, attribute: .topMargin, relatedBy: .equal, toItem: customNavBar, attribute: .topMargin, multiplier: 1.0, constant: 12))
    }
    
    // MARK: Button Actions
    
    func addOreoButton() {
        dataSource.insert("Oreo", at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func addPizzaButton() {
        dataSource.insert("Pizza Pocket", at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func addPoptartButton() {
        dataSource.insert("Poptart", at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func addPopsicleButton() {
        dataSource.insert("Popsicle", at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func addRamenButton() {
        dataSource.insert("Ramen", at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    // MARK: Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cellTitle = dataSource[indexPath.row]
        cell.textLabel?.text = cellTitle
        
        return cell
    }
    

}

