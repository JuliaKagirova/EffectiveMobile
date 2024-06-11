//
//  HotelsCoordinator.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//
import UIKit

class HotelsCoordinator: HotelsBaseCoordinator {
  
    
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
//    func start() -> UIViewController {
//        let viewModel = OrderVMImp()
//        viewModel.onNext = { [weak self] in
//            self?.showOrdersScreen()
//        }
//        let module = OrdersVC(
//            viewModel: viewModel
//        )
//        rootViewController = UINavigationController(
//            rootViewController: module
//        )
//        return rootViewController
//    }
//    
//    func showOrdersScreen() {
//        let vc = OrdersDetailVC()
//        navigationRootViewController?.pushViewController(vc, animated: true)
//    }
    
  
    
    func start() -> UIViewController {
        return UIViewController()

    }
    
    func showHotelsScreen() {
        
    }
    
}
