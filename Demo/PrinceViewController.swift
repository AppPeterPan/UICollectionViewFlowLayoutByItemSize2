//
//  PrinceViewController.swift
//  Demo
//
//  Created by Peter Pan on 2022/4/8.
//

import UIKit

class PrinceViewController: UIViewController {
    let princes = (0...20).map { Prince(name: "小王子\($0)號", image: "pic\($0)") }
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCellSize()
    }
    
    func configureCellSize() {
        let itemSpace: Double = 4
        let columnCount: Double = 3
        let width = floor((UIScreen.main.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: width)
        collectionViewFlowLayout.estimatedItemSize = .zero
        collectionViewFlowLayout.minimumInteritemSpacing = itemSpace
        collectionViewFlowLayout.minimumLineSpacing = itemSpace
        
    }
    
}

extension PrinceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return princes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrinceCollectionViewCell.reuseIdentifier, for: indexPath) as! PrinceCollectionViewCell
        let prince = princes[indexPath.item]
        cell.imageView.image = UIImage(named: prince.image)
        
        return cell
    }
    
    
}
