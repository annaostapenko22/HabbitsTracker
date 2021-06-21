//
//  AddHabitViewController.swift
//  TravelApp
//
//  Created by Oleg Tsarenkoff on 18.06.21.
//

import UIKit

class AddHabitViewController: UITableViewController {
    
    var habit: Habit!
    
    //MARK: - IBOutlets and Settings
    @IBOutlet weak var saveHabitButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    
    @IBOutlet weak var newHabitTextField: UITextField!
    @IBOutlet weak var descriptionHabitTextField: UITextField!
    
    @IBOutlet weak var datePickerHabit: UIDatePicker!
    @IBOutlet weak var repeatSwitchHabit: UISwitch!
    @IBOutlet weak var targetSwitchHabit: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setThemeColors(mainElement: self.tableView, secondaryElement: navigationController?.navigationBar)
        
        newHabitTextField.delegate = self
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
        
        newHabitTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        setBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setThemeColors(mainElement: self.tableView, secondaryElement: navigationController?.navigationBar)
        self.tableView.reloadData()
        
        if habit == nil {
            newHabitTextField.text = ""
        } else {
            newHabitTextField.text = habit.title
        }
    }
    
    private func setBarItem() {
        saveHabitButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 17)!], for: .normal)
        cancelButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 17)!], for: .normal)
        saveHabitButton.isEnabled = false
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if habit == nil {
            habit = Habit(title: "", declaration: "", image: "", isCheck: false)
        }
        habit.title = newHabitTextField.text!
        habit.declaration = descriptionHabitTextField.text ?? ""
        habit.image = "read"
        habit.isCheck = false
    }
}

// MARK: - Text field delegate

extension AddHabitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if newHabitTextField.text?.isEmpty == false {
            saveHabitButton.isEnabled = true
        } else {
            saveHabitButton.isEnabled = false
        }
    }
}



