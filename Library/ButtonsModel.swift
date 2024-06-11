//
//  ButtonsModel.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 10.06.2024.
//

import UIKit

struct ButtonsModel: Hashable {
    var icon: UIImage?
    var title: String
    var target: ButtonsTarget
}

enum ButtonsTarget {
    case difficultRout
    case anywhere
    case weekends
    case hotTickets
}

enum ButtonsTitles {
    static let difficultRout = "Сложный маршрут"
    static let anywhere = "Куда угодно"
    static let weekends = "Выходные"
    static let hotTickets = "Горячие билеты"
}

enum Icon {
    static let difficultRout = UIImage(named: "rout")
    static let anywhere = UIImage(named: "anywhere1")
    static let weekends = UIImage(named: "weekend")
    static let hotTickets = UIImage(named: "hot")
}

extension ButtonsModel {
    static func makeButtons() -> [Self] {
        [
            ButtonsModel(icon: Icon.difficultRout, title: ButtonsTitles.difficultRout, target: .difficultRout),
            ButtonsModel(icon: Icon.anywhere!, title: ButtonsTitles.anywhere, target: .anywhere),
            ButtonsModel(icon: Icon.weekends!, title: ButtonsTitles.weekends, target: .weekends),
            ButtonsModel(icon: Icon.hotTickets!, title: ButtonsTitles.hotTickets, target: .hotTickets)
        ]
    }
}
