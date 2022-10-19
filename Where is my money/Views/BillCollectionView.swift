//
//  BillCollectionView.swift
//  Where is my money
//
//  Created by Роман Карасёв on 17.10.2022.
//

import UIKit

//MARK: - BillCollectionView

class BillCollectionView: UICollectionView {
    
    // MARK: Properties
    
    private let billLayout = UICollectionViewFlowLayout()
    
    // MARK: Initialization
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: billLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func configure() {
        billLayout.scrollDirection = .horizontal
        backgroundColor = .none
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
        contentInset.left = 37
        contentInset.right = 37
        
        register(BillCollectionViewCell.self,
                 forCellWithReuseIdentifier: BillCollectionViewCell.identifier)
    }
}
