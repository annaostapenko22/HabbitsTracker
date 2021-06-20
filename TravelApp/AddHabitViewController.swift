//
//  AddHabitViewController.swift
//  TravelApp
//
//  Created by Oleg Tsarenkoff on 18.06.21.
//

import UIKit

class AddHabitViewController: UITableViewController {
    
    var habit: Habit!
    
    //MARK: - IBOutlets
    @IBOutlet weak var saveHabitButton: UIBarButtonItem!
    
    @IBOutlet weak var newHabitTextField: UITextField!
    @IBOutlet weak var descriptionHabitTextField: UITextField!
    
    @IBOutlet weak var datePickerHabit: UIDatePicker!
    @IBOutlet weak var repeatSwitchHabit: UISwitch!
    @IBOutlet weak var targetSwitchHabit: UISwitch!
    
    //MARK: - Public properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if habit == nil {
            newHabitTextField.text = ""
        } else {
            newHabitTextField.text = habit.title
        }
    }
    
    
    //MARK: - IBAction
    @IBAction func pressedAddButton(_ sender: UIBarButtonItem) {
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if habit == nil {
            habit = Habit(title: "", declaration: "", image: "", isCheck: false)
        }
        habit.title = newHabitTextField.text ?? ""
        habit.declaration = descriptionHabitTextField.text ?? ""
        habit.image = "read"
        habit.isCheck = false
    }
    
    
}

//MARK: - UITextFieldDelegate
extension AddHabitViewController: UITextFieldDelegate {

}



/*
 
 не успел реализовать скрытие клавиатуры (тут обычный метод не прокатывает, тк у нас скролл есть.
https://bestkora.com/IosDeveloper/dopolnenie-k-lektsii-8-kak-skryt-klaviaturu-posle-vvoda-teksta/
С этим можете не заморачиваться, если не мешает, я как вернусь - доделаю до конца.
 
Ну а остальное дело техники, думаю и без меня справитесь. Осталось по сути взять инфу с предыдущей дз. И я бы все же начал реализовывать все от таббарвьюконтроллера (можно у меня в домашке на гите посмотреть, и на занятии тоже отилчное решение есть).
 
Удачи! При возможности подключусь сразу же :)
 
 */


