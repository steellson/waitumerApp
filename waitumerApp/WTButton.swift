//
//  WTButton.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 05.11.2022.
//

import UIKit

class WTButton: UIButton {
    
    class func buildDefaultButton(with title: String, color: UIColor) -> UIButton {
        let b = UIButton()
        b.setTitle(title, for: .normal)
        b.setTitleColor(UIColor.systemBlue, for: .normal)
        b.setTitleShadowColor(.black, for: .normal)
        b.backgroundColor = color
        b.layer.cornerRadius = 16
        return b
    }
    
    
}
