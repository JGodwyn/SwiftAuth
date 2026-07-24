//
//  ThemeChange.swift
//  SwiftAuth
//
//  Created by Gdwn on 08/01/2025.
//

import SwiftUI

struct ThemeChange: View {
    
    // holds the color scheme
    // you can only get from this value, can't assign to it.
    @Environment(\.colorScheme) private var colorscheme
    
    // this holds the value the system will read from
    // I want it to persist, that's why it is stored here
    @AppStorage("SystemTheme") private var SystemTheme : SchemeType = .system
    
    // this handles the switching of the theme
    // I could have done this without the AppStorage but the
    // value will not persist
    private var selectedScheme : ColorScheme? {
        switch SystemTheme {
        case .system:
            return nil // returning nil will choose the system
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    var body: some View {
        ZStack {
            BrandColors.primary
                .ignoresSafeArea()
            VStack {
                AppImages.weather
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(colorscheme == .light ? "Light mode" : "Dark mode")
                    .foregroundStyle(.white)
                
                // this changes the value of SystemTheme
                Picker(selection: $SystemTheme) {
                    ForEach(SchemeType.allCases) { item in
                        Text(item.title)
                    }
                } label: {
                    Text("Pick a theme")
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(.white, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
        }
        .preferredColorScheme(selectedScheme)
    }
}

#Preview {
    ThemeChange()
}


