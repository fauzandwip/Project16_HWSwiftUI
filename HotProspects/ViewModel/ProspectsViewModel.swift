//
//  ProspectsViewModel.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import CodeScanner
import SwiftUI

@MainActor class ProspectsViewModel: ObservableObject {
    @Published var prospects: [Prospect]
    @Published var isShowingScanner = false
    
    init() {
        prospects = []
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let prospect = Prospect()
            prospect.name = details[0]
            prospect.emailAddress = details[1]
            prospects.append(prospect)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}
