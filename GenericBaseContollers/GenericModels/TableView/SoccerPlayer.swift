//
//  SoccerPlayer.swift
//  GenericBaseContollers
//
//  Created by James Rochabrun on 7/8/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

struct SoccerPlayer: Searchable {
    
    var query: String {
        return name
    }
    
    let name: String
}



class SoccerCell: BaseTableViewCell<SoccerPlayer> {
    
    override var item: SoccerPlayer? {
        didSet {
            textLabel?.text = item?.name
        }
    }
}


