//
//  Extension.swift
//  DayFinder
//
//  Created by patricija.vainovska on 16/04/2023.
//

import UIKit

extension UIViewController {
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
        }
    }
}
