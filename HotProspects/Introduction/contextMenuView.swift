//
//  contextMenuView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SwiftUI

struct contextMenuView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
                .background(backgroundColor)
                .clipShape(Capsule())
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

struct contextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        contextMenuView()
    }
}
