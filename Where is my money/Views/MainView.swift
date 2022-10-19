//
//  MainView.swift
//  Where is my money
//
//  Created by Роман Карасёв on 17.10.2022.
//

import UIKit

protocol SelectBill: AnyObject {
    func selectItem(index: IndexPath, color: UIColor)
}

//MARK: - MainView

class MainView: UIView {
    
    //MARK: Properties
    
    weak var billDelegate: SelectBill?
    
    let detailTableViewCell = DetailTableViewCell()
    
    //MARK: UIView
    
    let detailTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = Resources.Colors.clearColor
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let topBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.mainColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blurView: UIView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.isHidden = true
        return blurEffectView
    }()
    
    let billCollectionView = BillCollectionView()
    
    //MARK: Buttons
    
    let addIncomeButton: UIButton = {
        let button = UIButton()
        button.tintColor = Resources.Colors.cardBillColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addExpenseButton: UIButton = {
        let button = UIButton()
        button.tintColor = Resources.Colors.cardBillColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Labels
    
    let availableBalanceCount = UILabel(text: "$999.999,00",
                                        font: .appleSDGothicNeo35(),
                                        alignment: .right,
                                        textColor: .label)
    
    let availableBalance = UILabel(text: "Available balance",
                                   font: .appleSDGothicNeo15(),
                                   alignment: .right,
                                   textColor: .label)
    
    
    //MARK: ImageView
    
    let incomeButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Images.Main.income
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let expenseButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Images.Main.expense
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - setConstraints

extension MainView {
    
    private func setConstraints() {
        addSubview(topBackgroundView)
        NSLayoutConstraint.activate([topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
                                     topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     topBackgroundView.heightAnchor.constraint(equalToConstant: 324),
                                    ])
        
        addSubview(billCollectionView)
        NSLayoutConstraint.activate([billCollectionView.topAnchor.constraint(equalTo: topAnchor,
                                                                             constant: 201),
                                     billCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     billCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     billCollectionView.heightAnchor.constraint(equalToConstant: 212)
                                    ])
        
        addSubview(availableBalanceCount)
        NSLayoutConstraint.activate([availableBalanceCount.topAnchor.constraint(equalTo: topAnchor,
                                                                                constant: 96),
                                     availableBalanceCount.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                                     constant: -37)
                                    ])
        
        addSubview(blurView)
        NSLayoutConstraint.activate([blurView.topAnchor.constraint(equalTo: topAnchor,
                                                                   constant: 96),
                                     blurView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                        constant: -37),
                                     blurView.heightAnchor.constraint(equalTo: availableBalanceCount.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: availableBalanceCount.widthAnchor)
                                    ])
        
        addSubview(availableBalance)
        NSLayoutConstraint.activate([availableBalance.topAnchor.constraint(equalTo: availableBalanceCount.bottomAnchor,
                                                                           constant: 3),
                                     availableBalance.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                                constant: -37)
                                    ])
        
        addSubview(addIncomeButton)
        NSLayoutConstraint.activate([addIncomeButton.topAnchor.constraint(equalTo: billCollectionView.bottomAnchor,
                                                                          constant: 30),
                                     addIncomeButton.trailingAnchor.constraint(equalTo: centerXAnchor,
                                                                              constant: -45),
                                     addIncomeButton.heightAnchor.constraint(equalToConstant: 50),
                                     addIncomeButton.widthAnchor.constraint(equalToConstant: 50)
                                    ])
        
        addSubview(addExpenseButton)
        NSLayoutConstraint.activate([addExpenseButton.topAnchor.constraint(equalTo: billCollectionView.bottomAnchor,
                                                                          constant: 30),
                                     addExpenseButton.leadingAnchor.constraint(equalTo: centerXAnchor,
                                                                              constant: 45),
                                     addExpenseButton.heightAnchor.constraint(equalToConstant: 50),
                                     addExpenseButton.widthAnchor.constraint(equalToConstant: 50)
                                    ])
        
        addIncomeButton.addSubview(incomeButtonImageView)
        NSLayoutConstraint.activate([incomeButtonImageView.topAnchor.constraint(equalTo: addIncomeButton.topAnchor),
                                     incomeButtonImageView.leadingAnchor.constraint(equalTo: addIncomeButton.leadingAnchor),
                                     incomeButtonImageView.trailingAnchor.constraint(equalTo: addIncomeButton.trailingAnchor),
                                     incomeButtonImageView.bottomAnchor.constraint(equalTo: addIncomeButton.bottomAnchor)
                                    ])
        
        addExpenseButton.addSubview(expenseButtonImageView)
        NSLayoutConstraint.activate([expenseButtonImageView.topAnchor.constraint(equalTo: addExpenseButton.topAnchor),
                                     expenseButtonImageView.leadingAnchor.constraint(equalTo: addExpenseButton.leadingAnchor),
                                     expenseButtonImageView.trailingAnchor.constraint(equalTo: addExpenseButton.trailingAnchor),
                                     expenseButtonImageView.bottomAnchor.constraint(equalTo: addExpenseButton.bottomAnchor)
                                    ])
        
        addSubview(detailTableView)
        NSLayoutConstraint.activate([detailTableView.topAnchor.constraint(equalTo: addIncomeButton.bottomAnchor,
                                                                         constant: 50),
                                     detailTableView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                              constant: 37),
                                     detailTableView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                               constant: -37),
                                     detailTableView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                             constant: -150)
                                    ])
    }
}
