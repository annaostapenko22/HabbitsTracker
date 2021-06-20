//
//  SettingsTableViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    var settingsList = [
        SettingsItem(title: "Тема", image: "pencil.tip.crop.circle", id: "theme"),
        SettingsItem(title: "Уведомления", image: "clock", id: "notification")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setThemeColors(mainElement: self.tableView, secondaryElement: navigationController?.navigationBar)
        self.tableView.reloadData()
    }
}


extension SettingsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingsList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingsTableViewCell
        let settingItem = settingsList[indexPath[0]]
        cell.titleLabel?.text = settingItem.title
        cell.iconView?.image = UIImage(systemName: settingItem.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingsList[indexPath[0]].id == "theme" {
            self.performSegue(withIdentifier: "themeSegue", sender: self)
        }
    }
    
}
