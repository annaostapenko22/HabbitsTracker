//
//  HabitsModel.swift
//  TravelApp
//
//  Created by Владимир Рубис on 18.06.2021.
//

import UIKit

struct Habit {
    var title: String
    var declaration: String
    var image: String
    var isCheck: Bool
}

extension Habit {
    
    static func getHabitList() -> [Habit] {
        
        [Habit(title: "Читать", declaration: "Чтение расширяет кругозор и ты становишься более приятным собеседником", image: "read", isCheck: false),
        Habit(title: "Делать зарядку", declaration: "Зарядка - залог бодрости и энергии", image: "sport", isCheck: false)]
        
    }
}
