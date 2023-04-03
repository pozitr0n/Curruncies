//
//  SecondCurrencyTableViewController.swift
//  Currency Converter
//
//  Created by Raman Kozar on 31/03/2023.
//

import UIKit

class SecondCurrencyTableViewController: UITableViewController {

    var arrayOfCurruncies: [AlltheCurrencies] = []
    var baseCurruncy: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCurruncies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as? SecondTableCell else { return UITableViewCell() }
        
        cell.setValueIntoCell(currentCurruncy: arrayOfCurruncies[indexPath.row])
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rateKey = arrayOfCurruncies[indexPath.row].rawValue
        
        if !rateKey.isEmpty && !baseCurruncy.isEmpty {
            
            ExchangeRatesDataAPI().getRequestFromAPI(baseCurruncy, rateKey) { currModel in
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let notEmptyVC = storyBoard.instantiateViewController(withIdentifier: "NotEmptyVC") as! NotEmptyViewController
                
                self.view.window?.rootViewController = notEmptyVC
                self.view.window?.makeKeyAndVisible()
                
            }
        
        }

    }

}
