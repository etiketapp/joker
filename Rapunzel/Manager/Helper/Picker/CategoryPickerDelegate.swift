//
//  CategoryPickerDelegate.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import ActionSheetPicker_3_0

class CategoryPickerDelegate: NSObject, ActionSheetCustomPickerDelegate {
    
    typealias CategoryPickerSuccessClosure = ((_ row: Int, _ identity: Category) -> Void)
    
    var selectedCategory: Category!
    var selectedrow: Int!
    var categories: [Category] = QuestionConstants.createCategories()
    
    var success: CategoryPickerSuccessClosure!
    
    init(_ initialSelection: Int, success: @escaping CategoryPickerSuccessClosure) {
        self.selectedrow = initialSelection
        self.selectedCategory = categories[initialSelection]
        self.success = success
    }
    
    func actionSheetPickerDidSucceed(_ actionSheetPicker: AbstractActionSheetPicker!, origin: Any!) {
        self.success(selectedrow, selectedCategory)
    }
    
    func actionSheetPicker(_ actionSheetPicker: AbstractActionSheetPicker!, configurePickerView pickerView: UIPickerView!) {
        pickerView.showsSelectionIndicator = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedrow = row
        selectedCategory = categories[row]
    }
    
}
