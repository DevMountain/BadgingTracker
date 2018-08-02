//
//  FeedViewController.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/25/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController {
    
    private let reuseIdentifier = "FeedCell"
    private let headerReuseIdentifier = "HeaderCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Setup Methods -
    func setupCollectionView() {
        collectionView?.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        collectionView?.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(FeedHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        setDefaultNavigationBar()
    }
    
}

// MARK: - Collection View Datasource and Delegate -
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    // Regular Cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FeedController.shared.posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.feedPost = FeedController.shared.posts[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FeedCollectionViewCell else {
            return CGSize(width: view.frame.width - 22, height: view.frame.width * 0.53) // The height is 53% of of the views width
        }
        
        return CGSize(width: view.frame.width - 22, height: cell.calculatedHeight) // 11 + 11 for side insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11 // Sizing between cells
    }
    
    
    // Header Cell
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let user = UserController.shared.loggedInUser as? Mentor else {
//            return UICollectionViewCell()
//        }
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! FeedHeaderCollectionViewCell
//        header.mentorImageView.image = user.profilePhotoImage
//        return header
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width - 22, height: 120)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
}
