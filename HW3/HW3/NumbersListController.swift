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

protocol LoadNumberDelegate: class {
    func startLoading()
    func stopLoading()
}

private let DRAW_NUMBER_SEGUE_ID = "drawNumberSegue"

class NumbersListController: UIViewController {
    private var numbers = [DrawnNumber]()
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
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
            drawNumberController.loadNumberDelegate = self
        }
    }
}

extension NumbersListController: NumbersListDelegate {
    func add(number: DrawnNumber) {
        numbers.append(number)
        numbersCollectionView.insertItems(at: [IndexPath(row: numbers.count - 1, section: 0)])
    }
}

extension NumbersListController: LoadNumberDelegate {
    func startLoading() {
        spinner.isHidden = false
        numbersCollectionView.isUserInteractionEnabled = false
    }

    func stopLoading() {
        spinner.isHidden = true
        numbersCollectionView.isUserInteractionEnabled = true
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
        cell.contentView.layer.cornerRadius =  cell.frame.width/2
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = number.color
    
        return cell
    }
}

extension NumbersListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.allowAnimatedContent, .beginFromCurrentState],
            animations: {
                let shrink = CGAffineTransform(scaleX: 0.01, y: 0.01);
                let rotate = CGAffineTransform(rotationAngle: CGFloat.pi)
                cell?.contentView.alpha = 0
                cell?.contentView.transform = shrink.concatenating(rotate)
            },
            completion: { _ in
                cell?.contentView.alpha = 1
                cell?.contentView.transform = .identity
            }
        )
        self.numbers.remove(at: indexPath.item)
        collectionView.deleteItems(at: [indexPath])
    }
}
