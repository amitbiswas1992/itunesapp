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

   
   var album : [Album] = [Album]()
 

    @IBOutlet weak var AlbumTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    AlbumTableView.delegate = self
    AlbumTableView.dataSource = self
        // Do any additional setup after loading the view.
     jsonData()
    
    }


}


extension AlbumViewController : UITableViewDelegate, UITableViewDataSource{
    
    func jsonData(){
        
        Alamofire.request("https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json").responseJSON { (response) in
            
            guard let data = response.data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let decodeAlbum = try jsonDecoder.decode(JSONResponse.self, from: data)
                print("data \(decodeAlbum.feed?.author )") as? String
                self.album = (decodeAlbum.feed?.results)!
                
                DispatchQueue.main.async(execute: {
                self.AlbumTableView.reloadData()
                })
                
                
                
            }catch{
                print("Error \(error)")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! AlbumTableViewCell
     let albumview = album[indexPath.row]
     cell.albumTitle.text = albumview.name
     cell.albumAuthor.text = albumview.artistName
     cell.albumImage.downloaded(from: albumview.artworkUrl100 as? String ?? "")
     
        
        return cell
    
    }
    
}
//ui image view extension
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) { // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) { // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


