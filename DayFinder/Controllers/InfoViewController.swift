//
//  InfoViewController.swift
//  DayFinder
//
//  Created by patricija.vainovska on 16/04/2023.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var appInfoLabel: UILabel!
    
    var studentName = ""
    var appInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentNameLabel.text = studentName
        appInfoLabel.text = appInfo
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
