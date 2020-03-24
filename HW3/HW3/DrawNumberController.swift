//
//  DrawNumberController.swift
//  HW3
//
//  Created by Lenka Horvathova on 16/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit
import Alamofire

class DrawNumberController: UIViewController {
    weak var numbersListDelegate: NumbersListDelegate?
    weak var loadNumberDelegate: LoadNumberDelegate?
    
    @IBAction func clickedRedButton(_ sender: UIButton?) {
        generate(color: .red, min: 1, max: 10)
    }
    
    @IBAction func clickedGreenButton(_ sender: UIButton?) {
        generate(color: .green, min: 1, max: 50)
    }
    
    @IBAction func clickedBlueButton(_ sender: UIButton?) {
        generate(color: .blue, min: 11, max: 49)
    }
    
    private func generate(color: UIColor, min: Int, max: Int) {
        dismiss(animated: true)
        
        self.loadNumberDelegate?.startLoading()
        
        let urlString = "https://www.random.org/integers/?num=1&min=\(min)&max=\(max)&base=10&format=plain&col=1"
        AF.request(urlString).responseJSON {
            response in switch response.result {
                case .success(_):
                    if let value = response.value as? Int {
                        let drawnNumber = DrawnNumber(value: value, color: color)
                        self.numbersListDelegate?.add(number: drawnNumber)
                    }
                    self.loadNumberDelegate?.stopLoading()
                case .failure(let error):
                    print(error)
                    self.loadNumberDelegate?.stopLoading()
            }
        }
    }
}
