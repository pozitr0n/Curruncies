//
//  CoreDataServices+CoreDataClass.swift
//  Currency Converter
//
//  Created by Raman Kozar on 02/04/2023.
//
//

import UIKit
import CoreData

@objc(CoreDataServices)
public class CoreDataServices: NSManagedObject {

    var managedContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType) }
        return appDelegate.persistentContainer.viewContext
    }()
    
    func saveManagedContext() {
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
}
