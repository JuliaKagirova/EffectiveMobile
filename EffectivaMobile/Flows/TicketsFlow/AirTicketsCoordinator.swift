//
//  AirTicketsCoordinator.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

class AirTicketsCoordinator: AirTicketsBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let viewModel = AirTicketsVMImp()
        viewModel.onDetail = { [weak self] in
            self?.showAirTicketsScreen()
        }
        let module = AirTicketsVC(viewModel: viewModel)
        rootViewController = UINavigationController(rootViewController: module)
        return rootViewController
    }
    
    func showAirTicketsScreen() {
        let viewModel = AirTicketsDetailVMImp()
        viewModel.onClose = { [weak self] in
            self?.parentCoordinator?.moveTo(flow: .hotels)
        }
        let module = AirTicketsDetailVC(
            viewModel: viewModel
        )
        navigationRootViewController?.pushViewController(module, animated: true)
    }
}
