//
//  BillCollectionViewCell.swift
//  Where is my money
//
//  Created by Роман Карасёв on 17.10.2022.
//

import Foundation
import UIKit


//MARK: - BillCollectionViewCell

class BillCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties

    static let identifier = Resources.Strings.Identifier.billCollectionViewCell
    
    
    
    let addCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let typeOfBillImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let billAvailableBalanceCount = UILabel(text: "$899.999,00",
                                        font: .appleSDGothicNeo25(),
                                        alignment: .right,
                                        textColor: .label)
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setView() {
        layer.cornerRadius = 10
    }
    
    
    func cellConfigure(number: Int) {
        switch number {
        case 0:
            backgroundColor = Resources.Colors.cardBillColor
            typeOfBillImageView.image = Resources.Images.BillCellImage.cardCellImage
        case 1:
            backgroundColor = Resources.Colors.cashBillColor
            typeOfBillImageView.image = Resources.Images.BillCellImage.cashCellImage
        case 2:
            addCellImageView.image = UIImage(named: "addCell")
            billAvailableBalanceCount.isHidden = true
        default:
            break
        }
    }
}
    
//MARK: - setConstraints
extension BillCollectionViewCell {
    
    private func setConstraints() {
        addSubview(addCellImageView)
        NSLayoutConstraint.activate([addCellImageView.topAnchor.constraint(equalTo: topAnchor),
                                     addCellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     addCellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     addCellImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        
        addSubview(typeOfBillImageView)
        NSLayoutConstraint.activate([typeOfBillImageView.heightAnchor.constraint(equalToConstant: 35),
                                     typeOfBillImageView.widthAnchor.constraint(equalToConstant: 35),
                                     typeOfBillImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                     typeOfBillImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
                                    ])
        
        addSubview(billAvailableBalanceCount)
        NSLayoutConstraint.activate([billAvailableBalanceCount.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                     constant: -20),
                                     billAvailableBalanceCount.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
    }
}
