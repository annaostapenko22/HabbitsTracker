//
//  TestTabBarController.swift
//  TravelApp
//
//  Created by Владимир Рубис on 20.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let middleButtonDiameter: CGFloat = 42
    private let yellowColor: UIColor = UIColor(red: 249.0 / 255.0, green: 229.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    private let greenColor: UIColor = UIColor(red: 102.0 / 255.0, green: 166.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)

    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.layer.cornerRadius = middleButtonDiameter / 2
        middleButton.backgroundColor = yellowColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        return middleButton
    }()
    
    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(named: "plus")
        heartImageView.tintColor = .yellow
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()
    
    @IBOutlet weak var testTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        
    }
    
    private func makeUI() {
        // 1
        tabBar.addSubview(middleButton)
        middleButton.addSubview(heartImageView)
        
        // 2
        NSLayoutConstraint.activate([
            // 2.1
            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            // 2.2
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])

        // 3
        NSLayoutConstraint.activate([
            // 3.1
            heartImageView.heightAnchor.constraint(equalToConstant: 15),
            heartImageView.widthAnchor.constraint(equalToConstant: 18),
            // 3.2
            heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
    }

// MARK: - Selectors

@objc private func didPressMiddleButton() {
    selectedIndex = 1
    middleButton.backgroundColor = greenColor
    
}
}
// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item) // 1
        if selectedIndex != 1 { // 2
            middleButton.backgroundColor = yellowColor // 3
        } else {
            middleButton.backgroundColor = greenColor // 4
        }
    }
}
