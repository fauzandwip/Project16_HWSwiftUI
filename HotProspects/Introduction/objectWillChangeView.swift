//
//  objectWillChangeView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SwiftUI

@MainActor class DelayUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct objectWillChangeView: View {
    @StateObject private var updater = DelayUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct objectWillChangeView_Previews: PreviewProvider {
    static var previews: some View {
        objectWillChangeView()
    }
}
