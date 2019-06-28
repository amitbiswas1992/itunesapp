//
//  ViewController.swift
//  itunesapp
//
//  Created by Maze Geek on 6/28/19.
//  Copyright © 2019 Amit Biswas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlbumViewController: UIViewController {

   
    
    @IBOutlet weak var AlbumTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     jsonData()
    
    }


}


extension AlbumViewController {
    
    func jsonData(){
        
        Alamofire.request("https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json").responseJSON { (response) in
            
            if let json = response.result.value {
                
                print("JSON : \(json)")
            }
        }
        
    }
    
    
    
    
}
