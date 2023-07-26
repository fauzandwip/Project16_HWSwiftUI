//
//  swipeActionsView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SwiftUI

struct swipeActionsView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
            
                .swipeActions(edge: .leading) {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.yellow)
                }
        }
    }
}

struct swipeActionsView_Previews: PreviewProvider {
    static var previews: some View {
        swipeActionsView()
    }
}
