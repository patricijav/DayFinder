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
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        // Unsafe way
        // dateComponents.day = Int(dayTextField.text!)
        // Safe way
        guard let myDay = Int(dayTextField.text ?? ""), let myMonth = Int(monthTextField.text ?? ""), let myYear = Int(yearTextField.text ?? "") else {
            #warning("WARNING: Input error!")
            // HW warning for alert input
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
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            let weekday = dateFormatter.string(from: myDate)
            resultLabel.text = weekday.capitalized
            // HW check input for right values (it accepts 0), also clear
        default:
            findButton.setTitle("Find", for: .normal)
            clearMyTextField()
        }
    }//findButtonTapped
    
    //extra controolers change black to white
    
    
    func clearMyTextField() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Result"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

