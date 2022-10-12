//
//  ShotListViewController.swift
//  DayKiller
//
//  Created by Павел Оливейра on 04/10/22.
//

import UIKit

class ShotListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    
    var dataSource = DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellResgistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let shot = Shot.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = shot.title
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellResgistration, for: indexPath, item: itemIdentifier)
        })
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

