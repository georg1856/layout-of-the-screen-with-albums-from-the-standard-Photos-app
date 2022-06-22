//
//  PhotoGalleryViewController.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import UIKit


class PhotoGalleryViewController: UIViewController {

    enum Section: String, CaseIterable {
        case myAlbums = "Мои альбомы"
        case sharedAlbums = "Общие альбомы"
        case typesMediaFiles = "Типы медиафайлов"
        case other = "Другое"
    }

    static let sectionHeaderElementKind = "sectionHeaderElementKind"
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, CellModel>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"

        configureCollectionView()
        configureDataSource()
        setupHierarchy()
        setupLayout()
        setupNavigationController()
    }
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setupNavigationController() {
        let plusBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        navigationItem.setLeftBarButton(plusBarButton, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
    }

    @objc private func addButtonClick() {
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame,
                                          collectionViewLayout: createCollectionViewLayout())

        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = dataSource

        collectionView.register(MyAlbumsCollectionViewCell.self,
                                forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier)

        collectionView.register(MyAlbumsHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: PhotoGalleryViewController.sectionHeaderElementKind,
                                withReuseIdentifier: MyAlbumsHeaderCollectionReusableView.identifier)

        collectionView.register(TypesMediaFilesCollectionViewCell.self,
                                forCellWithReuseIdentifier: TypesMediaFilesCollectionViewCell.identifier)

        collectionView.register(ListHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: PhotoGalleryViewController.sectionHeaderElementKind,
                                withReuseIdentifier: ListHeaderCollectionReusableView.identifier)
    }
}
