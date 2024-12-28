//
//  Buttons.swift
//  SwiftAuth
//
//  Created by Gdwn on 28/12/2024.
//

import SwiftUI


struct MainButton : View {
    
    let btnLabel : String
    let btnIcon : String
    let color : Color
    let height : CGFloat
    let fillContainer : Bool
    let btnDisabled : Bool
    let tappedButton : () -> Void
    
    // initialize with label, color, fillContainer, and function
    // default values are set for all of these except function
    init(label: String = "No label",
         icon: String = "none",
         color: Color = .accentColor,
         height: CGFloat = 40,
         fillContainer: Bool = false,
         disabled: Bool = false,
         action: @escaping () -> Void) {
            self.btnLabel = label
            self.color = color
            self.btnIcon = icon
            self.height = height
            self.fillContainer = fillContainer
            self.btnDisabled = disabled
            self.tappedButton = action
    }
    
    var body: some View {
        Button (action: tappedButton) {
            Text(btnLabel)
        }
        .disabled(btnDisabled)
        .opacity(btnDisabled ? 0.5 : 1)
        .buttonStyle(MainButtonStyle(iconName: btnIcon, color: btnDisabled ? .gray : color, height: height, fillContainer: fillContainer))
    }
}


struct PlainButton: View {
    
    let btnLabel : String // label on button
    let tappedButton : () -> Void // when they tap the button
    
    var body: some View {
        Button (action: tappedButton) {
            Text(btnLabel)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct IconLabelButton : View {
    
    let btnLabel : String  // label on button
    let btnImage : String // image on button
    let tappedButton : () -> Void // when they tap the button
    
    // see what happens here
    // in the PlainButtonStyle declaration, I already have an HStack
    // Here, I added another one to place my icon in.
    var body: some View {
        Button (action: tappedButton){
            HStack {
                Image(systemName: btnImage)
                Text(btnLabel)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
}


#Preview {
    Group {
        PlainButton(btnLabel: .init("Plain button")){}
        IconLabelButton(btnLabel: .init("Icon button"), btnImage: .init("button.programmable")){}
        MainButton(){}
        MainButton(icon: "plus"){}
        MainButton(icon: "plus", disabled: true){}
        MainButton(label: "Default button"){}
        MainButton(label: "Red button", color: .red){}
        MainButton(label: "Red button", color: .red, disabled: true){}
        MainButton(label: "Green button", color: .green, fillContainer: true){}
        MainButton(label: "Green button", color: .green, height: 48, fillContainer: false){}
    }
    .padding(8)
}
