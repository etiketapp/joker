//
//  QuestionNumberViewController.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionNumberViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var nickTextfield: BottomLineTextField!
    @IBOutlet private weak var numberTextfield: BottomLineTextField!
    
    @IBOutlet private weak var categoryTextfield: BottomLineTextField!
    @IBOutlet private weak var difficultyTextfield: BottomLineTextField!
    @IBOutlet private weak var typeTextfield: BottomLineTextField!
    
    // MARK: - Properties
    var presenter: QuestionNumberViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNextTextfields()
        addAppIconToNavbar()
    }
    
    //MARK: - Functions
    func setNextTextfields() {
        nickTextfield.becomeFirstResponder()
        nickTextfield.nextTextfield = numberTextfield
        numberTextfield.returnKeyType = .done
        
        nickTextfield.setTexts(title: "Nick", fieldType: .nick, bottomLineTextfieldDelegate: self)
        numberTextfield.setTexts(title: "Number of Questions", fieldType: .number, bottomLineTextfieldDelegate: self)
        
        categoryTextfield.setTexts(title: "Category", fieldType: .category, bottomLineTextfieldDelegate: self)
        difficultyTextfield.setTexts(title: "Difficulty", fieldType: .difficulty, bottomLineTextfieldDelegate: self)
        typeTextfield.setTexts(title: "Type", fieldType: .type, bottomLineTextfieldDelegate: self)
        
    }
    
    //MARK: - Fill Presenter
    func setNickAmount() {
        presenter.nick = nickTextfield.text
        presenter.amount = Int(numberTextfield.text!)
    }
    
    //MARK: - Check Textfields
    func hasEmptyField() -> Bool {
        let textfields = [nickTextfield, numberTextfield]
        for fild in textfields {
            if fild?.status != .success {
                return true
            }
        }
        return false
    }
    
    //MARK: - Action
    @IBAction func goButtonTapped() {
        guard !hasEmptyField() else {
            self.showError(message: "Please check the fields.")
            return
        }
        setNickAmount()
        presenter.goAction(delegate: self)
    }
    
    
}

// MARK: - QuestionNumberPresenterOutputDelegate
extension QuestionNumberViewController: QuestionNumberPresenterToViewProtocol {

}

//MARK: - BottomLine Textfield Delegates
extension QuestionNumberViewController: BottomLineTextfieldDelegate {
    
    func didNormal(fieldType: BottomLineTextField.FieldType?) {
        //TODO: -
    }
    
    func isEditing(fieldType: BottomLineTextField.FieldType?) {
        switch fieldType {
        case .category:
            self.view.endEditing(true)
            self.categoryTextfield.shouldCheckDidEnd = false
            PickerHelper.showStringPicker(categoryTextfield, title: "Category", initialSelection: 0, strings: QuestionConstants.categoryNames) { (row, string) in
                self.categoryTextfield.text = string
                self.categoryTextfield.revalidate()
                guard row != 0 else {
                    self.presenter.selectedCategory = nil
                    self.presenter.selectedCategoryRow = nil
                    return
                }
                self.presenter.selectedCategory = string
                self.presenter.selectedCategoryRow = row + 9
            }
        case .difficulty:
            self.view.endEditing(true)
            self.difficultyTextfield.shouldCheckDidEnd = false
            PickerHelper.showStringPicker(categoryTextfield, title: "Difficulty", initialSelection: 0, strings: QuestionConstants.difficulties) { (row, string) in
                self.difficultyTextfield.text = string
                self.difficultyTextfield.revalidate()
                guard row != 0 else {
                    self.presenter.selectedDifficulty = nil
                    return
                }
                self.presenter.selectedDifficulty = QuestionConstants.difficultiesApi[row]
            }
        case .type:
            self.view.endEditing(true)
            self.typeTextfield.shouldCheckDidEnd = false
            PickerHelper.showStringPicker(categoryTextfield, title: "Type", initialSelection: 0, strings: QuestionConstants.types) { (row, string) in
                self.typeTextfield.text = string
                self.typeTextfield.revalidate()
                guard row != 0 else {
                    self.presenter.selectedType = nil
                    return
                }
                self.presenter.selectedType = QuestionConstants.typesApi[row]
            }
        default:
            break
        }
    }
    
    func didSuccess(fieldType: BottomLineTextField.FieldType?) {
        //TODO: -
    }
    
    func didError(fieldType: BottomLineTextField.FieldType?) {
        //TODO: -
    }
    
}


//MARK: - Questions ViewController Delegate
extension QuestionNumberViewController: QuestionsViewControllerDelegate {
    func didFinished() {
        self.showError(message: "Questions done")
    }
    
    func didGetZeroQuestions() {
        self.showError(message: "Could not find enough questions")
    }
}
