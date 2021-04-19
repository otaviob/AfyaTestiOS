//
//  EnterPinTextFieldViewModel.swift
//  Features
//
//  Created by Otavio Brito on 11/04/21.
//

import Foundation

class EnterPinTextFieldViewModel {
    var onBackspacePressed: (() -> Void)?

    // Just call back the provided closure
    func backspacePressed() {
        onBackspacePressed?()
    }
}
