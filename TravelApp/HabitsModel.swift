//
//  HabitsModel.swift
//  TravelApp
//
//  Created by Владимир Рубис on 18.06.2021.
//

import UIKit

struct Habbit {
    var title: String
    var declaration: String
    var image: String
    var isCheck: Bool
}

extension Habbit {
    
    static func getHabbitList() -> [Habbit] {
        
        [Habbit(title: "Читать", declaration: "Чтение расширяет кругозор и ты становишься более приятным собеседником", image: "read", isCheck: false),
        Habbit(title: "Делать зарядку", declaration: "Зарядка - залог бодрости и энергии", image: "sport", isCheck: false)]
    }
}
