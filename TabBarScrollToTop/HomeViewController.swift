//
//  ViewController.swift
//  TabBarScrollToTop
//
//  Created by Brendon Crowe on 5/8/23.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    private static let notificationName = Notification.Name(rawValue: "HomeControllerTapped")
    
    public var canScroll = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "Home Controller"
        NotificationCenter.default.addObserver(self, selector: #selector(scrollToTop), name: HomeViewController.notificationName, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        canScroll = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        canScroll = false
    }
    
    @objc private func scrollToTop() {
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CustomCell else {
            fatalError("Could not dequeue a custom cell")
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemBlue
        } else {
            cell.backgroundColor = .systemGreen
        }
        cell.configureCell(row: "Row: " + String(indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) - 20
        return CGSize(width: width, height: 80)
    }
}
