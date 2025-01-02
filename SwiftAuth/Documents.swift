//
//  Settings.swift
//  SwiftAuth
//
//  Created by Gdwn on 01/01/2025.
//

import SwiftUI

struct Documents: View {
    
    @Binding var showDocuments : Bool
    @Environment (\.dismiss) private var dismissScreen // dismiss screen (recommended)
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 16) {
                Image(systemName: "folder.fill")
                    .font(.system(size: 48))
                Text("This is the documents page")
                
                MainButton(label: "Go back") {
                    dismissScreen()
                }
            }
            .navigationTitle("Documents")
            .toolbar(showDocuments ? .visible : .hidden)
            .toolbar {
                Button("Go back") {
                    showDocuments = false
                    dismissScreen()
                }
            }
        }
    }
}

#Preview {
    Documents(showDocuments: .constant(true))
}
