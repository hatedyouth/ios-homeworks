import UIKit
import iOSIntPackage

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "PhotoCollectionViewCell"
    
    private lazy var photoCell: UIImageView = {
        let photo = UIImageView()
        photo.toAutoLayout()
        return photo
    }()
    
    public func configureCell(image: UIImage) {
        self.photoCell.image = image
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoCell.topAnchor.constraint(equalTo: self.topAnchor),
            photoCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            photoCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoCell.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
   override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoCell)
        setupConstraints()
    }
   required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   override func prepareForReuse() {
        super.prepareForReuse()
    }
}
