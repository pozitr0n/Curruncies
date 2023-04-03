//
//  MainStruct.swift
//  Currency Converter
//
//  Created by Raman Kozar on 31/03/2023.
//

import Foundation

enum AlltheCurrencies: String, CaseIterable {
    case PLN = "PLN"
    case BYN = "BYN"
    case RUB = "RUB"
    case UAH = "UAH"
    case KZT = "KZT"
    case CAD = "CAD"
    case HKD = "HKD"
    case ISK = "ISK"
    case PHP = "PHP"
    case DKK = "DKK"
    case HUF = "HUF"
    case CZK = "CZK"
    case EUR = "EUR"
    case USD = "USD"
    case NOK = "NOK"
    case SEK = "SEK"
    case CHF = "CHF"
    case GBP = "GBP"
    
    init?(id : Int) {
        switch id {
        case 1: self = .PLN
        case 2: self = .BYN
        case 3: self = .RUB
        case 4: self = .UAH
        case 5: self = .KZT
        case 6: self = .CAD
        case 7: self = .HKD
        case 8: self = .ISK
        case 9: self = .PHP
        case 10: self = .DKK
        case 11: self = .HUF
        case 12: self = .CZK
        case 13: self = .EUR
        case 14: self = .USD
        case 15: self = .NOK
        case 16: self = .SEK
        case 17: self = .CHF
        case 18: self = .GBP
        default: return nil
        }
    }
    
}

struct CurrencyModel {
    let baseCurrency: String
    let rateKey: String
    let rateValue: Double
    let currencyDate: String
}

class ServiceFunctionality {
    
    public func getArrayOfTheCurrencies() -> [AlltheCurrencies] {
        
        var arrayOfCurruncies = [AlltheCurrencies]()
        
        for value in AlltheCurrencies.allCases {
            arrayOfCurruncies.append(value)
        }
        
        return arrayOfCurruncies
        
    }
    
}


