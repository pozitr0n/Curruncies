//
//  ExchangeRatesDataAPI.swift
//  Currency Converter
//
//  Created by Raman Kozar on 31/03/2023.
//

import Foundation
import Alamofire

class ExchangeRatesDataAPI {
    
    let keyAPI: String = "iqXG4pKkez10Y6YHB0nd6g5BgWfazQjU"
    
    private func getStringURL(_ baseCurrancy: String, _ rateKey: String) -> String {
        return "https://api.apilayer.com/exchangerates_data/latest?symbols=\(rateKey)&base=\(baseCurrancy)"
    }
    
    public func getRequestFromAPI(_ baseCurrancy: String, _ rateKey: String, _ completion: @escaping (CurrencyModel) -> ()) {
    
        let currURL = getStringURL(baseCurrancy, rateKey)
        
        let httpHeader = HTTPHeader(name: "apikey", value: keyAPI)
        let httpHeaders = HTTPHeaders(arrayLiteral: httpHeader)
        
        AF.request(currURL, method: .get, headers: httpHeaders).responseJSON { data in
                    
            if let json = try? data.result.get() {
                
                if let dict = json as? [String: Any] {
                    
                    if let rates = dict["rates"] as? [String: Any] {
                    
                        let _rateValueTemp = rates["\(rateKey)"] as! Double
                        
                        let stringFromNumber = String(String(_rateValueTemp).dropLast())
                        let _rateValue = Double(Int(100 * Double(stringFromNumber)!)) / 100
                        
                        let _rateKey = "\(rateKey)"
                        let _currencyDate = dict["date"] as! String
                        let _baseCurrency = dict["base"] as! String
                        
                        let currentInformation = CurrencyModel(baseCurrency: _baseCurrency,
                                                               rateKey: _rateKey,
                                                               rateValue: _rateValue,
                                                               currencyDate: _currencyDate)
                        
                        CoreDataServices().saveCurrancyInfoIntoCoreData(currentInformation)
                        completion(currentInformation)
                        
                    }
                    
                }
            }
            
        }
    
    }
    
}
