//
//  MemeTableView.swift
//  MemeMeApp
//
//  Created by 서석인 on 1/27/17.
//  Copyright © 2017 boost. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        return memes.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = memes[ (indexPath as NSIndexPath).row ]
    
        // Set the name and image
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        cell.detailTextLabel?.text = meme.bottomText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}


