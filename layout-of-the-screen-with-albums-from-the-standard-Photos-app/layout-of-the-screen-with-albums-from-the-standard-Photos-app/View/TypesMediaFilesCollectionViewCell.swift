//
//  TypesMediaFilesCollectionViewCell.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import UIKit

class TypesMediaFilesCollectionViewCell: UICollectionViewCell {

        static let identifier = "TypesMediaFilesCollectionViewCell"

        private let image: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode =  .scaleAspectFit
            image.tintColor = .systemBlue
            return image
        }()

        private let nameLabel: UILabel = {
            let nameLabel = UILabel()
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.font = UIFont.systemFont(ofSize: 20)
            nameLabel.textColor = .systemBlue
            nameLabel.numberOfLines = 1
            return nameLabel
        }()

        private let numberLabel: UILabel = {
            let numberLabel = UILabel()
            numberLabel.translatesAutoresizingMaskIntoConstraints = false
            numberLabel.font = UIFont.systemFont(ofSize: 16)
            numberLabel.textColor = .systemGray
            numberLabel.numberOfLines = 1
            return numberLabel
        }()

        private let indicatorImageView: UIImageView = {
            let indicatorImageView = UIImageView()
            indicatorImageView.translatesAutoresizingMaskIntoConstraints = false
            indicatorImageView.image = UIImage(systemName: "chevron.right")
            indicatorImageView.contentMode = .scaleAspectFit
            indicatorImageView.tintColor = .systemGray
            indicatorImageView.clipsToBounds = true
            return indicatorImageView
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)

            contentView.clipsToBounds = true
            contentView.addSubview(image)
            contentView.addSubview(nameLabel)
            contentView.addSubview(numberLabel)
            contentView.addSubview(indicatorImageView)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            NSLayoutConstraint.activate([
                image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])

            NSLayoutConstraint.activate([
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])

            NSLayoutConstraint.activate([
                indicatorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                indicatorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])

            NSLayoutConstraint.activate([
                numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
                numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
}

extension TypesMediaFilesCollectionViewCell {
    func configure(with model: CellModel) {
            image.image = UIImage(systemName: model.imageName)
            nameLabel.text = model.labelName
            numberLabel.text = model.labelCount
    }
}
