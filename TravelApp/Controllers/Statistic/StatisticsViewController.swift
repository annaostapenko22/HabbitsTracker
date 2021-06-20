//
//  StatisticsViewController.swift
//  TravelApp
//
//  Created by Владимир Рубис on 18.06.2021.
//

import UIKit

class StatisticsViewController: UIViewController {
    var habitsList: [Habit]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setThemeColors(mainElement: self.view, secondaryElement: navigationController?.navigationBar)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setThemeColors(mainElement: self.view, secondaryElement: navigationController?.navigationBar)
        self.view.reloadInputViews()
    }
}
