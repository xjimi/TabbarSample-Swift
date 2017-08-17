//
//  ViewController.swift
//  TabbarSample-Swift
//
//  Created by XJIMI on 2017/8/14.
//  Copyright © 2017年 Vidol. All rights reserved.
//

import UIKit
import SnapKit
import TYCyclePagerView

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.self())
        collectionView.alwaysBounceVertical = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        return collectionView
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.collectionView.backgroundColor = UIColor.white
        /*
         let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
         flow.sectionHeadersPinToVisibleBounds = true
        */

        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }

        self.createBlurStatusBar()
    }

    fileprivate func createBlurStatusBar() {
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20)
        self.view.addSubview(blurView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! CollectionViewCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }


    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        var tipview = UICollectionReusableView()
        let label = UILabel()
        label.frame.size = CGSize(width: self.view.frame.size.width, height: 50)
        label.backgroundColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 26)

        if kind == UICollectionElementKindSectionHeader {
            tipview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                      withReuseIdentifier: "header",
                                                                      for: indexPath)
            label.text = "   戲劇\(indexPath.section + 1)"
        }
        else if kind == UICollectionElementKindSectionFooter {
            tipview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter,
                                                                      withReuseIdentifier: "footer",
                                                                      for: indexPath)
            label.text = "   結尾"
        }
        tipview.addSubview(label)
        return tipview
    }

    override var supportedInterfaceOrientations:UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

}

