//
//  Resources.swift
//  Where is my money
//
//  Created by Роман Карасёв on 17.10.2022.
//

import UIKit


//MARK: - typealias

typealias DetailImageType = Resources.Images.DetailImage


//MARK: - Resources

enum Resources {
    
    //MARK: Colors
    
    enum Colors {
        
        static var appBackgroundColor = UIColor(hexString: "#F9F9FB")
        static var mainColor = UIColor(hexString: "#7165E3")
        static var mainSecondColor = UIColor(hexString: "#9EA6BE")
        static var shadowColor = UIColor.black
        static var clearColor = UIColor.clear
        static var cardBillColor = #colorLiteral(red: 0.2613008946, green: 0.7678586719, blue: 1, alpha: 1)
        static var cashBillColor = #colorLiteral(red: 0.1072434022, green: 1, blue: 0, alpha: 1)
        static var textColor = UIColor(hexString: "#9EA6BE")
        static var emptyBillColor = UIColor.systemGray
        
    }
    
    //MARK: Images
    
    enum Images {
        
        enum TabBar {
            static var profile = UIImage(systemName: "person.fill")
            static var main = UIImage(systemName: "creditcard.fill")
            static var newEvent = UIImage(systemName: "plus.circle.fill")
            static var settings = UIImage(systemName: "gearshape.2.fill")
            static var overview = UIImage(systemName: "bag.fill")
            
        }
        
        enum Main {
            
            static var addNewBillRightBarButtonItemTitle = UIImage(systemName: "plus.square.dashed")
            static var income = UIImage(systemName: "bag.fill.badge.plus")
            static var expense = UIImage(systemName: "bag.fill.badge.minus")
            
        }
        
        enum BillCellImage {
            
            static var cardCellImage = UIImage(systemName: "creditcard")
            static var cashCellImage = UIImage(systemName: "banknote")
        }
        
        enum DetailImage {
            
            static var history = UIImage(systemName: "tray.and.arrow.up.fill")!
            static var statistic = UIImage(systemName: "tray.full.fill")!
            static var settings = UIImage(systemName: "doc.badge.gearshape.fill")!
        }
    }
    
    //MARK: Strings
    
    enum Strings {
        
        enum TabBar {
            static var profile = "Profile"
            static var main = "Main"
            static var newEvent = "New Event"
            static var settings = "Settings"
            static var overview = "Overview"
        }
        
        enum Identifier {
            static let billCollectionViewCell = "BillCollectionViewCell"
            static let detailTableViewCell = "DetailTableViewCell"
        }
        
        enum Main {
            
            static var hideRightBarButtonItemTitle = "Hide"
            static var showRightBarButtonItemTitle = "Show"
            static var example = "Example"
        }
    }
    
    
    //MARK: Arrays
    
    enum Arrays {
        
        static var billsArray = ["Card", "Cash", "Add"]
        static var detailsArray = ["History", "Statistics", "Settings"]
        
        
        enum DetailImage {
            
            static var detailImageArray = [DetailImageType.history, DetailImageType.statistic, DetailImageType.settings]
        }
    }
}





