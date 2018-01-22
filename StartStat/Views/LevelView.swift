//
//  LevelView.swift
//  StartStat
//
//  Created by John Nik on 1/21/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import UIKit

protocol LevelViewDelegate {
    func circleBoxValueChanged(sender: Checkbox, tag: Int)
}

class LevelView: UIView {
    
    var level: String? {
        didSet {
            guard let level = self.level else { return }
            self.levelLabel.text = level
        }
    }
    
    var circleBoxTag: Int? {
        didSet {
            guard let circleBoxTag = self.circleBoxTag else { return }
            circleBox.tag = circleBoxTag
        }
    }
    
    var levelViewDelegate: LevelViewDelegate?
    
    lazy var circleBox: Checkbox = {
        
        let circleBox = Checkbox()
        circleBox.borderStyle = .circle
        circleBox.checkmarkStyle = .circle
        circleBox.borderWidth = 5
        circleBox.uncheckedBorderColor = .darkGray
        circleBox.checkedBorderColor = StyleGuideManager.circleBoxBorderColor
        circleBox.checkmarkSize = 0.3
        circleBox.checkmarkColor = StyleGuideManager.circleBoxCheckMarkColor
        circleBox.delegate = self
        return circleBox
    }()
    
    lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCircleBox()
        setupLabel()
    }
    
    private func setupCircleBox() {
        
        addSubview(circleBox)
        
        _ = circleBox.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
        circleBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupLabel() {
        
        addSubview(levelLabel)
        _ = levelLabel.anchor(nil, left: circleBox.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        levelLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LevelView: CheckBoxDelegate {
    func checkBoxValueChanged(sender: Checkbox) {
        levelViewDelegate?.circleBoxValueChanged(sender: sender, tag: sender.tag)
    }
    
    
}
