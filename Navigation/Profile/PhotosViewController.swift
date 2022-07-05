import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    var newPhotoArray: [UIImage] = []
    let facade = ImagePublisherFacade()
    
    private lazy var photosCollection: UICollectionView = {
        let photoCollectionLayout = UICollectionViewFlowLayout()
        photoCollectionLayout.scrollDirection = .vertical
        let photosCollection = UICollectionView(frame: .zero, collectionViewLayout: photoCollectionLayout)
        photosCollection.toAutoLayout()
        photosCollection.backgroundColor = .white
        photosCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        return photosCollection
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            photosCollection.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollection.dataSource = self
        photosCollection.delegate = self
        view.addSubview(photosCollection)
        setupConstraints()
        navigationController?.navigationBar.isHidden = false
        self.title = "Photo Gallery"
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name("notification"), object: nil)
        
        facade.subscribe(self)
        facade.addImagesWithTimer(time: 0.3, repeat: 20, userImages: photosArray)
    }
    
    deinit {
        facade.rechargeImageLibrary()
    }
    
    @objc private func reloadTable() {
        self.photosCollection.reloadData()
    }
}
extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newPhotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosCollection.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        cell.configureCell(image: newPhotoArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3
        let paddindWidth = 8 * (itemsPerRow + 1)
        let accessibleWidth = collectionView.frame.width - paddindWidth
        let widthPerItem = accessibleWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        newPhotoArray = images
        photosCollection.reloadData()
    }
}
