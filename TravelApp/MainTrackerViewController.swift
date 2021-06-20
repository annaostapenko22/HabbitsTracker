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
    
    let habitsList = Habit.getHabitList()
    
    
    fileprivate weak var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setThemeColors(mainElement: habitsTableView, secondaryElement: navigationController?.navigationBar)
        
        _ = FSCalendar(frame: CGRect(x: 0, y: 0	, width: 320, height: 100))
        habitsTableView.tableFooterView = UIView()
        habitsTableView.delegate = self
        habitsTableView.dataSource = self
        setUpCalendar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setThemeColors(mainElement: habitsTableView, secondaryElement: navigationController?.navigationBar)
        self.habitsTableView.reloadData()
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

