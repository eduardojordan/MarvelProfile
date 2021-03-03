//
//  CellCellCharactersViewController.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 2/3/21.
//

import UIKit

class CellCellCharactersViewController: UITableViewCell {
 
    @IBOutlet weak var imgChracters: UIImageView!
    @IBOutlet weak var nameCharacters: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
