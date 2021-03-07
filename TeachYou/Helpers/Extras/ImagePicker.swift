//
//  ImagePicker.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 06/12/19.
//  Copyright © 2019 Rnf-Yogita. All rights reserved.
//

import Foundation
import UIKit
import Photos
import MobileCoreServices
protocol ImagePickerDelegate:class{
    func imagePicked(image:UIImage)
    func pickedImageName(image:UIImage,imageName:String)
}
class ImagePicker:UIImagePickerController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    weak var imageDelegate : ImagePickerDelegate?
    
    func openGallery()
    {
        self.allowsEditing = false
        self.sourceType = UIImagePickerController.SourceType.photoLibrary
        //self.mediaTypes = [(kUTTypePNG as String), (kUTTypeJPEG as String), (kUTTypeImage as String),(kUTTypeJPEG2000 as String),(kUTTypeURL as String)] // This is an array - you can add other format Strings as well
        if ImageString.image == "Image"{
            self.mediaTypes = ["public.image"]
        }else{
            self.mediaTypes = ["public.movie"]
        }

        Utilities.topViewController()?.present(self, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            self.allowsEditing = false
            self.sourceType = UIImagePickerController.SourceType.camera
            if ImageString.image == "Image"{
               self.mediaTypes = ["public.image"]
            self.cameraCaptureMode = .photo

            }else{
               // self.mediaTypes = ["public.movie"]
                self.mediaTypes = [kUTTypeMovie as String]
                self.cameraCaptureMode = .video

            }
            Utilities.topViewController()?.present(self, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: Validation.kCameraNotFound, message: Messages.kDeviceWithNoCamera, preferredStyle: .alert)
            let ok = UIAlertAction(title: Validation.kOK, style:.default, handler: nil)
            alert.addAction(ok)
            Utilities.topViewController()?.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[.originalImage] as? UIImage{
        imageDelegate?.imagePicked(image: chosenImage)
        if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset {
            let assetResources = PHAssetResource.assetResources(for: asset)
            imageDelegate?.pickedImageName(image: chosenImage, imageName: assetResources.first!.originalFilename)
            print(assetResources.first!.originalFilename)
        }else{
            imageDelegate?.pickedImageName(image: chosenImage, imageName: "IMG_Captured.jpeg")
        }
        }else{
            guard
                let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
                mediaType == (kUTTypeMovie as String),
                let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
            
            else { return }
            print(url)
            UserDefaults.standard.set(url, forKey: "videoURL")
            UserDefaults.standard.synchronize()

        }
        dismiss(animated: true, completion: nil)
        }

    
    func uploadImage()
    {
        self.delegate = self
        
        let actionSheetController: UIAlertController = UIAlertController(title: Messages.kUpload_Image, message: "", preferredStyle: .actionSheet)
        let cancelAction: UIAlertAction = UIAlertAction(title: Messages.kCancel, style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        let takePictureAction: UIAlertAction = UIAlertAction(title:Messages.kTake_Picture, style: .default) { action -> Void in
            self.openCamera()
        }
        actionSheetController.addAction(takePictureAction)
        let choosePictureAction: UIAlertAction = UIAlertAction(title: Messages.kChoose_Existing, style: .default) { action -> Void in
            self.openGallery()
        }
        actionSheetController.addAction(choosePictureAction)
        Utilities.topViewController()?.present(actionSheetController, animated: true, completion: nil)
    }
}




