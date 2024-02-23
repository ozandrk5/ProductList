//
//  ViewController.swift
//  ProductList
//
//  Created by Ozan  Doruk on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collecitonView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        cell.productIV.image = UIImage(named: "car")
        cell.productLabel.text = "Araba"
        
        return cell
    }
}
