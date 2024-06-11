//
//  MainCoordinator.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

enum AppFlow {
    case airTickets
    case hotels
    case short
    case subscription
    case profile
}

class MainCoordinator: MainBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var airTicketsCoordinator: AirTicketsBaseCoordinator = AirTicketsCoordinator()
    
    lazy var hotelsCoordinator: HotelsBaseCoordinator = HotelsCoordinator()
    
    lazy var shortCoordinator: ShortBaseCoordinator = ShortCoordinator()
    
    lazy var subscriptionCoordinator: SubscriptionsBaseCoordinator = SubscriptionsCoordinator()
    
    lazy var profileCoordinator: ProfileBaseCoordinator = ProfileCoordinator()
    
    lazy var rootViewController: UIViewController = UITabBarController()
    
    func start() -> UIViewController {
        let airTicketsViewController = airTicketsCoordinator.start()
        //        airTicketsViewController.view.backgroundColor = .white //bg
        airTicketsCoordinator.parentCoordinator = self
        airTicketsViewController.tabBarItem = UITabBarItem(
            title: "Авиабилеты",
            image: UIImage(named: "planeIcon"),
            tag: 0
        )
        
        let hotelsViewController = hotelsCoordinator.start()
        hotelsViewController.view.backgroundColor = .white//bg
        hotelsCoordinator.parentCoordinator = self
        hotelsViewController.tabBarItem = UITabBarItem(
            title: "Отели",
            image: UIImage(named: "hotelIcon"),
            tag: 1
        )
        
        let shortViewController = shortCoordinator.start()
        shortViewController.view.backgroundColor = .white//bg
        shortCoordinator.parentCoordinator = self
        shortViewController.tabBarItem = UITabBarItem(
            title: "Короче",
            image: UIImage(named: "shortIcon"),
            tag: 2
        )
        
        let subscriptionViewController = subscriptionCoordinator.start()
        subscriptionViewController.view.backgroundColor = .white//bg
        subscriptionCoordinator.parentCoordinator = self
        subscriptionViewController.tabBarItem = UITabBarItem(
            title: "Подписки",
            image: UIImage(named: "subscriptionIcon"),
            tag: 3
        )
        
        let profileViewController = profileCoordinator.start()
        profileViewController.view.backgroundColor = .white//bg
        profileCoordinator.parentCoordinator = self
        profileViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profileIcon"),
            tag: 4
        )
        
        
        (rootViewController as? UITabBarController)?.viewControllers = [
            airTicketsViewController,
            hotelsViewController,
            shortViewController,
            subscriptionViewController,
            profileViewController
        ]
        return rootViewController
    }
    
    func moveTo(flow: AppFlow) {
        switch flow {
        case .airTickets:
            (rootViewController as? UITabBarController)?.selectedIndex = 0
        case .hotels:
            (rootViewController as? UITabBarController)?.selectedIndex = 1
        case .short:
            (rootViewController as? UITabBarController)?.selectedIndex = 2
        case .subscription:
            (rootViewController as? UITabBarController)?.selectedIndex = 3
        case .profile:
            (rootViewController as? UITabBarController)?.selectedIndex = 4
        }
    }
    
    func resetToRoot() -> Self {
        airTicketsCoordinator.resetToRoot()
        moveTo(flow: .airTickets)
        return self
    }
}
