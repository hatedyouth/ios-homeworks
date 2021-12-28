
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire = "PhotosTableViewCell"
    
    private lazy var previewStackView: UIStackView = {
        let previewStackView = UIStackView()
        previewStackView.toAutoLayout()
        previewStackView.axis = .horizontal
        previewStackView.distribution = .fillEqually
        previewStackView.alignment = .center
        previewStackView.spacing = 8
        return previewStackView
    }()
    
    
    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        photosLabel.toAutoLayout()
        return photosLabel
    }()
    
    private lazy var arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        arrowImage.toAutoLayout()
        return arrowImage
    }()
    
    private lazy var previewImage1: UIImageView = {
        let previewImage1 = UIImageView()
        previewImage1.image = photosArray[19]
        previewImage1.toAutoLayout()
        previewImage1.layer.cornerRadius = 6
        previewImage1.clipsToBounds = true
        return previewImage1
    }()
    
    
    private lazy var previewImage2: UIImageView = {
        let previewImage2 = UIImageView()
        previewImage2.image = photosArray[1]
        previewImage2.toAutoLayout()
        previewImage2.layer.cornerRadius = 6
        previewImage2.clipsToBounds = true
        return previewImage2
    }()
    
    
    private lazy var previewImage3: UIImageView = {
        let previewImage3 = UIImageView()
        previewImage3.image = photosArray[2]
        previewImage3.toAutoLayout()
        previewImage3.layer.cornerRadius = 6
        previewImage3.clipsToBounds = true
        return previewImage3
    }()
    
    
    private lazy var previewImage4: UIImageView = {
        let previewImage4 = UIImageView()
        previewImage4.image = photosArray[3]
        previewImage4.toAutoLayout()
        previewImage4.layer.cornerRadius = 6
        previewImage4.clipsToBounds = true
        return previewImage4
    }()
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            previewStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            previewStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            previewStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            previewStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImage.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: 30),
            arrowImage.widthAnchor.constraint(equalToConstant: 30),
            
            previewImage1.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
            previewImage1.heightAnchor.constraint(equalTo: previewImage1.widthAnchor),
            
            previewImage2.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
            previewImage2.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
            
            previewImage3.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
            previewImage3.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
            
            previewImage4.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
            previewImage4.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
            
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.toAutoLayout()
        self.selectionStyle = .none
        contentView.addSubviews(photosLabel, arrowImage, previewStackView)
        previewStackView.addArrangedSubviews(previewImage1, previewImage2, previewImage3, previewImage4)
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    
    
    
    
    
    
}
