//
//  MyAlbumsHeaderCollectionReusableView.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import UIKit

class MyAlbumsHeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "MyAlbumsHeaderCollectionReusableView"

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Все", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
        addSubview(label)
        addSubview(button)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
