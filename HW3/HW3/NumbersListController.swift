//
//  NumbersListController.swift
//  HW3
//
//  Created by Lenka Horvathova on 16/03/2020.
//  Copyright © 2020 FI MU. All rights reserved.
//

import UIKit

protocol NumbersListDelegate: class {
    func add(number: DrawnNumber)
}

private let DRAW_NUMBER_SEGUE_ID = "drawNumberSegue"

class NumbersListController: UIViewController {
    private var numbers = [DrawnNumber]()
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numbersCollectionView.dataSource = self
        numbersCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == DRAW_NUMBER_SEGUE_ID,
            let drawNumberController = segue.destination as? DrawNumberController
        {
            drawNumberController.numbersListDelegate = self
        }
    }
}

extension NumbersListController: NumbersListDelegate {
    func add(number: DrawnNumber) {
        numbers.append(number)
        numbersCollectionView.insertItems(at: [IndexPath(row: numbers.count - 1, section: 0)])
    }
}

private let CELL_REUSE_ID = "cellReuseID"

extension NumbersListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_REUSE_ID, for: indexPath) as? NumberCell
        else {
            return UICollectionViewCell()
        }
        
        let number = numbers[indexPath.item]
        
        cell.numberLabel.text = String(number.value)
        cell.layer.cornerRadius =  cell.frame.width/2
        cell.layer.masksToBounds = true
        cell.backgroundColor = number.color
    
        return cell
    }
}

extension NumbersListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        numbers.remove(at: indexPath.item)
        collectionView.deleteItems(at: [indexPath])
    }
}
