//
//  AirTicketsDetailVM.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import Foundation
protocol AirTicketsDetailVM {
    var onClose: Action? { get set }
}

class AirTicketsDetailVMImp: AirTicketsDetailVM {
    var onClose: Action?
}
