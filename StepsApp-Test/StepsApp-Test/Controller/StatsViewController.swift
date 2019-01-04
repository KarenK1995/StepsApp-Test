//
//  StatsViewController.swift
//  StepsApp-Test
//
//  Created by Karen Karapetyan on 1/4/19.
//  Copyright © 2019 Karen Karapetyan. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let stats = StatsProvider.stats
    let records = RecordsProvider.records
    
    let cellID = "InfoCell"
    let statsHeaderID = "StatsHeaderView"
    let recordsHeaderID = "RecordsHeaderView"

    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    
    func initialUISetup() {
        collectionView.register(UINib(nibName: "InfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        
        collectionView.register(UINib(nibName: "StatsCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderID)
        collectionView.register(UINib(nibName: "RecordsCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: recordsHeaderID)
    }
}

extension StatsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return stats.count
        }
        else {
            return records.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCollectionViewCell
        
        if indexPath.section == 0 {
            cell.statsItem = stats[indexPath.row]
        }
        else {
            cell.statsItem = records[indexPath.row]
        }
        
        if indexPath.row == 2 || indexPath.row == 3 {
            cell.backgroundColor = UIColor.RGBA(200, 204, 204, 0.15)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderID, for: indexPath)
            return headerView
        }
        else {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: recordsHeaderID, for: indexPath)
            return headerView
        }
    }
}


extension StatsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: screenWidth, height: 32)
        }
        return CGSize(width: screenWidth, height: 94)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
