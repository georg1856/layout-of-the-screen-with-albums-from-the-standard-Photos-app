//
//  ExtensionPhotoGalleryViewController.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import Foundation
import UIKit

extension PhotoGalleryViewController {

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, CellModel>(collectionView: collectionView)
        { collectionView, indexPath, itemIdentifier in

            let sectionType = Section.allCases[indexPath.section]

            switch sectionType {
            case .myAlbums:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier,
                                                                    for: indexPath) as? MyAlbumsCollectionViewCell else { fatalError() }
                cell.configure(with: itemIdentifier)
                return cell

            case .sharedAlbums:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier,
                                                                    for: indexPath) as? MyAlbumsCollectionViewCell else { fatalError() }
                cell.configure(with: itemIdentifier)
                return cell

            case .typesMediaFiles:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypesMediaFilesCollectionViewCell.identifier, for: indexPath) as? TypesMediaFilesCollectionViewCell else { fatalError() }
                cell.configure(with: itemIdentifier)
                return cell

            case .other:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypesMediaFilesCollectionViewCell.identifier, for: indexPath) as? TypesMediaFilesCollectionViewCell else { fatalError() }
                cell.configure(with: itemIdentifier)
                return cell
            }
        }

        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView,
                                                  kind: String,
                                                  indexPath: IndexPath) -> UICollectionReusableView? in

            let sectionType = Section.allCases[indexPath.section]

            switch sectionType {
            case .myAlbums:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                              withReuseIdentifier: MyAlbumsHeaderCollectionReusableView.identifier,
                                                                                              for: indexPath) as? MyAlbumsHeaderCollectionReusableView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView

            case .sharedAlbums:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                              withReuseIdentifier: MyAlbumsHeaderCollectionReusableView.identifier,
                                                                                              for: indexPath) as? MyAlbumsHeaderCollectionReusableView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView

            case .typesMediaFiles:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                              withReuseIdentifier: ListHeaderCollectionReusableView.identifier,
                                                                                              for: indexPath) as? ListHeaderCollectionReusableView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView

            case .other:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                              withReuseIdentifier: ListHeaderCollectionReusableView.identifier,
                                                                                              for: indexPath) as? ListHeaderCollectionReusableView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView
            }
        }

        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, CellModel> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellModel>()
        snapshot.appendSections([Section.myAlbums, Section.sharedAlbums, Section.typesMediaFiles, Section.other])

        let itemsMyAlbumSection = CellData.setCellsMyAlbumsSection()
        snapshot.appendItems(itemsMyAlbumSection, toSection: .myAlbums)

        let itemsSharedAlbumsSection = CellData.setCellsSharedAlbumsSection()
        snapshot.appendItems(itemsSharedAlbumsSection, toSection: .sharedAlbums)

        let itemsMediaTypesSection = CellData.setCellsTypesMediaFilesSection()
        snapshot.appendItems(itemsMediaTypesSection, toSection: .typesMediaFiles)

        let itemsOtherSection = CellData.setCellsOtherSection()
        snapshot.appendItems(itemsOtherSection, toSection: .other)

        return snapshot
    }

    func createCollectionViewLayout() -> UICollectionViewLayout {

        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            let sectionType = Section.allCases[sectionIndex]

            switch sectionType {
            case .myAlbums:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                             leading: 0,
                                                             bottom: 10,
                                                             trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(1))

                let subGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                subitem: item, count: 2)
                subGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                 leading: 0,
                                                                 bottom: 0,
                                                                 trailing: 10)

                let containerGroupSize = NSCollectionLayoutSize(widthDimension:
                                                        UIScreen.main.bounds.width > 400 ? .fractionalWidth(0.45) : .fractionalWidth(0.96),
                                                                heightDimension:
                                                        UIScreen.main.bounds.width > 400 ? .fractionalWidth(0.55) : .fractionalWidth(1.2))
                let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize,
                                                                        subitem: subGroup, count: 2)

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .absolute(50))
                let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                                elementKind: PhotoGalleryViewController.sectionHeaderElementKind,
                                                                                alignment: .topLeading)

                let section = NSCollectionLayoutSection(group: containerGroup)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 15,
                                                                bottom: 10,
                                                                trailing: 0)

                section.boundarySupplementaryItems = [headerSection]
                section.orthogonalScrollingBehavior = .groupPaging
                return section

            case .sharedAlbums:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                             leading: 0,
                                                             bottom: 20,
                                                             trailing: 10)

                let groupSize = NSCollectionLayoutSize(widthDimension:
                                                    UIScreen.main.bounds.width > 400 ? .fractionalWidth(0.45) : .fractionalWidth(0.95),
                                                       heightDimension:
                                                    UIScreen.main.bounds.width > 400 ? .fractionalWidth(0.3) : .fractionalWidth(0.6))

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitem: item, count: 2)

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .absolute(52))

                let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                                elementKind: PhotoGalleryViewController.sectionHeaderElementKind,
                                                                                alignment: .topLeading)

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 15,
                                                                bottom: 10,
                                                                trailing: 0)
                section.boundarySupplementaryItems = [headerSection]
                section.orthogonalScrollingBehavior = .groupPaging
                return section

            case .typesMediaFiles:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension:
                                                        UIScreen.main.bounds.width > 400 ? .fractionalWidth(0.07) : .fractionalWidth(0.1))

                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                                elementKind: PhotoGalleryViewController.sectionHeaderElementKind,
                                                                                alignment: .topLeading)

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0)
                section.boundarySupplementaryItems = [headerSection]

                return section

            case .other:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension:
                                                        UIScreen.main.bounds.width > 400 ? .fractionalWidth(0.07) : .fractionalWidth(0.1))

                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                                elementKind: PhotoGalleryViewController.sectionHeaderElementKind,
                                                                                alignment: .topLeading)

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0)
                section.boundarySupplementaryItems = [headerSection]

                return section
            }
        }

        layout.configuration = UICollectionViewCompositionalLayoutConfiguration()
        return layout
    }
}
