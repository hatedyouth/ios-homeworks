

import UIKit
import StorageService
import iOSIntPackage

 class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    private lazy var authorOfPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        label.toAutoLayout()
        
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    private lazy var descriptionOfPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.toAutoLayout()
        
        return label
    }()
    
    private lazy var likesOfPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        
        return label
    }()
    
    private lazy var viewsOfPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        
        return label
    }()
    
//    var post: Post? {
//        didSet {
//            authorOfPost.text = post?.author
//            postImageView.image = UIImage(named: post!.image)
//            descriptionOfPost.text = post?.description
//            likesOfPost.text = "Likes: \(post?.likes ?? 0)"
//            viewsOfPost.text = "Views: \(post?.views ?? 0)"
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        contentView.addSubviews(authorOfPost, postImageView, descriptionOfPost, likesOfPost, viewsOfPost)
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            authorOfPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorOfPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorOfPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            postImageView.topAnchor.constraint(equalTo: authorOfPost.bottomAnchor, constant: 12),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionOfPost.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionOfPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionOfPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            likesOfPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesOfPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            viewsOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            viewsOfPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsOfPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension PostTableViewCell {
    
    
    public func configureCell(title: String, image: String, description: String, likes: Int, views: Int) {
        self.authorOfPost.text = title
        self.postImageView.image = UIImage(named: image)
        self.descriptionOfPost.text = description
        self.likesOfPost.text = "Likes: \(likes)"
        self.viewsOfPost.text = "Views: \(views)"
        
        
        
        let randomInt = Int.random(in: 1...8)
        let filter: ColorFilter?

        switch randomInt {
        case 1: filter = .posterize
        case 2: filter = .colorInvert
        case 3: filter = .transfer
        case 4: filter = .noir
        case 5: filter = .tonal
        case 6: filter = .process
        case 7: filter = .chrome
        case 8: filter = .fade
        default: filter = nil
        }

        let processor = ImageProcessor()
        guard let filter = filter else { return }
        guard let image = postImageView.image else { return }

        processor.processImage(sourceImage: image, filter: filter) { filteredImage in
            postImageView.image = filteredImage
        }

        print("К изображению поста \(String(describing: authorOfPost.text)) применен фильтр \(filter)")

        
    }
}
