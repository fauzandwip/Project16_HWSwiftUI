//
//  ContentViewModel.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import Foundation

@MainActor class ContentViewModel: ObservableObject {
    @Published var prospects: [Prospect]
    
    init() {
        prospects = []
    }
}
