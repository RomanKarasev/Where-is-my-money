//
//  MainTabBarController.swift
//  Where is my money
//
//  Created by Роман Карасёв on 17.10.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setViewForTabBar()
    }
}
// MARK: - Private Methods

private  extension MainTabBarController {
    
    //MARK: setupTabBar
    
    func setupTabBar() {
        let mainVC = createMainVC()
        let overviewVC = createOverviewVC()
        let newEventVC =  createNewEventVC()
        let settingsVC = createSettingsVC()
        let profileVC = createProfileVC()
        
        viewControllers = [
            mainVC,
            overviewVC,
            newEventVC,
            profileVC,
            settingsVC
        ]
    }
    
    //MARK: setViewForTabBar
    
    func setViewForTabBar() {
        tabBar.tintColor = Resources.Colors.mainColor
        tabBar.unselectedItemTintColor = Resources.Colors.mainSecondColor
        tabBar.backgroundColor = Resources.Colors.appBackgroundColor
        tabBar.layer.shadowColor = Resources.Colors.shadowColor.cgColor
        
        tabBar.layer.shadowOffset = CGSize(width: 0,
                                           height: -5)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.borderWidth = 0.2
    }
    
    // MARK: createNavController
    
    func createNavController(vc: UIViewController, itemName: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(),
                                tag: 0
        )
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
    
    // MARK: createMainVC
    
    func createMainVC() -> UINavigationController {
        let VC = createNavController(vc: MainViewController(), itemName: Resources.Strings.TabBar.main)
        VC.tabBarItem.image = Resources.Images.TabBar.main
        return VC
    }
    
    // MARK: createOverviewVC
    
    func createOverviewVC() -> UINavigationController {
        let VC = createNavController(vc: OverviewViewController(), itemName: Resources.Strings.TabBar.overview)
        VC.tabBarItem.image = Resources.Images.TabBar.overview
        return VC
    }
    
    // MARK: createProfileVC
    
    func createProfileVC() -> UINavigationController {
        let VC = createNavController(vc: ProfileViewController(), itemName: Resources.Strings.TabBar.profile)
        VC.tabBarItem.image = Resources.Images.TabBar.profile
        return VC
    }
    
    // MARK: createNewEventVC
    
    func createNewEventVC() -> UINavigationController {
        let VC = createNavController(vc: NewEventViewController(), itemName: Resources.Strings.TabBar.newEvent)
        VC.tabBarItem.image = Resources.Images.TabBar.newEvent
        return VC
    }
    
    // MARK: createSettingsVC
    
    func createSettingsVC() -> UINavigationController {
        let VC = createNavController(vc: SettingsViewController(), itemName: Resources.Strings.TabBar.settings)
        VC.tabBarItem.image = Resources.Images.TabBar.settings
        return VC
    }
}
