//
//  TestTabBarController.swift
//  TravelApp
//
//  Created by Владимир Рубис on 20.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - Create customButton
    
    private let middleButtonDiameter: CGFloat = 42
    private let customYellowColor: UIColor = UIColor(red: 249.0 / 255.0, green: 229.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    private let customGreenColor: UIColor = UIColor(red: 196.0 / 255.0, green: 253.0 / 255.0, blue: 61.0 / 255.0, alpha: 1.0)
    
    private lazy var customButton: UIButton = {
        let middleButton = UIButton()
        middleButton.layer.cornerRadius = middleButtonDiameter / 2
        middleButton.backgroundColor = customGreenColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        return middleButton
    }()
    
    private lazy var plusImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(named: "plus")
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // MARK: - Add customButton and customize its location
    
    private func makeUI() {
        
        tabBar.addSubview(customButton)
        customButton.addSubview(plusImageView)
        
        NSLayoutConstraint.activate([
            customButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            customButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            customButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            customButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            plusImageView.heightAnchor.constraint(equalToConstant: 25),
            plusImageView.widthAnchor.constraint(equalToConstant: 25),
            plusImageView.centerXAnchor.constraint(equalTo: customButton.centerXAnchor),
            plusImageView.centerYAnchor.constraint(equalTo: customButton.centerYAnchor)
        ])
    }
    
    // MARK: - Selectors
    
    @objc private func didPressMiddleButton() {
        selectedIndex = 1
        customButton.backgroundColor = customYellowColor
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item)
        if selectedIndex != 1 {
            customButton.backgroundColor = customGreenColor
        } else {
            customButton.backgroundColor = customYellowColor
        }
    }
}
