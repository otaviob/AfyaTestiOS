//
//  String+Localization.swift
//  Core
//
//  Created by Otavio Brito on 09/04/21.
//

import Foundation

public extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    func localizedWith(_ args: CVarArg...) -> String {
        String(format: localized, arguments: args)
    }
}
