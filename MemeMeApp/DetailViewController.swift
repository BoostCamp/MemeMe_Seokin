//
//  DetailViewController.swift
//  MemeMeApp
//
//  Created by 서석인 on 1/28/17.
//  Copyright © 2017 boost. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImage.image = meme.memedImage
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(favoriteClicked))
        
    }
    
    func updateMeme(mid: Int) {
        let mcount = (UIApplication.shared.delegate as! AppDelegate).memeCount!
        
        for i in 0...mcount {
            if (UIApplication.shared.delegate as! AppDelegate).memes[i].id == mid {
                let rev = !(UIApplication.shared.delegate as! AppDelegate).memes[i].isFavorite
               (UIApplication.shared.delegate as! AppDelegate).memes[i].isFavorite = rev
                meme = (UIApplication.shared.delegate as! AppDelegate).memes[i]
            }
        }
    }
    
    func favoriteClicked() {
        let favoriteController = self.storyboard!.instantiateViewController(withIdentifier: "FavoriteTableViewController") as! FavoriteTableViewController
        
        if meme.isFavorite == false {
            let alert = UIAlertController(title: "북마크 추가", message: "북마크에 추가되었습니다", preferredStyle: UIAlertControllerStyle.alert)
        
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        
            self.present(alert, animated: true, completion: nil)
            updateMeme(mid: meme.id)
            favoriteController.updateFavoriteList()
            
            
        }
        else {
            let alert = UIAlertController(title: "북마크 삭제", message: "북마크에서 삭제되었습니다", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            updateMeme(mid: meme.id)
            favoriteController.updateFavoriteList()
        
            
        }
        
    }
    
    
}
