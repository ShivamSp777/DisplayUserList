
import UIKit

extension UIImageView {
    
    func setImage(from imageUrl: String?, placeholder: UIImage? = nil ) {
      
        DispatchQueue.global().async  {
            if let imageString =  imageUrl,
               let imageUrl = URL(string: imageString),
               let getImageFromUrl = try? Data(contentsOf: imageUrl) {
                guard let image = UIImage(data: getImageFromUrl) else { return }
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

