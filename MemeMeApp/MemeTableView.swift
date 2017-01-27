//
//  MemeTableView.swift
//  MemeMeApp
//
//  Created by 서석인 on 1/27/17.
//  Copyright © 2017 boost. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memes.append( Meme(name: "TestImg", topText: "Test", bottomText: "Image", originalImage: #imageLiteral(resourceName: "testimg"), memedImage: #imageLiteral(resourceName: "testimg")) )
         */
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let meme = appDelegate.memes[ (indexPath as NSIndexPath).row ]
        print( (indexPath as NSIndexPath).row )
        // Set the name and image
        cell.textLabel?.text = meme.name
        cell.imageView?.image = meme.memedImage
        
        // If the cell has a detail label, we will put the evil scheme in.
        /*if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
        }*/
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
        detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }*/
}


