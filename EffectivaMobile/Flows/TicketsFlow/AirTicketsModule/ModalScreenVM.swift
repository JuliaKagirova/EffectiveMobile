//
//  ModalScreenVM.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 10.06.2024.
//

import UIKit

protocol ModalScreenVMProtocol {
    func didTappedButton(target: ButtonsTarget)
}

class ModalScreenVM {
    private weak var coordinator: ButtonsCoordinatorProtocol?
    
    init() {
//        self.coordinator = coordinator
    }
    
    private func getButtons() {
        Task { @MainActor [weak self] in
            guard let self else { return }
            do {
                let buttonsModel = ButtonsModel.makeButtons()
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
    }
}

extension ModalScreenVM: ModalScreenVMProtocol {
    
    func didTappedGetProfile() {
        getButtons()
    }
    
    func didTappedButton(target: ButtonsTarget) {
        switch target {
        case .difficultRout:
            coordinator?.pushDifficultRout()
        case .anywhere:
            coordinator?.pushAnywhere()
        case .weekends:
            coordinator?.pushWeekend()
        case .hotTickets:
            coordinator?.pushHotTickets()
        }
    }
}
