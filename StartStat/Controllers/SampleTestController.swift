//
//  SampleTestController.swift
//  StartStat
//
//  Created by John Nik on 1/21/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import UIKit

class SampleTestController: UIViewController {
    
    let sampleSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "1. Enter Sample Size:"
        return label
    }()
    
    let sampleSizeTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let calculatorLabel: UILabel = {
        let label = UILabel()
        label.text = "2."
        return label
    }()
    
    lazy var calculatorButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: AssetName.calculator.rawValue)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(handleCalculate), for: .touchUpInside)
        return button
    }()
    
    let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = StyleGuideManager.seperatorLineColor
        return lineView
    }()
    
    let resultsToplessTextField: ToplessTextField = {
        let textField = ToplessTextField()
        let str = NSAttributedString(string: "Results:", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: 23)])
        textField.attributedPlaceholder = str
        textField.isUserInteractionEnabled = false
        textField.borderColor = .black
        
        return textField
    }()
    
    let result1TextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let result2TextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let result3TextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let result4TextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let result1Label: UILabel = {
        let label = UILabel()
        label.text = "at 99% confidence level"
        return label
    }()
    
    let result2Label: UILabel = {
        let label = UILabel()
        label.text = "at 95% confidence level"
        return label
    }()
    
    let result3Label: UILabel = {
        let label = UILabel()
        label.text = "at 90% confidence level"
        return label
    }()
    
    let result4Label: UILabel = {
        let label = UILabel()
        label.text = "at 80% confidence level"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
}

//MARK: handle calcu
extension SampleTestController {
    
    @objc fileprivate func handleCalculate() {
        
        view.endEditing(true)
        
        if !(checkInvalid()) {
            return
        }
        
        handleCalculateSampleTest()
    }
    
    private func handleCalculateSampleTest() {
        
        guard let sampleSize = Double(sampleSizeTextField.text!) else { return }
        
        let p: Double = 0.5
        let se = sqrt(p * (1 - p) / sampleSize)
        
        let sigresult80 = se * 1.282 * 100
        let sigresult90 = se * 1.645 * 100
        let sigresult95 = se * 1.96 * 100
        let sigresult99 = se * 2.576 * 100
        
        result1TextField.text = "+/- " + sigresult80.clean + " %"
        result2TextField.text = "+/- " + sigresult90.clean + " %"
        result3TextField.text = "+/- " + sigresult95.clean + " %"
        result4TextField.text = "+/- " + sigresult99.clean + " %"
    }
    
    private func checkInvalid() -> Bool {
        
        if (sampleSizeTextField.text?.isEmpty)! || !self.isValid(sampleSizeTextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        return true
    }
    
    fileprivate func isValid(_ number: String) -> Bool {
        
        guard let number = Double(number) else { return false }
        
        if number > 1 {
            return true
        } else {
            return false
        }
    }
    
}

//MARK: handle pop controller
extension SampleTestController {
    
    @objc fileprivate func handleDismissController() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func handleGoingHelpConroller() {
        
        let helpController = HelpController()
        let helpInfo = HelpInfo(title: "Sample Precision Calculator", help: SAMPLE_TEST_HELP)
        helpController.helpInfo = helpInfo
        navigationController?.pushViewController(helpController, animated: true)
    }
    
}

//MARK: setup views
extension SampleTestController {
    
    fileprivate func setupViews() {
        
        setupBackground()
        setupNavBar()
        setupCalculateView()
        setupResultsViews()
    }
    
    private func setupCalculateView() {
        
        view.addSubview(sampleSizeLabel)
        _ = sampleSizeLabel.anchor(topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: -15, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(sampleSizeTextField)
        _ = sampleSizeTextField.anchor(nil, left: sampleSizeLabel.rightAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 30)
        sampleSizeTextField.centerYAnchor.constraint(equalTo: sampleSizeLabel.centerYAnchor).isActive = true
        
        view.addSubview(calculatorLabel)
        _ = calculatorLabel.anchor(sampleSizeLabel.bottomAnchor, left: sampleSizeLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 40)
        
        view.addSubview(calculatorButton)
        _ = calculatorButton.anchor(nil, left: calculatorLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 110, heightConstant: 25)
        calculatorButton.centerYAnchor.constraint(equalTo: calculatorLabel.centerYAnchor).isActive = true
        
        view.addSubview(lineView)
        _ = lineView.anchor(calculatorButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 5)
        
    }
    
    private func setupResultsViews() {
        view.addSubview(resultsToplessTextField)
        _ = resultsToplessTextField.anchor(calculatorButton.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 40)
        
        view.addSubview(result1TextField)
        _ = result1TextField.anchor(resultsToplessTextField.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(result1Label)
        _ = result1Label.anchor(result1TextField.topAnchor, left: result1TextField.rightAnchor, bottom: result1TextField.bottomAnchor, right: lineView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(result2TextField)
        _ = result2TextField.anchor(result1TextField.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(result2Label)
        _ = result2Label.anchor(result2TextField.topAnchor, left: result2TextField.rightAnchor, bottom: result2TextField.bottomAnchor, right: lineView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(result3TextField)
        _ = result3TextField.anchor(result2TextField.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(result3Label)
        _ = result3Label.anchor(result3TextField.topAnchor, left: result3TextField.rightAnchor, bottom: result3TextField.bottomAnchor, right: lineView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(result4TextField)
        _ = result4TextField.anchor(result3TextField.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(result4Label)
        _ = result4Label.anchor(result4TextField.topAnchor, left: result4TextField.rightAnchor, bottom: result4TextField.bottomAnchor, right: lineView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    private func setupBackground() {
        
        view.backgroundColor = StyleGuideManager.mainYellowBackgroundColor
    }
    
    private func setupNavBar() {
        
        navigationItem.title = "Sample Precision Calculator"
        if #available(iOS 11.0, *) {
            //            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        let infoImage = UIImage(named: AssetName.helpIcon.rawValue)
        let moreButton = UIBarButtonItem(image: infoImage, style: .done, target: self, action: #selector(handleGoingHelpConroller))
        navigationItem.rightBarButtonItem = moreButton
        
        let backImage = UIImage(named: AssetName.backIcon.rawValue)
        let backButton = UIBarButtonItem(image: backImage, style: .done, target: self, action: #selector(handleDismissController))
        navigationItem.leftBarButtonItem = backButton
    }
}

