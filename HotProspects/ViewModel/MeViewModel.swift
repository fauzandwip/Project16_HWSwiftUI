//
//  MeViewModel.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

class MeViewModel: ObservableObject {
    @Published var name = "Patito"
    @Published var emailAddress = "patito@gmail.com"
    @Published var qrCode = UIImage()
    
    let context = CIContext()
    var filter = CIFilter.qrCodeGenerator()
    
    func updateQRCode() {
        qrCode = getQRCode(from: "\(name)\n\(emailAddress)")
    }
    
    func getQRCode(from inputString: String) -> UIImage {
        filter.message = Data(inputString.utf8)
        
        if let ouputImage = filter.outputImage {
            if let cgImage = context.createCGImage(ouputImage, from: ouputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
