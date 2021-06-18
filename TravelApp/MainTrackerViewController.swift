//
//  MainTrackerViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//

import UIKit

class MainTrackerViewController: UIViewController {

    @IBOutlet weak var habitsTableView: UITableView!
    
    let habitsList = Habit.getHabitList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        habitsTableView.tableFooterView = UIView()
        
        habitsTableView.delegate = self
        habitsTableView.dataSource = self
        
    }
}

extension MainTrackerViewController: UITableViewDelegate {
    
}
extension MainTrackerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Habit.getHabitList().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habbitCell", for: indexPath) as! CustomTableViewCell
        
        cell.habitLabel.text = habitsList[indexPath.row].title
        cell.habitImage.image = UIImage(named: habitsList[indexPath.row].image)
        cell.habitImage.image = cell.habitImage.image?.withRenderingMode(.alwaysTemplate)
        cell.habitImage.tintColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(229.0/255.0), blue: CGFloat(71.0/255.0), alpha: CGFloat(1.0))
        return cell
    }
    
    
}
