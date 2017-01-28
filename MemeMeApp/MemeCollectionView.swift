//
//  File.swift
//  MemeMeApp
//
//  Created by 서석인 on 1/27/17.
//  Copyright © 2017 boost. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
}

class MemeCollectionViewController: UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [Meme]!
    
    func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        
        cell.cellImage?.image = meme.memedImage
        cell.cellLabel.text = meme.topText
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        //Populate view controller with data from the selected item
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        // Present the view controller using navigation
        navigationController!.pushViewController(detailController, animated: true)
        
    }
}
