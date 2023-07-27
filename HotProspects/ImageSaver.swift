//
//  ImageSaver.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 27/07/23.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
