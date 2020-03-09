//
//  SliderController.swift
//  HW2
//
//  Created by Lenka Horvathova on 08/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//


import UIKit

class SliderController: UIViewController {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightChanged(_ slider: UISlider) {
        heightConstraint?.constant = CGFloat(slider.value)
    }
    
}
    
