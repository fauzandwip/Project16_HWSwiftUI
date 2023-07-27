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

// MARK: - Challenge 3
enum FilterSort {
    case name, recent
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
    
    // MARK: - Challenge 3
    var filteredProspectsSorted: [Prospect] {
        switch vm.filterSort {
        case .name:
            return filteredProspects.sorted { $0.name < $1.name }
        case .recent:
            return filteredProspects.sorted { $0.date > $1.date }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Challenge 3
                ForEach(filteredProspectsSorted) { prospect in
                    HStack {
                        // MARK: - Challenge 1
                        if filter == .none {
                            Image(systemName: prospect.isContacted ? "envelope.open.fill" : "envelope.fill")
                                .font(.system(size: 30))
                        }

                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                vm.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                vm.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                vm.addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                // MARK: - Challenge 3
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        vm.isShowingSort = true
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
            }
            .sheet(isPresented: $vm.isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: vm.dummyData.randomElement()!) {
                    vm.handleScan(result: $0)
                }
            }
            // MARK: - Challenge 3
            .confirmationDialog("Sort by", isPresented: $vm.isShowingSort) {
                Button("Name" + (vm.filterSort == .name ? " ✓" : "")) { vm.filterSort = .name }
                Button("Recent" + (vm.filterSort == .recent ? " ✓" : "")) { vm.filterSort = .recent }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(ProspectsViewModel())
    }
}
