//
//  DrawNumberController.swift
//  HW3
//
//  Created by Lenka Horvathova on 16/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class DrawNumberController: UIViewController {
    weak var numbersListDelegate: NumbersListDelegate?
    
    @IBAction func clickedRedButton(_ sender: UIButton?) {
        generate(color: .red, interval: 1...10)
    }
    
    @IBAction func clickedGreenButton(_ sender: UIButton?) {
        generate(color: .green, interval: 1...50)
    }
    
    @IBAction func clickedBlueButton(_ sender: UIButton?) {
        generate(color: .blue, interval: 11...49)
    }
    
    private func generate(color: UIColor, interval: ClosedRange<Int>) {
      let drawnNumber = DrawnNumber(value: Int.random(in: interval), color: color)
      numbersListDelegate?.add(number: drawnNumber)

      dismiss(animated: true)
    }
}
