//
//  Extension+String.swift
//  StartStat
//
//  Created by John Nik on 1/20/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import Foundation
public extension String {
    
    var isEmptyStr: Bool{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces).isEmpty
    }
}


extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
