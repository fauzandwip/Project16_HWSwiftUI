//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import CodeScanner
import SwiftUI

enum FilterType {
    case none, contacted, uncontacted
}

struct ProspectsView: View {
    @EnvironmentObject var vm: ProspectsViewModel
    
    var filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return vm.prospects
        case .contacted:
            return vm.prospects.filter { $0.isContacted }
        case .uncontacted:
            return vm.prospects.filter { !$0.isContacted }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    vm.isShowingScanner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
            .sheet(isPresented: $vm.isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Patito\npatito@gmail.com") {
                    vm.handleScan(result: $0)
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
