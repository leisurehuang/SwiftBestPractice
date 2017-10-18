//
//  UIViewControllerExtension.swift
//  BestPractice
//
//  Created by Lei Huang on 18/10/2017.
//  Copyright © 2017 leihuang. All rights reserved.
//

import UIKit
import PKHUD

extension UIViewController {

    func showSuccessHUD() {
        HUD.flash(.success, delay: 1.0)
    }

    func showFailHUD() {
        HUD.flash(.error, delay: 1.0)
    }

    func showProgressHUD() {
        HUD.flash(.progress)
    }

    func showSuccessHUD(_ text: String) {
        HUD.flash(.labeledSuccess(title: "Success", subtitle: text), delay: 1.0)
    }

    func showFailHUD(_ error: Error) {
        HUD.flash(.labeledError(title: "Error", subtitle: error.localizedDescription), delay: 1.0)
    }

    func showProgressHUD(_ text: String) {
        HUD.flash(.labeledProgress(title: "Progressing", subtitle: text))
    }

    func hiddenAllHUD() {
        HUD.hide()
    }
}
