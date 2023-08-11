//
//  UIViewController+Ext.swift
//  Clima_weatherApp
//
//  Created by Sadia on 11/8/23.
//

import UIKit

extension UIViewController {
    
    
    // MARK: - Showing Toast
    func showToast(message: String, bottomPadding: Double) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 15)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.numberOfLines = 0 // Allow multiple lines of text
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        // Calculate the required width of the toast label based on the message
        let maxLabelWidth = self.view.frame.size.width - 40 // Adjust the maximum width as needed
        let messageSize = NSString(string: message)
            .boundingRect(
                with: CGSize(width: maxLabelWidth, height: CGFloat.greatestFiniteMagnitude),
                options: NSStringDrawingOptions.usesLineFragmentOrigin,
                attributes: [NSAttributedString.Key.font: toastLabel.font ?? UIFont.systemFont(ofSize: 15)],
                context: nil
            ).size
        let labelWidth = min(messageSize.width + 20, maxLabelWidth) // Add padding of 20 points or use the maximum width if the calculated width is larger
        
        toastLabel.frame = CGRect(x: (self.view.frame.size.width - labelWidth) / 2, y: self.view.frame.size.height - CGFloat(bottomPadding) - 38, width: labelWidth, height: 38)
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 2.0, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        })
    }
    //self.showToast(message: "Please Enter Bill", bottomPadding: 120)
}
