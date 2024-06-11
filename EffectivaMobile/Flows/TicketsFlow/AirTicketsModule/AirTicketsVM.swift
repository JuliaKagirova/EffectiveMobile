//
//  AirTicketsVM.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

protocol AirTicketsVM {
    var onDetail: Action? { get set }
}
class AirTicketsVMImp: AirTicketsVM {
    var onDetail: Action?
}
