//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Kaique Lopes on 25/02/21.
//

import UIKit

// MARK: - UIButton Extension
extension UIButton {

    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
    
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    
    func jump() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: -10)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
    func selectOperation(_ selected: Bool) {
        
    }
}
