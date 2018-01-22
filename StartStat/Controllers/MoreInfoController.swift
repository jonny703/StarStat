//
//  MoreInfoController.swift
//  StartStat
//
//  Created by John Nik on 1/20/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import UIKit

class MoreInfoController: UIViewController {
    
    let infoText: MoreInfo = {
        return MoreInfo(noticeTitle: "NOTICE", notice: NOTICE, disclaimerTitle: "DISCLAIMER", disclaimer: DISCLAIMER)
    }()
    
    lazy var infoTextView: UITextView = {
        
        let textView = UITextView()
//        textView.isUserInteractionEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        
        let color = UIColor.black
        let attributedText = NSMutableAttributedString(string: infoText.noticeTitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 23, weight: .medium), NSAttributedStringKey.foregroundColor: color])
        attributedText.append(NSAttributedString(string: "\n\(infoText.notice)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: color]))
        attributedText.append(NSAttributedString(string: "\n\n\(infoText.disclaimerTitle)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 23), NSAttributedStringKey.foregroundColor: color]))
        attributedText.append(NSAttributedString(string: "\n\(infoText.disclaimer)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: color]))
        let paragraphStrye = NSMutableParagraphStyle()
        paragraphStrye.alignment = .left
        
        let length = attributedText.string.count
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStrye, range: NSRange(location: 0, length: length))
        
        textView.attributedText = attributedText
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}

//MARK: handle pop controller
extension MoreInfoController {
    
    @objc fileprivate func handleDismissController() {
        
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK: setup views
extension MoreInfoController {
    
    fileprivate func setupViews() {
        
        setupBackground()
        setupNavBar()
        setupTextView()
    }
    
    private func setupTextView() {
        
        view.addSubview(infoTextView)
        
        _ = infoTextView.anchor(self.topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    private func setupBackground() {
        
        view.backgroundColor = StyleGuideManager.mainYellowBackgroundColor
    }
    
    private func setupNavBar() {
        
        navigationItem.title = "StarStat"
        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        let backImage = UIImage(named: AssetName.backIcon.rawValue)
        let backButton = UIBarButtonItem(image: backImage, style: .done, target: self, action: #selector(handleDismissController))
        navigationItem.leftBarButtonItem = backButton
    }
}

