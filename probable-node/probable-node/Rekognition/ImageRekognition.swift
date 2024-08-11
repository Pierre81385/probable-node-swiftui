//
//  ImagePicker.swift
//  probable-node
//
//  Created by m1_air on 8/10/24.
//

import SwiftUI
import AWSRekognition
import PhotosUI

struct ImageRekognition: View {
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    //@State private var selectedImage: UIImage?
    @State private var selectToggle: Bool = false
    @State private var isImagePickerPresented = false
    @State private var labels: [String] = []
    
    var body: some View {
        VStack {
            
                PhotosPicker(
                    selection: $selectedImage,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    if(selectToggle) {
                        if let selectedImageData,
                           let uiImage = UIImage(data: selectedImageData) {
                            VStack {
                                Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 300, height: 300)
                                Button("Analyze Image") {
                                                
                                                    analyzeImage(image: uiImage)
                                                
                                            }
                                            
                                            List(labels, id: \.self) {
                                                Text($0)
                                            }
                            }
                        }

                    } else {
                        Image(systemName: "camera.circle")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 50, height: 50)
                    }
                }
                
            } .onChange(of: selectedImage) { oldItem, newItem in
                Task {
                    if let newItem = newItem,
                       let data = try? await newItem.loadTransferable(type: Data.self),
                       let originalUIImage = UIImage(data: data) {
                        
                        // Compress the image with the desired quality (e.g., 0.5 for medium quality)
                        let compressedImageData = originalUIImage.jpegData(compressionQuality: 0.2)
                        
                        // Use the compressed image data
                        selectedImageData = compressedImageData
                        
                        // Toggle the selection
                        selectToggle.toggle()
                        
                    } else {
                        // Handle cases where either newItem is nil or data loading failed
                        print("Failed to load image data.")
                    }
                }
            }
    }
    
    func analyzeImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.7) else { return }
        
        let rekognition = AWSRekognition.default()
        let request = AWSRekognitionDetectLabelsRequest()!
        request.image = AWSRekognitionImage()
        request.image?.bytes = imageData

        rekognition.detectLabels(request) { (result, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let labels = result?.labels {
                self.labels = labels.compactMap { label in
                    if let name = label.name, let confidence = label.confidence {
                        return "\(name) - \(confidence)"
                    }
                    return nil
                }
            }
        }
    }
}

#Preview {
    ImageRekognition()
}
