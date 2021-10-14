//
//  RadioButtonController.swift
//  Gluco App
//
//  Created by Anjali on 8/6/21.
//

import UIKit

class RadioButtonController: NSObject {
    
        var buttonsArray: [UIButton]! {
            didSet {
                for b in buttonsArray {
                    b.setImage(UIImage(named: "UncheckedRadio"), for: .normal)
                    b.setImage(UIImage(named: "CheckedRadio"), for: .selected)
                }
            }
        }
        var selectedButton: UIButton?
        var defaultButton: UIButton = UIButton() {
            didSet {
                buttonArrayUpdated(buttonSelected: self.defaultButton)
            }
        }

        func buttonArrayUpdated(buttonSelected: UIButton) {
            for b in buttonsArray {
                if b == buttonSelected {
                    selectedButton = b
                    b.isSelected = true
                } else {
                    b.isSelected = false
                }
            }
        }
    


}
