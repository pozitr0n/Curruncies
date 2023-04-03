//
//  FirstCurrencyTableViewController.swift
//  Currency Converter
//
//  Created by Raman Kozar on 31/03/2023.
//

import UIKit

class FirstCurrencyTableViewController: UITableViewController {

    let arrayOfCurruncies = ServiceFunctionality().getArrayOfTheCurrencies()
    
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as? FirstTableCell else { return UITableViewCell() }
        
        cell.setValueIntoCell(currentCurruncy: arrayOfCurruncies[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let updateArrayOfCurruncies = arrayOfCurruncies.filter { $0 != arrayOfCurruncies[indexPath.row] }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let secondCurrencyTableViewController = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondCurrencyTableViewController
        
        secondCurrencyTableViewController.arrayOfCurruncies = updateArrayOfCurruncies
        secondCurrencyTableViewController.baseCurruncy = arrayOfCurruncies[indexPath.row].rawValue
        
        self.present(secondCurrencyTableViewController, animated: true, completion: nil)
        
    }

}
