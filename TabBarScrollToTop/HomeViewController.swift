//
//  ViewController.swift
//  TabBarScrollToTop
//
//  Created by Brendon Crowe on 5/8/23.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "Home Controller"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 20
        return CGSize(width: width, height: 80)
    }
}
