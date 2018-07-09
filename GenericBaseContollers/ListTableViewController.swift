//
//  ListTableViewController.swift
//  GenericBaseContollers
//
//  Created by James Rochabrun on 7/8/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewController: BaseTableViewSearchController<SoccerCell, SoccerPlayer> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soccerPlayers = [SoccerPlayer(name: "Messi"), SoccerPlayer(name: "Ronaldo"), SoccerPlayer(name: "Modric"), SoccerPlayer(name: "Guerrero"), SoccerPlayer(name: "Rodriguez"), SoccerPlayer(name: "Kane"), SoccerPlayer(name: "Ramos"), SoccerPlayer(name: "Pique"), SoccerPlayer(name: "Mbape"), SoccerPlayer(name: "Pogba"), SoccerPlayer(name: "Zidane"), SoccerPlayer(name: "Kross"), SoccerPlayer(name: "Puyol"), SoccerPlayer(name: "Beckham")]
        
        self.models = soccerPlayers
    }
}













