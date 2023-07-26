//
//  MeView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SwiftUI

struct MeView: View {
    @StateObject private var vm = MeViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $vm.name)
                        .textContentType(.name)
                        .font(.title)
                    
                    TextField("Email Address", text: $vm.emailAddress)
                        .textContentType(.emailAddress)
                        .font(.title)
                }
                
                    Image(uiImage: vm.getQRCode(from: "\(vm.name)\n\(vm.emailAddress)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
            }
            .navigationTitle("Your QR Code")
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
