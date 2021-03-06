//
//  UIView+Loading.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import UIKit

public extension UIView {
    // Shows a loading in the middle of the view
    func showLoading() {
        hideLoading()
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .gray
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        let centerYConstraint = activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)

        addSubview(activityIndicator)
        addConstraints([centerXConstraint, centerYConstraint])
        layoutIfNeeded()
    }

    // Hides the loading
    func hideLoading() {
        subviews
            .compactMap { $0 as? UIActivityIndicatorView }
            .forEach { $0.removeFromSuperview() }
        layoutIfNeeded()
    }
}
