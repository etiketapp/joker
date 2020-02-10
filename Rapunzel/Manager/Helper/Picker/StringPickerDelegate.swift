//
//  StringPickerDelegate.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class StringPickerDelegate: NSObject, ActionSheetCustomPickerDelegate {
    
    typealias StringPickerSuccessClosure = ((_ row: Int, _ string: String) -> Void)
    
    var selectedSting: String!
    var selectedrow: Int!
    var strings: [String]!
    
    var success: StringPickerSuccessClosure!
    
    init(_ initialSelection: Int, success: @escaping StringPickerSuccessClosure, strings: [String]) {
        self.selectedrow = initialSelection
        self.selectedSting = strings[initialSelection]
        self.success = success
        self.strings = strings
    }
    
    func actionSheetPickerDidSucceed(_ actionSheetPicker: AbstractActionSheetPicker!, origin: Any!) {
        self.success(selectedrow, selectedSting)
    }
    
    func actionSheetPicker(_ actionSheetPicker: AbstractActionSheetPicker!, configurePickerView pickerView: UIPickerView!) {
        pickerView.showsSelectionIndicator = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return strings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return strings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedrow = row
        selectedSting = strings[row]
    }
    
}
