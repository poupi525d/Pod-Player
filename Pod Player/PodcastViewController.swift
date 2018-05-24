//
//  PodcastViewController.swift
//  Pod Player
//
//  Created by Michaël on 24/05/2018.
//  Copyright © 2018 Michaël. All rights reserved.
//

import Cocoa

class PodcastViewController: NSViewController {

    @IBOutlet weak var podcastURLTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        podcastURLTextField.stringValue = "http://www.espn.com/espnradio/feeds/rss/podcast.xml?id=2406595"
    }
    
    @IBAction func AjouterPodcastClicked(_ sender: Any) {
        
        URLSession.shared.dataTask(with: URL(string: podcastURLTextField.stringValue)!) { (data:Data?, reponse:URLResponse?, error:Error?) in
            if error != nil {
                print(error!)
            }else{
                if data != nil {
                    
                let parser = Parser()
                let info = parser.getPodcatMetaData(data: data!)
                    print(info)
                }
            }
        }.resume()
        podcastURLTextField.stringValue = ""
    }
}
