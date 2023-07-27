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
                
                Image(uiImage: vm.qrCode)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .contextMenu {
                        Button {
                            ImageSaver().writeToPhotoAlbum(image: vm.qrCode)
                        } label: {
                            Label("Save to Photos", systemImage: "square.and.arrow.down")
                        }
                    }
            }
            .navigationTitle("Your QR Code")
            .onAppear(perform: vm.updateQRCode)
            .onChange(of: vm.name) { _ in vm.updateQRCode() }
            .onChange(of: vm.emailAddress) { _ in vm.updateQRCode() }
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
