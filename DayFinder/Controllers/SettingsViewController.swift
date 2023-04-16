//
//  SettingsViewController.swift
//  DayFinder
//
//  Created by patricija.vainovska on 16/04/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var openSettingsButton: UIButton!
    @IBOutlet weak var interfaceModeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderToButton(theButton: closeButton)
        addBorderToButton(theButton: openSettingsButton)
        updateInteraceModeLabel()
    }
    
    func addBorderToButton(theButton: UIButton) {
        theButton.layer.borderColor = UIColor.label.cgColor
        theButton.layer.borderWidth = 1
        theButton.layer.masksToBounds = true
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openSettingsButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateInteraceModeLabel()
    }
    
    func updateInteraceModeLabel() {
        interfaceModeLabel.text = self.traitCollection.userInterfaceStyle == .dark ? "Dark mode is on" : "Light mode is on"
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
