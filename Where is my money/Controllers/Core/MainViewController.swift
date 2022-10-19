//
//  MainViewController.swift
//  Where is my money
//
//  Created by Роман Карасёв on 17.10.2022.
//

import UIKit


//MARK: - MainViewController

class MainViewController: UIViewController {
    
    // MARK: Properties
    
    var hideBarButton: UIBarButtonItem!
    
    let detailTableViewCell = DetailTableViewCell()
    
    let mainView = MainView()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNavBar()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
        view.backgroundColor = Resources.Colors.appBackgroundColor
    }
    
    // MARK: Methods
    
    func didSelectDetail(vc: UIViewController) {
        present(vc, animated: true)
    }
}

//MARK: - @objc func

@objc extension MainViewController {
    
    func hideAvailableBalanceCount() {
        
        if mainView.blurView.isHidden {
            hideBarButton.title = Resources.Strings.Main.showRightBarButtonItemTitle
            mainView.blurView.isHidden = false
        } else {
            hideBarButton.title = Resources.Strings.Main.hideRightBarButtonItemTitle
            mainView.blurView.isHidden = true
        }
    }
    
    func addNewBill() {
        addNewBillCard()
    }
}

//MARK: - Private func

private extension MainViewController {
    
    func setDelegate() {
        
        mainView.billCollectionView.delegate = self
        mainView.billCollectionView.dataSource = self
        
        mainView.detailTableView.delegate = self
        mainView.detailTableView.dataSource = self
        
        mainView.billDelegate = self
        detailTableViewCell.billDelegate = self
    }
    
    func setNavBar() {
        
        hideBarButton = UIBarButtonItem(title: Resources.Strings.Main.hideRightBarButtonItemTitle,
                                        style: .plain,
                                        target: self,
                                        action: #selector(hideAvailableBalanceCount)
        )
        let addNewBillButton = UIBarButtonItem(image: Resources.Images.Main.addNewBillRightBarButtonItemTitle,
                                               style: .done,
                                               target: self,
                                               action: #selector(addNewBill)
        )
        navigationItem.rightBarButtonItems = [hideBarButton,
                                              addNewBillButton]
        
        navigationController?.navigationBar.tintColor = Resources.Colors.mainSecondColor
    }
    
    func addNewBillCard() {
        let vc = NewBillController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 32
        }
        present(vc, animated: true)
    }
    
    func getCellColor(cell: UICollectionViewCell, index: IndexPath) -> UIColor {
        guard let color = mainView.billCollectionView.cellForItem(at: index)?.backgroundColor else { return Resources.Colors.emptyBillColor}
        return color
    }
}
    
//MARK: - BillCollectionView

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Resources.Arrays.billsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BillCollectionViewCell.identifier,
                                                            for: indexPath) as? BillCollectionViewCell else { return UICollectionViewCell() }
        cell.cellConfigure(number: indexPath.row)
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BillCollectionViewCell.identifier, for: indexPath) as? BillCollectionViewCell else { return }
        
        let getColor = getCellColor(cell: cell, index: indexPath)
        mainView.billDelegate?.selectItem(index: indexPath, color: getColor)
        
        if indexPath.row == 2 {
            addNewBill()
        }
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 340, height: 212)
    }
}

//MARK: - DetailTableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resources.Arrays.detailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        
        cell.cellConfigure(index: indexPath,
                           titleText: Resources.Arrays.detailsArray[indexPath.row],
                           tintColor: Resources.Colors.mainSecondColor,
                           detailImage: Resources.Arrays.DetailImage.detailImageArray[indexPath.row]
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case 0:
            didSelectDetail(vc: DetailHistoryViewController())
        case 1:
            didSelectDetail(vc: DetailStatisticsViewController())
        case 2:
            didSelectDetail(vc: DetailSettingsViewController())
            
        default:
            break
        }
    }
}

//MARK: - SelectBill

extension MainViewController: SelectBill {
    func selectItem(index: IndexPath, color: UIColor) {
        
        mainView.addIncomeButton.tintColor = color
        mainView.addExpenseButton.tintColor = color
        mainView.detailTableView.isHidden = false
        if color == Resources.Colors.emptyBillColor {
            mainView.detailTableView.isHidden = true
        }
    }
}

