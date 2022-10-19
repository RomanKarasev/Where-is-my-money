//
//  DetailTableViewCell.swift
//  Where is my money
//
//  Created by Роман Карасёв on 18.10.2022.
//

import UIKit

// MARK: - DetailTableViewCell

class DetailTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let identifier = Resources.Strings.Identifier.detailTableViewCell
    
    weak var billDelegate: SelectBill?
    
    let detailLabel = UILabel(text: "",
                              font: .appleSDGothicNeoSemiBold20(),
                              alignment: .center,
                              textColor: Resources.Colors.textColor)
    
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Images.DetailImage.settings
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setView() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        
        tintColor = Resources.Colors.cardBillColor
        backgroundColor = Resources.Colors.clearColor
    }
    
    func cellConfigure(index: IndexPath,
                       titleText: String,
                       tintColor: UIColor,
                       detailImage: UIImage) {
        
        detailLabel.text = titleText
        detailImageView.image = detailImage
        self.tintColor = tintColor
    }
}

//MARK: - setConstraints

private extension DetailTableViewCell {
    
    func setConstraints() {
        
        addSubview(detailImageView)
        NSLayoutConstraint.activate([detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                                     detailImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     detailImageView.heightAnchor.constraint(equalToConstant: 35),
                                     detailImageView.widthAnchor.constraint(equalToConstant: 35)
                                    ])
        
        addSubview(detailLabel)
        NSLayoutConstraint.activate([detailLabel.leadingAnchor.constraint(equalTo: detailImageView.trailingAnchor, constant: 10),
                                     detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
        
    }
}

