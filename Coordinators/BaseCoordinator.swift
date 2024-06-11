//
//  BaseCoordinator.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

typealias Action = (() -> Void)

protocol FlowCoordinator: AnyObject {
    var parentCoordinator: MainBaseCoordinator? { get set }
}

protocol Coordinator: FlowCoordinator {
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController
    @discardableResult func resetToRoot() -> Self
}

extension Coordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
// MARK: - Tabbar Protocol

protocol AirTicketsBaseCoordinator: Coordinator {
    func showAirTicketsScreen()
}

protocol HotelsBaseCoordinator: Coordinator {
    func showHotelsScreen()
}

protocol ShortBaseCoordinator: Coordinator {
    func showShortScreen()
}

protocol SubscriptionsBaseCoordinator: Coordinator {
    func showSubscriptionScreen()
}

protocol ProfileBaseCoordinator: Coordinator {
    func showProfileScreen()
}

protocol MainBaseCoordinator: Coordinator {
    var airTicketsCoordinator: AirTicketsBaseCoordinator { get }
    var hotelsCoordinator: HotelsBaseCoordinator { get }
    var shortCoordinator: ShortBaseCoordinator { get }
    var subscriptionCoordinator: SubscriptionsBaseCoordinator { get }
    var profileCoordinator: ProfileBaseCoordinator { get }
    func moveTo(flow: AppFlow)
}


