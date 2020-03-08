//
//  CloseButtonController.swift
//  HW2
//
//  Created by Lenka Horvathova on 08/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class CloseButtonController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClick(_ closeButton: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
