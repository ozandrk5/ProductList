//
//  ViewController.swift
//  ProductList
//
//  Created by Ozan  Doruk on 23.02.2024.
//
import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var model: [Model] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        let urlString = "https://dummyjson.com/products"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let products = json["products"] as? [[String: Any]] {
                        for product in products {
                            let title = product["title"] as? String ?? ""
                            let description = product["description"] as? String ?? ""
                            let price = product["price"] as? Int ?? 0
                            let thumbnail = product["thumbnail"] as? String ?? ""
                            
                            let model = Model(title: title, description: description, price: price, thumbnail: thumbnail, images: [])
                            self.model.append(model)
                        }
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
            } catch {
                print("JSON serialization error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        let item = model[indexPath.row]
        cell.productIV.sd_setImage(with: URL(string:item.thumbnail!)!)
        cell.productLabel.text = item.title
        
        return cell
    }
}
