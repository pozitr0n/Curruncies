//
//  CurrencyCell.swift
//  Currency Converter
//
//  Created by Raman Kozar on 02/04/2023.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var baseCurrency: UILabel!
    @IBOutlet weak var rateCurrencyValue: UILabel!
    @IBOutlet weak var rateCurrencyKey: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setValueIntoCell(_ currentInfo: CurrencyModel) {
        
        baseCurrency.text = "1 \(currentInfo.baseCurrency)"
        rateCurrencyValue.text = String(currentInfo.rateValue)
        rateCurrencyKey.text = currentInfo.rateKey
        
    }

}
