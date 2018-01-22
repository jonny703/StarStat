//
//  StyleGuideManager.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

public class StyleGuideManager {
    private init(){}
    
    static let sharedInstance : StyleGuideManager = {
        let instance = StyleGuideManager()
        return instance
    }()
    
    //intro
    static let mainYellowBackgroundColor = UIColor(r: 238, g: 238, b: 221)
    
    static let circleBoxBorderColor = UIColor(r: 127, g: 157, b: 185)
    static let circleBoxCheckMarkColor = UIColor(r: 56, g: 185, b: 53)
    static let seperatorLineColor = UIColor(r: 172, g: 168, b: 153)
    
    //Fonts
    func loginFontLarge() -> UIFont {
        return UIFont(name: "Helvetica Light", size: 30)!
        
    }
}

