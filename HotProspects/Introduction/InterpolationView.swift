//
//  InterpolationView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SwiftUI

struct InterpolationView: View {
    var body: some View {
        Image("example")
        // to remove blur
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct InterpolationView_Previews: PreviewProvider {
    static var previews: some View {
        InterpolationView()
    }
}
