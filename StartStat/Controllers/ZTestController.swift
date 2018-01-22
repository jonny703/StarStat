//
//  ZTestController.swift
//  StartStat
//
//  Created by PAC on 1/20/18.
//  Copyright © 2018 PAC. All rights reserved.
//

import UIKit

class ZTestController: UIViewController {

    let selectLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "1. Select Confidence Level:"
        return label
    }()
    
    var levelsCheckStatus: [Bool] = [false, false, false, false]
    
    lazy var levelView99: LevelView = {
        
        let view = LevelView()
        view.level = "99%"
        view.circleBoxTag = 0
        view.levelViewDelegate = self
        return view
    }()
    
    lazy var levelView95: LevelView = {
        
        let view = LevelView()
        view.level = "95%"
        view.circleBoxTag = 1
        view.levelViewDelegate = self
        return view
    }()
    
    lazy var levelView90: LevelView = {
        
        let view = LevelView()
        view.level = "90%"
        view.circleBoxTag = 2
        view.levelViewDelegate = self
        return view
    }()
    
    lazy var levelView80: LevelView = {
        
        let view = LevelView()
        view.level = "80%"
        view.circleBoxTag = 3
        view.levelViewDelegate = self
        return view
    }()
    
    let sample1ToplessTextField: ToplessTextField = {
        let textField = ToplessTextField()
        let str = NSAttributedString(string: "Sample 1:", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        textField.attributedPlaceholder = str
        textField.isUserInteractionEnabled = false
        textField.borderColor = .black
        
        return textField
    }()
    
    let sample2ToplessTextField: ToplessTextField = {
        let textField = ToplessTextField()
        let str = NSAttributedString(string: "Sample 2:", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        textField.attributedPlaceholder = str
        textField.isUserInteractionEnabled = false
        textField.borderColor = .black
        
        return textField
    }()
    
    let baseSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "2. Enter Base Sizes:"
        return label
    }()
    
    let proportionsLabel: UILabel = {
        let label = UILabel()
        label.text = "3. Enter Proportions:"
        return label
    }()
    
    let proportionHelpLabel: UILabel = {
        let label = UILabel()
        label.text = "(Please enter in decimal format, for example, 92.9% should be enterned\nas .929)"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 3
        return label
    }()
    
    let baseSize1TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let baseSize2TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let proportion1TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let proportion2TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let calculatorLabel: UILabel = {
        let label = UILabel()
        label.text = "4."
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
    
    let significantTextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let probability1Label: UILabel = {
        let label = UILabel()
        label.text = "1-tail probablility:"
        return label
    }()
    
    let probability2Label: UILabel = {
        let label = UILabel()
        label.text = "2-tail probablility:"
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Z-score:"
        return label
    }()
    
    let probability1TextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let probability2TextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let scoreTextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
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
extension ZTestController {
    
    @objc fileprivate func handleCalculate() {
        
        view.endEditing(true)
        
        if !(checkInvalid()) {
            return
        }
        
        guard let level = self.getLevelValue() else {
            self.showJHTAlerttOkayWithIcon(message: "Please choose a level")
            return
        }
        
        handleCalculateZTest(withLevel: level)
    }
    
    private func getLevelValue() -> Int? {
        
        for i in 0..<levelsCheckStatus.count {
            
            if levelsCheckStatus[i] {
                if i == 0 {
                    return 99
                } else if i == 1 {
                    return 95
                } else if i == 2 {
                    return 90
                } else {
                    return 80
                }
            }
        }
        
        return nil
    }
    
    private func handleCalculateZTest(withLevel level: Int) {
        
        guard let n1 = Double(baseSize1TextField.text!) else { return }
        guard let n2 = Double(baseSize2TextField.text!) else { return }
        guard let p1 = Double(proportion1TextField.text!) else { return }
        guard let p2 = Double(proportion2TextField.text!) else { return }
        
        let se = sqrt((p1 * (1 - p1) / (n1 - 1)) + (p2 * (1 - p2) / (n2 - 1)))
        var z = (p1 - p2) / se
        let zscore = fabs(z)
        
        let c = 0.2316419;                        // constants for normal curve approx
        let b1 = 0.319381530;
        let b2 = -0.356563782;
        let b3 = 1.781477937;
        let b4 = -1.821255978;
        let b5 = 1.330274429;
        
        if z < 0 {
            z = z * -1
        }
        
        let temp1 = -(z * z) / 2
        let temp2 = exp(temp1)
        let t = temp2 / sqrt(2 * Double.pi)
        let x = 1 / (1 + (c * z))
        let p = (b1 * x) + (b2 * x * x) + b3 * x * x * x + b4 * x * x * x * x + b5 * x * x * x * x * x
        
        let zprob1 = t * p
        let zprob2 = zprob1 * 2
        
        var significantMessage = ""
        if level == 99 {
            if zprob2 < 0.01 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 13)
            }
        }
        
        if level == 95 {
            if zprob2 < 0.05 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 13)
            }
        }
        
        if level == 90 {
            if zprob2 < 0.1 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 13)
            }
        }
        
        if level == 80 {
            if zprob2 < 0.2 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 13)
            }
        }
        
        self.significantTextField.text = significantMessage
        self.probability1TextField.text = zprob1.cleanFour
        self.probability2TextField.text = zprob2.cleanFour
        self.scoreTextField.text = zscore.cleanFour
    }
        
    private func getSignificantMessage(withLevel level: String) -> String {
        return "SIGNIFICANT at \(level)% confidence (2-tailed)"
    }
    
    private func getUnsignificantMessage(withLevel level: String) -> String {
        return "NOT SIGNIFICANT at \(level)% confidence (2-tailed)"
    }
    
    private func checkInvalid() -> Bool {
        
        if (baseSize1TextField.text?.isEmpty)! || !self.isValid(baseSize1TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        if (baseSize2TextField.text?.isEmpty)! || !self.isValid(baseSize2TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        if (proportion1TextField.text?.isEmpty)! || !self.isValidProportion(proportion1TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        if (proportion2TextField.text?.isEmpty)! || !self.isValidProportion(proportion2TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        return true
    }
    
    fileprivate func isValid(_ number: String) -> Bool {
        
        guard let number = Int(number) else { return false }
        
        if number >= 1 {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func isValidProportion(_ number: String) -> Bool {
        
        guard let number = Double(number) else { return false }
        
        if number > 1 {
            return false
        } else {
            return true
        }
    }
    
}

//MARK: handle pop controller
extension ZTestController {
    
    @objc fileprivate func handleDismissController() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func handleGoingHelpConroller() {
        
        let helpController = HelpController()
        let helpInfo = HelpInfo(title: "Z-Test Calculator", help: Z_TEST_HELP)
        helpController.helpInfo = helpInfo
        navigationController?.pushViewController(helpController, animated: true)
    }
    
}

extension ZTestController: LevelViewDelegate {
    func circleBoxValueChanged(sender: Checkbox, tag: Int) {
        
        view.endEditing(true)
        
        print("circle box value change: \(sender.isChecked)--\(tag)")
        
        let checked = sender.isChecked
        
        self.levelsCheckStatus = [false, false, false, false]
        self.levelsCheckStatus[tag] = checked
        
        for i in 0..<levelsCheckStatus.count {
            if i == 0 {
                self.levelView99.circleBox.isChecked = self.levelsCheckStatus[i]
            } else if i == 1 {
                self.levelView95.circleBox.isChecked = self.levelsCheckStatus[i]
            } else if i == 2 {
                self.levelView90.circleBox.isChecked = self.levelsCheckStatus[i]
            } else if i == 3 {
                self.levelView80.circleBox.isChecked = self.levelsCheckStatus[i]
            }
        }
        
    }
}

//MARK: setup views
extension ZTestController {
    
    fileprivate func setupViews() {
        
        setupBackground()
        setupNavBar()
        setupCalculateView()
        setupResultsViews()
    }
    
    private func setupCalculateView() {
        setupLevel()
        setupLevelViews()
        setupSampleTextFields()
        setupBaseSizes()
        setupProportions()
        setupCalculator()
    }
    
    private func setupResultsViews() {
        setupResultTextFields()
        setupScoreViews()
    }
    
    private func setupScoreViews() {
        
        view.addSubview(probability1Label)
        _ = probability1Label.anchor(significantTextField.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(probability2Label)
        _ = probability2Label.anchor(probability1Label.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(scoreLabel)
        _ = scoreLabel.anchor(probability2Label.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(probability1TextField)
        _ = probability1TextField.anchor(nil, left: view.centerXAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        probability1TextField.centerYAnchor.constraint(equalTo: probability1Label.centerYAnchor).isActive = true

        view.addSubview(probability2TextField)
        _ = probability2TextField.anchor(nil, left: view.centerXAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        probability2TextField.centerYAnchor.constraint(equalTo: probability2Label.centerYAnchor).isActive = true

        view.addSubview(scoreTextField)
        _ = scoreTextField.anchor(nil, left: view.centerXAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        scoreTextField.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor).isActive = true
        
    }
    
    private func setupResultTextFields() {
        view.addSubview(resultsToplessTextField)
        _ = resultsToplessTextField.anchor(calculatorButton.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 40)
        
        view.addSubview(significantTextField)
        _ = significantTextField.anchor(resultsToplessTextField.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
    }
    
    private func setupCalculator() {
        
        view.addSubview(calculatorLabel)
        _ = calculatorLabel.anchor(proportionHelpLabel.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 35)
        
        view.addSubview(calculatorButton)
        _ = calculatorButton.anchor(nil, left: proportionHelpLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 110, heightConstant: 25)
        calculatorButton.centerYAnchor.constraint(equalTo: calculatorLabel.centerYAnchor).isActive = true
        
        view.addSubview(lineView)
        _ = lineView.anchor(calculatorButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 5)
    }
    
    private func setupBaseSizes() {
        
        view.addSubview(baseSizeLabel)
        _ = baseSizeLabel.anchor(sample1ToplessTextField.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(baseSize1TextField)
        _ = baseSize1TextField.anchor(baseSizeLabel.topAnchor, left: sample1ToplessTextField.leftAnchor, bottom: baseSizeLabel.bottomAnchor, right: sample1ToplessTextField.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(baseSize2TextField)
        _ = baseSize2TextField.anchor(baseSizeLabel.topAnchor, left: sample2ToplessTextField.leftAnchor, bottom: baseSizeLabel.bottomAnchor, right: sample2ToplessTextField.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
    }
    
    private func setupProportions() {
        
        view.addSubview(proportionsLabel)
        _ = proportionsLabel.anchor(baseSizeLabel.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(proportion1TextField)
        _ = proportion1TextField.anchor(proportionsLabel.topAnchor, left: sample1ToplessTextField.leftAnchor, bottom: proportionsLabel.bottomAnchor, right: sample1ToplessTextField.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(proportion2TextField)
        _ = proportion2TextField.anchor(proportionsLabel.topAnchor, left: sample2ToplessTextField.leftAnchor, bottom: proportionsLabel.bottomAnchor, right: sample2ToplessTextField.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(proportionHelpLabel)
        _ = proportionHelpLabel.anchor(proportionsLabel.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: sample2ToplessTextField.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 65)
    }
    
    private func setupSampleTextFields() {
        
        view.addSubview(sample1ToplessTextField)
        _ = sample1ToplessTextField.anchor(levelView99.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)
        
        view.addSubview(sample2ToplessTextField)
        _ = sample2ToplessTextField.anchor(levelView99.bottomAnchor, left: sample1ToplessTextField.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)
    }
    
    private func setupLevel() {
        view.addSubview(selectLevelLabel)
        
        _ = selectLevelLabel.anchor(topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
    }
    
    private func setupLevelViews() {
        
        view.addSubview(levelView99)
        _ = levelView99.anchor(selectLevelLabel.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 35)
        
        view.addSubview(levelView95)
        _ = levelView95.anchor(selectLevelLabel.bottomAnchor, left: levelView99.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 35)
        
        view.addSubview(levelView90)
        _ = levelView90.anchor(selectLevelLabel.bottomAnchor, left: levelView95.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 35)
        
        view.addSubview(levelView80)
        _ = levelView80.anchor(selectLevelLabel.bottomAnchor, left: levelView90.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 35)
        
    }
    
    private func setupBackground() {
        
        view.backgroundColor = StyleGuideManager.mainYellowBackgroundColor
    }
    
    private func setupNavBar() {
        
        navigationItem.title = "Z-Test Calculator"
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

