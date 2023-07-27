//
//  ProspectsViewModel.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import CodeScanner
import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class ProspectsViewModel: ObservableObject {
    @Published var prospects: [Prospect]
    @Published var isShowingScanner = false
    
    let saveKey = "SaveData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                prospects = decoded
                return
            }
        }
        
        prospects = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(prospects) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
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
            save()
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
