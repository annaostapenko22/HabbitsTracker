//
//  MainTrackerViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//
import FSCalendar
import UIKit

class MainTrackerViewController: UIViewController {

    @IBOutlet weak var habitsTableView: UITableView!
    
    let habitsList = Habit.getHabitList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0	, width: 320, height: 100))
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! CustomTableViewCell
        
        cell.habitLabel.text = habitsList[indexPath.row].title
        cell.habitImage.image = UIImage(named: habitsList[indexPath.row].image)
        cell.habitImage.image = cell.habitImage.image?.withRenderingMode(.alwaysTemplate)
        cell.habitImage.tintColor = UIColor.white
        return cell
    }
}

extension MainTrackerViewController: FSCalendarDelegate, FSCalendarDataSource {
    
}

extension MainTrackerViewController: UITabBarDelegate {
    
    // MARK: - Navigation actions
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        guard let navigationVC = viewController as? UINavigationController else { return }
        if let statisticsVC = navigationVC.topViewController as? StatisticsViewController {
            statisticsVC.habitsList = habitsList
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if let vc = segue.destination as? addHabitViewController,
//           let indexPath = tableView.indexPathForSelectedRow
//        {
//            let habit = habitList[indexPath.row]
//            vc.habit = habit
//        } else { return }
//    }
//
//    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
//
//        guard let newHabitVC = segue.source as? NewPersonViewController else { return }
//        newHabitVC.saveNewPerson()
//        habitList.append(newHabitVC.newHabit!)
//        habitsTableView.reloadData()
//
//    }
//}
}
