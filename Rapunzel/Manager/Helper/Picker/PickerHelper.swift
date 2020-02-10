//
//  PickerHelper.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class PickerHelper {
    
    //MARK: - String
    static func showStringPicker(_ view: UIView, title: String, initialSelection: Int, strings: [String], success: @escaping StringPickerDelegate.StringPickerSuccessClosure) {
        let picker = ActionSheetCustomPicker(title: title, delegate: StringPickerDelegate(initialSelection, success: { (row, string) in
            success(row, string)
        }, strings: strings), showCancelButton: true, origin: view)
        picker?.setCancelButton(UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil))
        picker?.setDoneButton(UIBarButtonItem(title: "OK", style: .plain, target: nil, action: nil))
        picker?.toolbarButtonsColor = .appPaletteSecond
        picker?.show()
    }
    
}
