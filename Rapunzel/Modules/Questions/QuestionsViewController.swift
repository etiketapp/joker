//
//  QuestionsViewController.swift
//  Rapunzel
//
//  Created by tunay alver on 10.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Properties
    var presenter: QuestionsViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
}

// MARK: - QuestionsPresenterOutputDelegate
extension QuestionsViewController: QuestionsPresenterToViewProtocol {
    
    func didGetError() {
        
    }
    
    func didGetQuestions() {
        
    }
    
}
