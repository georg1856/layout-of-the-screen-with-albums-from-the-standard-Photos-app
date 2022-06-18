//
//  MyAlbumsCollectionViewCell.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import UIKit

class MyAlbumsCollectionViewCell: UICollectionViewCell {

    static let identifier = "MyAlbumsCollectionViewCell"

    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()

    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.numberOfLines = 1
        return nameLabel
    }()

    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.font = UIFont.systemFont(ofSize: 15)
        numberLabel.textColor = .systemGray
        numberLabel.numberOfLines = 1
        return numberLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.clipsToBounds = true
        contentView.addSubview(view)
        view.addSubview(image)
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.heightAnchor, constant: -45),
            view.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -45)
        ])

        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            numberLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}

extension MyAlbumsCollectionViewCell {
    func configure(with model: CellModel) {
        image.image = UIImage(named: model.imageName)
        nameLabel.text = model.labelName
        numberLabel.text = model.labelCount
    }
}

