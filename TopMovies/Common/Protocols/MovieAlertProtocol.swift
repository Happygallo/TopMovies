//
//  MovieAlertProtocol.swift
//  TopMovies
//
//  Created by Javier Gallo Roca on 30/07/24.
//

import UIKit

protocol MovieAlertProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func presentCustomAlert(title: String, message: String, confirmAction: (() -> Void)?)
}

extension MovieAlertProtocol {
    func presentCustomAlert(
        title: String = "Something went wrong",
        message: String = "Please try again later",
        confirmAction: (() -> Void)? = nil
    ) {
        if let viewController {
            let customAlert = MoviesAlertViewController(title: title, message: message, confirmAction: confirmAction)
            customAlert.modalPresentationStyle = .overFullScreen
            customAlert.modalTransitionStyle = .crossDissolve
            viewController.present(customAlert, animated: true, completion: nil)
        }
    }
}
