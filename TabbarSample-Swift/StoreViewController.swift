//
//  StoreViewController.swift
//  TabbarSample-Swift
//
//  Created by XJIMI on 2017/8/16.
//  Copyright © 2017年 Vidol. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    fileprivate	let numberOfCollectionItems: Int = 20
    fileprivate lazy var colorsArray: [UIColor] = []

    fileprivate lazy var collectionView: UICollectionView = {
        let flow: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 10

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flow)
        collectionView.backgroundColor = UIColor.darkGray
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //self.edgesForExtendedLayout = []
        //self.navigationController?.isNavigationBarHidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        for _ in 0..<numberOfCollectionItems {
            var randomRed: CGFloat = CGFloat(arc4random_uniform(256))
            let randomGreen: CGFloat = CGFloat(arc4random_uniform(256))
            let randomBlue: CGFloat = CGFloat(arc4random_uniform(256))

            if randomRed == 255.0 && randomGreen == 255.0 && randomBlue == 255.0 {
                randomRed = CGFloat(arc4random_uniform(128))
            }

            self.colorsArray.append(UIColor(red: randomRed/255.0, green: randomGreen/255.0, blue: randomBlue/255.0, alpha: 1.0))
        }

        let flow: UICollectionViewFlowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.itemSize = CGSize(width: 100, height: 100)
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;

        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.right.equalTo(self.view)
            make.height.equalTo(100)
        }

        //self.createBlurStatusBar()
    }

    fileprivate func createBlurStatusBar() {
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20)
        self.view.addSubview(blurView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCollectionItems
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath) as UICollectionViewCell

        //cell.backgroundColor = UIColor.lightGray
        cell.backgroundColor = self.colorsArray[indexPath.row]
        return cell
    }
}
