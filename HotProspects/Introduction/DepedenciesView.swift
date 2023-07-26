//
//  DepedenciesView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SamplePackage
import SwiftUI

struct DepedenciesView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibleNumbers.random(5).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct DepedenciesView_Previews: PreviewProvider {
    static var previews: some View {
        DepedenciesView()
    }
}
