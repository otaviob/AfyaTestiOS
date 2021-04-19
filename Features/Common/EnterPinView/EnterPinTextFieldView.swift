//
//  EnterPinTextFieldView.swift
//  Features
//
//  Created by Otavio Brito on 11/04/21.
//

import UIKit

class EnterPinTextFieldView: UITextField {
    var viewModel = EnterPinTextFieldViewModel()

    // Get the backspace event to be able to trigger
    // the deletion on the pin input
    override func deleteBackward() {
        super.deleteBackward()
        viewModel.backspacePressed()
    }
}
