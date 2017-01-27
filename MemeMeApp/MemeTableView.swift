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
        /*
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memes.append( Meme(name: "TestImg", topText: "Test", bottomText: "Image", originalImage: #imageLiteral(resourceName: "testimg"), memedImage: #imageLiteral(resourceName: "testimg")) )
         */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = memes[ (indexPath as NSIndexPath).row ]
        print( (indexPath as NSIndexPath).row )
        // Set the name and image
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        cell.detailTextLabel?.text = meme.bottomText
        
        // If the cell has a detail label, we will put the evil scheme in.
        /*if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
        }*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}


