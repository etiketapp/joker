//
//  BottomLineTextField.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import SwiftValidator

protocol BottomLineTextfieldDelegate {
    func didNormal(fieldType: BottomLineTextField.FieldType?)
    func isEditing(fieldType: BottomLineTextField.FieldType?)
    func didSuccess(fieldType: BottomLineTextField.FieldType?)
    func didError(fieldType: BottomLineTextField.FieldType?)
}

class BottomLineTextField: UITextField {
    
    var bottomLineTextfieldDelegate: BottomLineTextfieldDelegate?
    
    //MARK: - Outlets
    private var titleLabel: UILabel!
    private var bottomLine: UIView!
    private var rightImageView: UIImageView!
    private var errorLabel: UILabel!
    
    //MARK: - Image Names
    var successImage = UIImage(named: "ic_check_circle_green")
    var errorImage = UIImage(named: "ic_x_circle_red")
    
    //MARK: - Numbers
    var defaultPadding = CGFloat(20)
    var titleTopPadding = CGFloat(20)
    var bottomLineHeight = CGFloat(1)
    var bottomLineBottomPadding = CGFloat(20)
    var rightImageViewRightPadding = CGFloat(20)
    
    //MARK: - Properties
    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    var errorText: String! {
        didSet {
            errorLabel.text = errorText
        }
    }
    
    //MARK: - Fonts
    let titleFont = UIFont.systemFont(ofSize: 14, weight: .bold)
    let textFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    let errorFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    
    //MARK: State
    enum Status {
        case normal
        case editing
        case success
        case error
    }
    
    var status: Status? {
        didSet {
            updateViews()
            didUpdateStatus(status)
        }
    }
    
    //MARK: - Textfield type for delegate
    enum FieldType {
        case nick
        case number
        case category
        case difficulty
        case type
    }
    
    var fieldType: FieldType?
    
    var shouldCheckDidEnd = false //For picker delegate
    
    
    //MARK: - Next Textfield
    var nextTextfield: BottomLineTextField?
    
    //MARK: - Validator
    var validator = Validator()
    
    //MARK: - Init Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        delegate = self
        self.status = .normal
        
        addViews()
    }
    
    //MARK: - Set Title Texts
    func setTexts(title: String?, fieldType: FieldType, bottomLineTextfieldDelegate: BottomLineTextfieldDelegate) {
        self.title = title
        self.fieldType = fieldType
        self.bottomLineTextfieldDelegate = bottomLineTextfieldDelegate
        setWritingType()
        setValidatorRules()
    }
    
    override func draw(_ rect: CGRect) {
        updateSubviewsFrame()
    }
    
    //MARK: - Text or Number Field
    func setWritingType() {
        switch fieldType! {
        case .nick:
            self.keyboardType = .default
        case .number:
            self.keyboardType = .numberPad
        default:
            break
        }
    }
    
    //MARK: - Update Functions
    func addViews() {
        addTitleLabel()
        self.updateText(withColor: .appPaletteFirst, font: textFont)
        self.addErrorLabel()
        self.addBottomLine()
    }
    
    func updateViews() {
        switch status! {
        case .normal:
            self.updateTitleLabel(withColor: .appPaletteFirst)
            self.updateBottomLine(withColor: .appPaletteSeventh)
            self.updateRightImage(image: nil)
            self.updateErrorLabel(isHidden: true)
        case .editing:
            self.updateTitleLabel(withColor: .appPaletteSecond)
            self.updateBottomLine(withColor: .appPaletteSecond)
            self.updateRightImage(image: nil)
            self.updateErrorLabel(isHidden: true)
        case .success:
            self.updateTitleLabel(withColor: .appPaletteThird)
            self.updateRightImage(image: successImage)
            self.updateBottomLine(withColor: .appPaletteSeventh)
            self.updateErrorLabel(isHidden: true)
        case .error:
            self.updateTitleLabel(withColor: .appPaletteThird)
            self.updateBottomLine(withColor: .appPaletteFifth)
            self.updateRightImage(image: errorImage)
            self.updateErrorLabel(isHidden: false)
        }
    }
    
    //MARK: - Title
    func addTitleLabel() {
        titleLabel = UILabel(frame: CGRect(x: defaultPadding, y: titleTopPadding, width: self.frame.width, height: 20))
        titleLabel.textColor = .appPaletteFirst
        titleLabel.font = titleFont
        titleLabel.translatesAutoresizingMaskIntoConstraints = true
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        self.addSubview(titleLabel)
    }
    
    func updateTitleLabel(withColor: UIColor) {
        guard titleLabel != nil else { return }
        titleLabel.textColor = withColor
    }
    
    func updateText(withColor: UIColor, font: UIFont) {
        self.contentVerticalAlignment = .center
        self.tintColor = withColor
        self.font = font
        self.textColor = withColor
    }
    
    //MARK: Right Image
    func updateRightImage(image: UIImage?) {
        if image != nil {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            rightView = imageView
        }else {
            self.rightViewMode = .never
            rightImageView = nil
        }
    }
    
    //MARK: - Error Label
    func addErrorLabel() {
        errorLabel = UILabel(frame: CGRect(x: defaultPadding, y: self.frame.height - 20, width: self.frame.width, height: 20))
        errorLabel.textColor = .appPaletteFifth
        errorLabel.font = errorFont
        errorLabel.translatesAutoresizingMaskIntoConstraints = true
        errorLabel.textAlignment = .left
        errorLabel.numberOfLines = 1
        errorLabel.isHidden = true
        self.addSubview(errorLabel)
    }
    
    func updateErrorLabel(isHidden: Bool) {
        guard errorLabel != nil else { return }
        errorLabel.isHidden = isHidden
    }
    
    func addBottomLine() {
        bottomLine = UIView(frame: CGRect(x: 20, y: self.frame.height - bottomLineBottomPadding, width: self.frame.width - 2*defaultPadding, height: bottomLineHeight))
        bottomLine.backgroundColor = .appPaletteSeventh
        self.addSubview(bottomLine)
    }
    
    func updateBottomLine(withColor: UIColor) {
        guard bottomLine != nil else { return }
         bottomLine.backgroundColor = withColor
    }
    
    func updateSubviewsFrame() {
        guard bottomLine != nil else { return }
        bottomLine.frame = CGRect(x: 20, y: self.frame.height - bottomLineBottomPadding, width: self.frame.width - 2*defaultPadding, height: bottomLineHeight)
    }
    
    //MARK: - Text Rect
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: defaultPadding, left: defaultPadding, bottom: 0, right: defaultPadding + 16))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: defaultPadding, left: defaultPadding, bottom: 0, right: defaultPadding + 16))
    }
    
    //MARK: - Right View Rect
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        //NOTE: - 16 is image default height
        return CGRect(x: self.frame.width - defaultPadding - 16, y: self.frame.height - defaultPadding - 26, width: 16, height: 16)
    }
    
    //MARK: - Re Validate
    func revalidate() {
        validator.validate(self)
    }
    
}

//MARK: - Delegate
extension BottomLineTextField: UITextFieldDelegate {
    
    //MARK: Begin
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.status = .editing
    }
    
    //MARK: End
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch fieldType {
        case .category:
            if shouldCheckDidEnd {
                validator.validate(self)
            }
        case .difficulty:
            if shouldCheckDidEnd {
                validator.validate(self)
            }
        case .type:
            if shouldCheckDidEnd {
               validator.validate(self)
            }
        case .number:
            let intValue = Int(self.text!)
            if intValue ?? 0 > 50 {
                self.errorText = "Number should be smaller than 50"
                self.status = .error
            }else if intValue == 0 {
                self.errorText = "Number should not be equal to 0"
                self.status = .error
            }else {
                validator.validate(self)
            }
        default:
            validator.validate(self)
        }
    }
    
    //MARK: - Change
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch fieldType {
        case .nick:
            return limitField(textField: textField, range: range, string: string, limit: 23)
        case .number:
            return limitField(textField: textField, range: range, string: string, limit: 2)
        default:
            return true
        }
    }
    
    //MARK: - Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        goNextTextfield()
        return true
    }
    
    //MARK: - GoNext
    func goNextTextfield() {
        if nextTextfield != nil {
            nextTextfield?.becomeFirstResponder()
        }else {
            self.endEditing(true)
        }
    }
    
    //MARK: - Limit
    func limitField(textField: UITextField, range: NSRange, string: String, limit: Int) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= limit
    }
    
    //MARK: - Register Textfield Delegate
    func didUpdateStatus(_ status: Status?) {
        switch status {
        case .normal:
            bottomLineTextfieldDelegate?.didNormal(fieldType: fieldType)
        case .editing:
            bottomLineTextfieldDelegate?.isEditing(fieldType: fieldType)
        case .success:
            bottomLineTextfieldDelegate?.didSuccess(fieldType: fieldType)
        case .error:
            bottomLineTextfieldDelegate?.didError(fieldType: fieldType)
        case .none:
            break
        }
    }
    
    //MARK: - Set Self Success
    func successIf(_ text: String?, _ atLeast: Int) {
        if text?.count ?? 0 > atLeast {
            self.status = .success
        }else {
            self.status = .error
        }
    }
    
}

//MARK: - Validation
extension BottomLineTextField: ValidationDelegate {
    
    func setValidatorRules() {
        switch fieldType! {
        case .nick:
            validator.registerField(self, rules: ValidatorRules.nickRules)
        case .number:
            validator.registerField(self, rules: ValidatorRules.numberRules)
        case .category:
            validator.registerField(self, rules: ValidatorRules.categoryRules)
        case .difficulty:
            validator.registerField(self, rules: ValidatorRules.difficultyRules)
        case .type:
            validator.registerField(self, rules: ValidatorRules.typeRules)
        }
    }
    
    func validationSuccessful() {
        self.status = .success
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        self.errorText = validationErrorMessage(errors)
        self.status = .error
    }
    
    func validationErrorMessage(_ errors: [(Validatable, ValidationError)]) -> String {
        var errorMessage = ""
        errors.forEach { (error) in
            errorMessage.append("\(error.1.errorMessage) ")
        }
        return errorMessage
    }
    
}
