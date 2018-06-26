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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Setup Methods -
    func setupCollectionView() {
        collectionView?.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        collectionView?.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
    }
    
}

// MARK: - Collection View Datasource and Delegate -
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = view.frame.width * 0.53 // The height is 53% of of the views width
        
        return CGSize(width: view.frame.width - 22, height: height) // 11 + 11 for side insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11 // Sizing between cells
    }
    
}

extension FeedViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
//        let searchText = searchController.searchBar.text ?? ""
    }
    
}
