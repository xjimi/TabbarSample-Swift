//
//  AppleMusicViewController.swift
//  TabbarSample-Swift
//
//  Created by XJIMI on 2017/8/17.
//  Copyright © 2017年 Vidol. All rights reserved.
//

import UIKit

class AppleMusicViewController: UIViewController {

    fileprivate lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)

        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        //self.view.addSubview(self.tableView)

    }



}
