//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Florent on 15/10/2020.
//

import Foundation


extension Bundle {
    
    
    func decode<T: Codable>(_ file: String) -> T {
       
        // 1. Locate the JSon file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url ) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        //5. Return the ready-to-use data
        return loaded
    }
}
