//
//  MainTrackerViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//
import FSCalendar
import UIKit
import CoreData

class MainTrackerViewController: UIViewController {
    
    @IBOutlet weak var habitsTableView: UITableView!
    
    var habitsList = Habit.getHabitList()
    
    fileprivate weak var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        habitsTableView.tableFooterView = UIView()
        habitsTableView.delegate = self
        habitsTableView.dataSource = self
        setUpCalendar()
        habitsTableView.bringSubviewToFront(calendar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewDidAppear")
        viewLoadSetup()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        habitsTableView.reloadData()
    }
    
    func viewLoadSetup() {
        let themeValue = retrieveThemeData()
        print("value \(themeValue)")
        if themeValue == "orange" {
            habitsTableView.backgroundColor = UIColor.orange
        } else {
            habitsTableView.backgroundColor = UIColor.systemGray6
        }
    }
    
    @IBAction func unwindToMainScreen(_ unwindSegue: UIStoryboardSegue) {
     
    }
}

extension MainTrackerViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func setUpCalendar() {
        let calendar = FSCalendar()
            calendar.dataSource = self
            calendar.delegate = self
            self.calendar = calendar

            self.calendar.scope = .week
            self.calendar.locale = Locale(identifier: "ru_Ru")
            self.calendar.calendarHeaderView.calendar.locale =  Locale(identifier: "ru_RU")
            self.calendar.adjustsBoundingRectWhenChangingMonths = true
            self.calendar.headerHeight = 0
        for index in 0..<self.calendar.calendarWeekdayView.weekdayLabels.count {
            self.calendar.calendarWeekdayView.weekdayLabels[index].font = UIFont(name: "AvenirNext-Bold", size: 20)
            self.calendar.calendarWeekdayView.weekdayLabels[index].textColor = UIColor(red: 249/255, green: 229/255, blue: 71/255, alpha: 1)
        }
//        self.calendar.collectionView.
            view.addSubview(calendar)

            self.calendar.translatesAutoresizingMaskIntoConstraints = false
            self.calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.calendar.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
            self.calendar.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
    
    
}

extension MainTrackerViewController: UITableViewDelegate {
    
}
extension MainTrackerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habitsList.count
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

extension MainTrackerViewController: UITabBarDelegate {
    
    // MARK: - Navigation actions
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        guard let navigationVC = viewController as? UINavigationController else { return }
        if let _ = navigationVC.topViewController as? AddHabitViewController {
            if let selectedIndexPath = habitsTableView.indexPathForSelectedRow {
                habitsTableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "changeHabit" {
                guard let navigationVC = segue.destination as? UINavigationController else { return }
                let destination = navigationVC.topViewController as! AddHabitViewController
                let selectedIndexPath = habitsTableView.indexPathForSelectedRow!
                destination.habit = habitsList[selectedIndexPath.row]
            }
        }
    
        @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
    
            guard let sourse = segue.source as? AddHabitViewController else { return }
            if let selectedIndexPath = habitsTableView.indexPathForSelectedRow {
                habitsList[selectedIndexPath.row].title = sourse.habit.title
                habitsTableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                print(habitsList[selectedIndexPath.row].title)
//            newHabitVC.saveNewPerson()
//            habitList.append(newHabitVC.newHabit!)
            } else {
                let newIndexPath = IndexPath(row: 2, section: 0)
                habitsList.append(sourse.habit)
                print(habitsList)
                print(habitsList.count)
                habitsTableView.insertRows(at: [newIndexPath], with: .bottom)
//                habitsTableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
//                habitsTableView.reloadData()
                
            }
    }
}


extension MainTrackerViewController {
    func saveThemeData(value: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "theme")
    }
    
    func retrieveThemeData() -> String{
        let defaults = UserDefaults.standard
        guard let savedValue = defaults.string(forKey: "theme") else { return "gray" }
        return savedValue
    }
}
