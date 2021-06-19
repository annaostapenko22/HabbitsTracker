//
//  SettingsTableViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    var settingsList = [
        SettingsItem(title: "Уведомления", image: "clock"),
        SettingsItem(title: "Тема", image: "pencil.tip.crop.circle")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
            backButton.title = "Back"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
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
        print("here")
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingsTableViewCell
        let settingItem = settingsList[indexPath[0]]
        cell.titleLabel?.text = settingItem.title
        cell.iconView?.image = UIImage(systemName: settingItem.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
