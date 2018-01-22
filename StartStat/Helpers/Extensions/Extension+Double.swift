//
//  Extension+Double.swift
//  StartStat
//
//  Created by PAC on 1/21/18.
//  Copyright © 2018 PAC. All rights reserved.
//

import Foundation

extension Double {
    //    var clean: String { return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.2f", self) : String(self) }
    
    var clean: String {
        return  String(format: "%.2f", self)
    }
    
    var cleanFour: String {
        return  String(format: "%.4f", self)
    }
    
    var cleanKm: String {
        return  String(format: "%d", self)
    }
    
}
