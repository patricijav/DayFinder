//
//  ViewController.swift
//  DayFinder
//
//  Created by patricija.vainovska on 15/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // resultLabel.layer.cornerRadius = 10
    }

    
    @IBAction func findButtonTapped(_ sender: Any) {
        switch findButton.titleLabel?.text {
        case "Find":
            let calendar = Calendar.current
            var dateComponents = DateComponents()
            
            // Unsafe way
            // dateComponents.day = Int(dayTextField.text!)
            // Safe way
            // We could do it also separately to get message for each field
            guard let myDay = Int(dayTextField.text ?? ""), let myMonth = Int(monthTextField.text ?? ""), let myYear = Int(yearTextField.text ?? "") else {
                basicAlert(title: "ERROR", message: "One of the input fields contains a value that's not a number!")
                clearMyTextField()
                return
            }
            
            dateComponents.day = myDay
            dateComponents.month = myMonth
            dateComponents.year = myYear
            
            guard let myDate = calendar.date(from: dateComponents) else {return}
            
            let dateFormatter = DateFormatter()
            // dateFormatter.locale = Locale(identifier: "lv_LV")
            // I think English fits the app better
            dateFormatter.locale = Locale(identifier: "en_GB")
            dateFormatter.dateFormat = "EEEE" // 4 E full name, 3 E shortened
            // Writing this functionality myself to have more logic in the code, but we could have used a library
            if !(myYear >= 1) {
                basicAlert(title: "ERROR", message: "Year input field contains a value that is smaller than 1!")
                clearMyTextField()
                return
            }
            if !(myMonth >= 1 && myMonth <= 12) {
                basicAlert(title: "ERROR", message: "Month input field contains a value that is not between 1 and 12!")
                clearMyTextField()
                return
            }
            var daysInMonth = [31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
            daysInMonth[1] = myYear % 4 == 0 ? 29 : 28
            if !(myDay >= 1 && myDay <= daysInMonth[myMonth - 1]) {
                basicAlert(title: "ERROR", message: "Day input field contains a value that is not between 1 and the maximum days in the given month!")
                clearMyTextField()
                return
            }
            
            findButton.setTitle("Clear", for: .normal)
            let weekday = dateFormatter.string(from: myDate)
            resultLabel.text = weekday.capitalized
        default:
            findButton.setTitle("Find", for: .normal)
            clearMyTextField()
        }
    }
    
    func clearMyTextField() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Result"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
            let infoViewController = segue.destination as! InfoViewController
            infoViewController.studentName = "Patricija Vainovska"
            infoViewController.appInfo = "This is an app for finding the week day of a specific date. To make it more interesting it also does cool stuff when changing mode to dark and back!"
        }
    }
    
}

