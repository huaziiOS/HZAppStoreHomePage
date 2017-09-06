//
//  ViewController.swift
//  HZAppStoreHomePage
//
//  Created by 韩兆华 on 2017/9/2.
//  Copyright © 2017年 韩兆华. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var headerCoverView: CarouselFigureView?
    
    fileprivate var headerViewHeight: CGFloat = 130

    override func viewDidLoad() {
        super.viewDidLoad()
        
        builtUI()
    }
    
    private func builtUI() {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headerViewHeight))
        headerView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = headerView
        
        headerCoverView = CarouselFigureView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headerViewHeight))
        headerCoverView?.delegate = self
        headerCoverView?.isShowPageControl = false
        headerCoverView?.localImageArray = ["1", "2", "3", "4", "5"]
        tableView.addSubview(headerCoverView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        if offSetY >= -64 {
            headerCoverView?.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headerViewHeight)
        } else {
            headerCoverView?.frame = CGRect(x: 0, y: 64 + offSetY, width: SCREEN_WIDTH, height: headerViewHeight)
        }
    }
}

// MARK: - CarouselFigureViewDelegate
extension ViewController: CarouselFigureViewDelegate {
    func imageSelectedAtIndex(index: Int) {
        print("点击了第\(index)张图片")
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section == 3 || indexPath.section == 6 || indexPath.section == 7 {
            cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCellTwo", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCellOne", for: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 || indexPath.section == 6 || indexPath.section == 7 {
            return 110
        }
        return 190
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

