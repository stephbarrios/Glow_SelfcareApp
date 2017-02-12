//
//  BeautyProductsCollectionViewController.swift
//  pink
//
//  Created by Gianne Flores on 2/12/17.
//  Copyright © 2017 Gianne Flores. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BeautyCell"

class BeautyProductsCollectionViewController: UICollectionViewController {
    
    var arrBeauty = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        arrBeauty.append("")
        
        arrBeauty[0] = "BW.png"
        arrBeauty[1] = "Cerave.png"
        arrBeauty[2] = "Cetaphil.png"
        arrBeauty[3] = "White.png"
        arrBeauty[4] = "Yellow.png"
        arrBeauty[5] = "Clinique.png"
        arrBeauty[6] = "Moisturizy.png"
        arrBeauty[7] = "LWO.png"
        arrBeauty[8] = "Cety.png"
        arrBeauty[9] = "neutro.png"
        arrBeauty[10] = "olay.png"
        arrBeauty[11] = "oreng.png"
        arrBeauty[12] = "elf.png"
        arrBeauty[13] = "rimm.png"
        arrBeauty[14] = "blck.png"
        arrBeauty[15] = "brwn.png"
        arrBeauty[16] = "clin.png"
        arrBeauty[17] = "rev.png"
        arrBeauty[18] = "elffy.png"
        arrBeauty[19] = "conc.png"
        arrBeauty[20] = "plnt.png"
        arrBeauty[21] = "zerosebum.png"
        arrBeauty[22] = "translu.png"
        arrBeauty[23] = "fit.png"
    
        
        self.collectionView!.register(BeautyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeautyCell", for: indexPath) as! BeautyCollectionViewCell
        var uimageview=UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        uimageview.image=UIImage(named: "Ovally")
        cell.beautyPics.contentMode = .scaleAspectFit
        var pic=UIImage(named: "brwn.png")
        cell.beautyPics.image=pic
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
