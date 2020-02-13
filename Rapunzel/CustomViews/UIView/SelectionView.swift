//
//  SelectionView.swift
//  Rapunzel
//
//  Created by tunay alver on 12.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol SelectionViewDelegate {
    func didTapped(tappedView: SelectionView)
}

class SelectionView: CorneredView {
    
    //MARK: - Outlet
    private var questionLabel: AppLabel!
    var isTapped: Bool! = false
    
    var defaultPadding = CGFloat(20)
    
    //MARK: - Properties
    enum State {
        case normal
        case right
        case wrong
    }
    var state: State! = .normal
    
    var delegate: SelectionViewDelegate?
    
    var question: String! {
        didSet {
            questionLabel.text = question
        }
    }
    var rightQuestion: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addQuestionLabel()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapped)))
    }
    
    //MARK: - Functions
    @objc func didTapped() {
        delegate?.didTapped(tappedView: self)
    }
    
    func updateBorder() {
        layer.borderWidth = 2
        let borderColor: UIColor!
        switch state! {
        case .normal:
            borderColor = .clear
        case .right:
            borderColor = .appPaletteFourth
        case .wrong:
            borderColor = .appPaletteFifth
        }
        layer.borderColor = borderColor.cgColor
    }
    
    //MARK: - Add Label
    func addQuestionLabel() {
        questionLabel = AppLabel(frame: CGRect(x: defaultPadding, y: defaultPadding, width: self.frame.width, height: 20))
        questionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        questionLabel.translatesAutoresizingMaskIntoConstraints = true
        questionLabel.textAlignment = .left
        questionLabel.numberOfLines = 1
        self.addSubview(questionLabel)
    }
    
    func prepare(delegate: SelectionViewDelegate, question: String, rightQuestion: String) {
        self.delegate = delegate
        self.question = question
        self.rightQuestion = rightQuestion
        checkIsRight()
    }
    
    
    func checkIsRight() {
        if self.rightQuestion == self.question {
            self.state = .right
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
}
