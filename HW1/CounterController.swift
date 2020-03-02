//
//  CounterController.swift
//  HW1
//
//  Created by Lenka Horvathova on 28/02/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class CounterController: UIViewController {
    
    private var counter: Int = 0
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 10.0
        button.setTitleColor(.systemGray, for: .highlighted)
        countLabel.text = String(counter)
    }
    
    @IBAction func handleButtonClick(_ button: UIButton) {
        counter += 1
        countLabel.text = String(counter)
    }
}
