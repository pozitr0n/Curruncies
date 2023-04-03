//
//  ViewController.swift
//  Currency Converter
//
//  Created by Raman Kozar on 30/03/2023.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCurrancyPair(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstCurrencyTableViewController = storyBoard.instantiateViewController(withIdentifier: "FirstVC") as! FirstCurrencyTableViewController
        self.present(firstCurrencyTableViewController, animated: true, completion: nil)
        
    }
    
}

