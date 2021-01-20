import UIKit

enum ImageSaverError: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveDestinationPath
}

enum ImageType {
    case png
    case jpeg(compressionQuality: CGFloat)
}

class ImageController: UIViewController {
    
    let imageSaver = ImageSaverFacade()
    let image = UIImage(named: "red")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = image else { return }
        do {
            try imageSaver.save(image: image, type: .png, fileName: "new.png", overwrite: true)
        } catch {
            debugPrint(error)
        }
    }
}
