//
//  FavoriteTableViewController.swift
//  MemeMeApp
//
//  Created by 서석인 on 1/28/17.
//  Copyright © 2017 boost. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    var memes: [Meme]!
    var favoriteMemes: [Meme]!
    
    func updateFavoriteList(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        favoriteMemes = []
        for m in memes {
            if m.isFavorite == true {
                favoriteMemes.append(m)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        updateFavoriteList()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        updateFavoriteList()
        return favoriteMemes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        updateFavoriteList()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell")!
        let meme = favoriteMemes[ (indexPath as NSIndexPath).row ]
        
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        cell.detailTextLabel?.text = meme.bottomText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        memes = favoriteMemes
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
