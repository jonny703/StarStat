//
//  Extension+Codable.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import Foundation

extension Encodable {
    
    func asDicctionary() throws -> [String: Any] {
        
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        
        return dictionary
        
    }
    
    var dictionary: [String: Any]? {
        
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any]}
        
    }
    
}
