//
//  ViewController.swift
//  DLStudio
//
//  Created by Vincent Zhou on 2018/5/17.
//  Copyright © 2018 GBS CIC iX. All rights reserved.
//

import UIKit
import CircleMenu

class ViewController: UIViewController,CircleMenuDelegate {
    
    let items: [(icon: String, color: UIColor)] = [
        ("icon_home", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
        ("icon_search", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1)),
        ("notifications-btn", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
        ("settings-btn", UIColor(red: 0.51, green: 0.15, blue: 1, alpha: 1)),
        ("nearby-btn", UIColor(red: 1, green: 0.39, blue: 0, alpha: 1)),
        ]
    
    var circleMenu: CircleMenu!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.circleMenu = CircleMenu(frame: CGRect(x: 180, y: 200, width: 60, height: 60), normalIcon: nil, selectedIcon: nil, buttonsCount: 5, duration: 0.5, distance: 120)
        self.circleMenu.setImage(#imageLiteral(resourceName: "icon_menu"), for: .normal)
        self.circleMenu.setImage(#imageLiteral(resourceName: "icon_close"), for: .selected)
        self.circleMenu.backgroundColor = UIColor.yellow
        self.circleMenu.delegate = self
        self.circleMenu.layer.cornerRadius = self.circleMenu.frame.size.width / 2.0
        view.addSubview(self.circleMenu)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: <CircleMenuDelegate>
    
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }
}

