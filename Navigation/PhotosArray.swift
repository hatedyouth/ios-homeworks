
import UIKit

var photosArray: [UIImage] = []
func createPhotosArray() {
    photosArray = (0...19).compactMap { UIImage(named: "photo\($0)")?.resizeWithWidth(width: 300) }
}



