//
//  Parser.swift
//  Pod Player
//
//  Created by Michaël on 24/05/2018.
//  Copyright © 2018 Michaël. All rights reserved.
//

import Foundation

class Parser {
    func getPodcatMetaData(data:Data) -> (title:String?, imageURL:String?) {
        let xml = SWXMLHash.parse(data)
        
        print(xml["rss"]["channel"]["itunes:image"].element?.attribute(by: "href")?.text)
        return (xml["rss"]["channel"]["title"].element?.text, xml["rss"]["channel"]["itunes:image"].element?.attribute(by: "href")?.text)
    }
}
