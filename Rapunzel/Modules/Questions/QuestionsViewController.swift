//
//  QuestionsViewController.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol QuestionsViewControllerDelegate {
    func didGetZeroQuestions()
    func didFinished()
}

class QuestionsViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var userView: UIView!
    @IBOutlet private weak var questionNumberLabel: AppLabel!
    @IBOutlet private weak var timerLabel: AppLabel!
    @IBOutlet private weak var wildCardLabel: AppLabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var presenter: QuestionsViewToPresenterProtocol!
    var delegate: QuestionsViewControllerDelegate!
    
    var timer = Timer()
    var questionSeconds = 10 {
        didSet {
            timerLabel.text = String(questionSeconds)
        }
    }
    var wildCardSecond = 5
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        updateTopLabels()
        showLoadingDialog()
        presenter.getQuestions(number: 10)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
    //MARK: - Functions
    func prepare() {
        navigationItem.title = presenter.nick
        userView.backgroundColor = .appPaletteNinenth
        collectionView.backgroundColor = .appPaletteNinenth
        collectionView.register(QuestionCVCell.self)
    }
    
    func updateTopLabels() {
        let questionNumber = String(presenter.questionInfo.amount)
        let currentQuestionNumber = String(presenter.currentQuestionNumber + 1) //NOTE: - For readability
        questionNumberLabel.text = "\(currentQuestionNumber) / \(questionNumber)"
        wildCardLabel.text = String(presenter.wildCardNumber)
    }
    
    //MARK: - Go Next
    func goNext() {
        guard shouldGoNext() else {
            self.navigationController?.popViewController(animated: true)
            self.delegate.didFinished()
            return
        }
        disableViews(withAlpha: 0.9)
        self.timer.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter.currentQuestionNumber += 1
            self.collectionView.scrollTo(row: self.presenter.currentQuestionNumber)
            self.enableViews(withAlpha: 1)
            
            self.updateTopLabels()
            
            self.questionSeconds = 10
            self.startTimer()
        }
    }
    
    func shouldGoNext() -> Bool {
        if presenter.currentQuestionNumber == (presenter.questionInfo.amount + 1) {
            return false
        }else {
            return true
        }
    }
    
    //MARK: - Timer
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        print(questionSeconds)
        questionSeconds -= 1
        if questionSeconds == wildCardSecond && presenter.wildCardNumber != 0 {
            timer.invalidate()
            self.performAlertWithCompletionDouble(title: "Like to use Wild Card?", message: "Wild Card drops one wrong answer.", buttonTitle: "Nope", button2Title: "Use", style: .alert, buttonTapped: {
                self.startTimer()
            }) {
                self.presenter.useWildCard()
                self.startTimer()
            }
        }else if questionSeconds == 0 {
            goNext()
        }
    }
    
}

// MARK: - QuestionsPresenterOutputDelegate
extension QuestionsViewController: QuestionsPresenterToViewProtocol {
    func didGetErrorWildCard() {
        self.showError(message: "Can not use any more wild card.")
    }
    
    func didGetZeroQuestions() {
        hideLoadingDialog()
        self.navigationController?.popViewController(animated: true)
        self.delegate.didGetZeroQuestions()
    }
    
    func didGetError(error: ResponseError) {
        hideLoadingDialog()
        showError(message: error.message)
    }
    
    func didGetQuestions() {
        hideLoadingDialog()
        collectionView.reloadData()
        startTimer()
    }
    
    func didUseWildCard() {
        self.collectionView.reloadData()
        wildCardLabel.text = String(presenter.wildCardNumber)
    }
    
}

//MARK: - Collection View DataSource and Delegate
extension QuestionsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: QuestionCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.delegate = self
        cell.question = presenter.questions?[indexPath.row]
        return cell
    }
    
}

//MARK: - CollectionView Flow Layout
extension QuestionsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

//MARK: - Question CV Cell Delegate
extension QuestionsViewController: QuestionCVCellDelegate {
    func didAnswered() {
        goNext()
    }
}
