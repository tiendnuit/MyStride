//
//  DataManager.swift
//  MyStride
//
//  Created by Scor Doan on 7/11/18.
//  Copyright © 2018 Scor Doan. All rights reserved.
//

import Foundation
class DataManager {
    
    static let shared = DataManager()
    var countries = [Country]()
    
    fileprivate func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    fileprivate var dummyDataFilePath: String {
        let url = URL(fileURLWithPath: self.getDocumentsDirectory())
        return url.appendingPathComponent("dummy_data").path
    }
    
    func loadCountriesData() {
        if let url = R.file.countryInfoJson() {
            if let data = try? Data(contentsOf: url) {
                let jsonDecoder = JSONDecoder()
                do {
                    self.countries = try jsonDecoder.decode([Country].self, from: data)
                } catch let err {
                    print("Err", err)
                    print("loading fresh dummy")
                }
            }
        }
    }
    
}
