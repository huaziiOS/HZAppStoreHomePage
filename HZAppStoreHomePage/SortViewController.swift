//
//  SortViewController.swift
//  HZAppStoreHomePage
//
//  Created by 韩兆华 on 2017/9/6.
//  Copyright © 2017年 韩兆华. All rights reserved.
//

import UIKit

let BlueColor = UIColor(red: 0, green: 122.0 / 255, blue: 1, alpha: 1)

class SortViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置导航栏底部黑色线(0.5px)隐藏
        for subview in navigationController!.navigationBar.subviews[0].subviews {
            if subview.isKind(of: UIImageView.self) {
                subview.isHidden = true
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        builtUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for subview in navigationController!.navigationBar.subviews[0].subviews {
            if subview.isKind(of: UIImageView.self) {
                subview.isHidden = false
            }
        }

    }
    
    private func builtUI() {
        
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - Button Action 
extension SortViewController {
    
    @IBAction func selectedTypeAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SortViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SortTableCell", for: indexPath)
        return cell
    }
}
