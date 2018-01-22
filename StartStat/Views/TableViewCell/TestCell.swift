//
//  TestCell.swift
//  StartStat
//
//  Created by John Nik on 1/20/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import UIKit

class TestCell: BaseTableViewCell {
    
    var testContents: TestContent? {
        
        didSet {
            guard let testContents = self.testContents else { return }
            
            starImageView.image = UIImage(named: testContents.imageName)
            
            testTextView.text = testContents.test
        }
    }
    
    let starImageView: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
    }()
    
    let testTextView: UITextView = {
        
        let textView = UITextView()
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = .clear
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.clear
        
        setupStarImageView()
        setupTestTextView()
    }
    
    private func setupStarImageView() {
        addSubview(starImageView)
        
        _ = starImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 40)
        starImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupTestTextView() {
        
        addSubview(testTextView)
        _ = testTextView.anchor(nil, left: starImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 90)
        testTextView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
