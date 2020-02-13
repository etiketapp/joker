//
//  QuestionCVCell.swift
//  Rapunzel
//
//  Created by tunay alver on 11.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol QuestionCVCellDelegate {
    func didAnswered()
}

class QuestionCVCell: BaseCVCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var contentBackgroundView: UIView!
    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet private weak var aView: SelectionView!
    @IBOutlet private weak var bView: SelectionView!
    @IBOutlet private weak var cView: SelectionView!
    @IBOutlet private weak var dView: SelectionView!
    
    var delegate: QuestionCVCellDelegate!
    
    //MARK: - Properties
    var question: Question! {
        didSet {
            fill(question: question)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentBackgroundView.backgroundColor = .appPaletteNinenth
        
        aView.delegate = self
        bView.delegate = self
        cView.delegate = self
        dView.delegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let selectionViews = [aView, bView, cView, dView]
        for view in selectionViews {
            view?.state = .normal
            view?.updateBorder()
        }
    }
    
    //MARK: - Functions
    func fill(question: Question) {
        questionLabel.text = question.question
        let selectionViews: [SelectionView] = [aView, bView, cView, dView]
        fillSelectionView(selectionViews: selectionViews, question: question, rightQuestion: question.correct_answer)
    }
    
    func fillSelectionView(selectionViews: [SelectionView], question: Question, rightQuestion: String) {
        for selectionView in selectionViews {
            selectionView.isHidden = true
        }
        let questions = question.shuffledAnswers
        for (index, question) in questions!.enumerated() {
            selectionViews[index].prepare(delegate: self, question: question, rightQuestion: rightQuestion)
            selectionViews[index].isHidden = false
        }
    }
    
}

//MARK: - SelectionView Delegate
extension QuestionCVCell: SelectionViewDelegate {
    func didTapped(tappedView: SelectionView) {
        switch tappedView.state {
        case .right:
            tappedView.updateBorder()
        default:
            updateForWrongSelection(tappedView: tappedView)
        }
        delegate.didAnswered()
    }
    
    //MARK: -
    func updateForWrongSelection(tappedView: SelectionView) {
        let selectionViews = [aView, bView, cView, dView]
        for view in selectionViews {
            switch view?.state! {
            case .right:
                tappedView.state = .wrong
                tappedView.updateBorder()
                view?.updateBorder()
            default:
                break
            }
        }
    }
    
}
