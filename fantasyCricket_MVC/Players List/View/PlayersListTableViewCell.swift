//
//  PlayersListTableViewCell.swift
//  fantasyCricket_MVC
//
//  Created by Adaps on 13/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class PlayersListTableViewCell: TableViewCell {

    /// MARK : - XIB Outlets
    @IBOutlet weak var lblPlayerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func configure(_ item: Any?) {
        guard let player = item as? Player else { return  }
        self.lblPlayerName.text = player.name
    }
}
