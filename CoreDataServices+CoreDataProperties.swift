//
//  CoreDataServices+CoreDataProperties.swift
//  Currency Converter
//
//  Created by Raman Kozar on 02/04/2023.
//
//

import CoreData
import UIKit

extension CoreDataServices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataServices> {
        return NSFetchRequest<CoreDataServices>(entityName: "Currencies")
    }

    @NSManaged public var baseCurrency: String?
    @NSManaged public var rateKey: String?
    @NSManaged public var rateValue: Double
    @NSManaged public var currencyDate: String?
    
    func checkInfoAtCoreData() -> Bool {
       
        if let finalResult = try? managedContext.fetch(CoreDataServices.fetchRequest()) {
            if finalResult.count > 0 {
                return true
            }
        }
        
        return false
        
    }
    
    func saveCurrancyInfoIntoCoreData(_ data: CurrencyModel) {
        
        let currency = CoreDataServices(context: managedContext)
        
        currency.baseCurrency = data.baseCurrency
        currency.currencyDate = data.currencyDate
        currency.rateKey = data.rateKey
        currency.rateValue = data.rateValue
        
        CoreDataServices().saveManagedContext()
        
      }
    
    func getCurrancyInfoFromCoreData() -> [CurrencyModel] {
        
        if let finalResult = try? managedContext.fetch(CoreDataServices.fetchRequest()) {
            
            var currunciesArray = [CurrencyModel]()
            for currentCurruncy in finalResult {
                
                let curruncyItem = CurrencyModel(baseCurrency: currentCurruncy.baseCurrency!,
                                                 rateKey: currentCurruncy.rateKey!,
                                                 rateValue: currentCurruncy.rateValue,
                                                 currencyDate: currentCurruncy.currencyDate!)
                
                currunciesArray.append(curruncyItem)
                
            }
            
            return currunciesArray
            
        }
        
        return [CurrencyModel]()
        
    }
    
}

extension CoreDataServices : Identifiable {

}
