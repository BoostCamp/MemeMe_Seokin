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
    }
    
}
