//
//  DrawNumberController.swift
//  HW3
//
//  Created by Lenka Horvathova on 16/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

class DrawNumberController: UIViewController {
    private var drawnNumber = DrawnNumber()
    weak var numbersListDelegate: NumbersListDelegate?
    
    
    @IBAction func clickedRedButton(_ sender: UIButton?) {
        drawnNumber.value = Int.random(in: 1...10)
        drawnNumber.color = .red
        
        numbersListDelegate?.add(number: drawnNumber)
        dismiss(animated: true)
    }
    
    @IBAction func clickedGreenButton(_ sender: UIButton?) {
        drawnNumber.value = Int.random(in: 1...50)
        drawnNumber.color = .green
        
        numbersListDelegate?.add(number: drawnNumber)
        dismiss(animated: true)
    }
    
    @IBAction func clickedBlueButton(_ sender: UIButton?) {
        drawnNumber.value = Int.random(in: 11...49)
        drawnNumber.color = .blue
        
        numbersListDelegate?.add(number: drawnNumber)
        dismiss(animated: true)
    }
    
}
