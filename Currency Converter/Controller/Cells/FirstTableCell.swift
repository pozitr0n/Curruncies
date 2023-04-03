//
//  FirstTableCell.swift
//  Currency Converter
//
//  Created by Raman Kozar on 02/04/2023.
//

import UIKit

class FirstTableCell: UITableViewCell {

    @IBOutlet weak var firstCurrancyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setValueIntoCell(currentCurruncy: AlltheCurrencies) {
        firstCurrancyLabel.text = currentCurruncy.rawValue
    }

}
