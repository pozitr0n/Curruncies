//
//  NotEmptyViewController.swift
//  Currency Converter
//
//  Created by Raman Kozar on 31/03/2023.
//

import UIKit

class NotEmptyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayOfCurruncies: [CurrencyModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        arrayOfCurruncies = CoreDataServices().getCurrancyInfoFromCoreData()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addCurrancyPair(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstCurrencyTableViewController = storyBoard.instantiateViewController(withIdentifier: "FirstVC") as! FirstCurrencyTableViewController
        self.present(firstCurrencyTableViewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCurruncies.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotEmptyCell", for: indexPath) as? CurrencyCell else { return UITableViewCell() }
        
        cell.setValueIntoCell(arrayOfCurruncies[indexPath.row])
        
        return cell
    }
    
}
