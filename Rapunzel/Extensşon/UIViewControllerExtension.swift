//
//  UIViewControllerExtension.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation
import Lottie

extension UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - Hide Keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Navigation Functions
    func emptyNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func setNavigationBarBackButtonEmpty() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .appPaletteSecond
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func addAppIconToNavbar() {
        UINavigationBar.appearance().isTranslucent = false
        
        let logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoView.image = UIImage(named: "img_joker_nav")
        logoView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = logoView
    }
    
    //MARK: - Alert
    func performAlert(title: String, message: String, buttonTitle: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }
    
    func performAlertWithCompletionDouble(title: String, message: String, buttonTitle: String, button2Title: String, style: UIAlertController.Style, buttonTapped: @escaping () -> Void, button2Tapped: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: {(alert: UIAlertAction!) in buttonTapped()})
        let button2 = UIAlertAction(title: button2Title, style: .default, handler: {(alert: UIAlertAction!) in button2Tapped()})
        alert.addAction(button)
        alert.addAction(button2)
        present(alert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func dismissAlertController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func showError(message: String) {
        performAlert(title: "Error", message: message, buttonTitle: "OK", style: .alert)
    }
    
    //MARK: - Progress Hud
    func showLoadingDialog() {
        self.view.endEditing(true)
        self.hideLoadingDialog()
        LoadingViewPresenter.shared.show()
    }
    
    func hideLoadingDialog() {
        LoadingViewPresenter.shared.hide()
    }
    
    //MARK: - Disable and Enable
    func disableViews(withAlpha: CGFloat) {
        for view in self.view.subviews{
            view.isUserInteractionEnabled = false
            view.alpha = withAlpha
        }
    }
    
    func enableViews(withAlpha: CGFloat) {
        for view in self.view.subviews{
            view.isUserInteractionEnabled = true
            view.alpha = withAlpha
        }
    }
    
}
