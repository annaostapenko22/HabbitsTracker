//
//  MainTrackerViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//

import UIKit

class MainTrackerViewController: UIViewController {

    @IBOutlet weak var habbitsTableView: UITableView!
    
    let habbitsList = Habbit.getHabbitList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        habbitsTableView.tableFooterView = UIView()
        
        habbitsTableView.delegate = self
        habbitsTableView.dataSource = self
        
    }
}

extension MainTrackerViewController: UITableViewDelegate {
    
}
extension MainTrackerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Habbit.getHabbitList().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habbitCell", for: indexPath) as! CustomTableViewCell
        
        cell.habbitLabel.text = habbitsList[indexPath.row].title
        cell.habbitImage.image = UIImage(named: habbitsList[indexPath.row].image)
        cell.habbitImage.image = cell.habbitImage.image?.withRenderingMode(.alwaysTemplate)
        cell.habbitImage.tintColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(229.0/255.0), blue: CGFloat(71.0/255.0), alpha: CGFloat(1.0))
        return cell
    }
    
    
}
