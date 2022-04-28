
import UIKit
import iOSIntPackage


var oldPhotosArray:[UIImage] = []
var photosArray: [UIImage] = []

func createPhotosArray() {
    
    let processor = ImageProcessor()
    
    photosArray = (0...19).compactMap { UIImage(named: "photo\($0)")?.resizeWithWidth(width: 300) }
    
    let methodStart = NSDate()
    
    processor.processImagesOnThread(sourceImages: photosArray, filter: .transfer, qos: .default) { images in

        DispatchQueue.main.async {
            photosArray = []
            for i in images {
                guard let image = i else { return }
                photosArray.append(UIImage(cgImage: image))
            }

            let methodFinish = NSDate()

            let executionTime = methodFinish.timeIntervalSince(methodStart as Date)
            print("Время выполнения метода: \(executionTime)")

            NotificationCenter.default.post(name: NSNotification.Name("notification"), object: nil)

        }
    }
}



