//
//  TextFieldStyles.swift
//  SwiftAuth
//
//  Created by Gdwn on 28/12/2024.
//

import Foundation
import SwiftUI

struct WhiteTextField : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.white, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension TextFieldStyle where Self == WhiteTextField {
    static var whiteTextField : WhiteTextField { .init() }
}
