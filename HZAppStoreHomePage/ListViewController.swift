//
//  ListViewController.swift
//  HZAppStoreHomePage
//
//  Created by 韩兆华 on 2017/9/6.
//  Copyright © 2017年 韩兆华. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func complete(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }

}

// MARK: - Button Action
extension ListViewController {
    
}
