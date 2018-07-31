//
//  AssessmentsCollectionViewController.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 7/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AssessmentsCollectionViewController: UICollectionViewController {
    
    // MARK: - View Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Setup Functions -
    func setupCollectionView() {
        collectionView?.backgroundColor = .white
        collectionView?.register(AssessmentCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView?.collectionViewLayout = layout
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
}

// MARK: UICollectionViewDataSource and FlowLayout
extension AssessmentsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // CollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    // FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 297, height: 187)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}
