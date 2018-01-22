//
//  TTestController.swift
//  StartStat
//
//  Created by PAC on 1/21/18.
//  Copyright © 2018 PAC. All rights reserved.
//

import UIKit

class TTestController: UIViewController {
    
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
    
    let meansLabel: UILabel = {
        let label = UILabel()
        label.text = "3. Enter Means:"
        return label
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "3. Enter Standard Errors:"
        label.font = UIFont.systemFont(ofSize: 15)
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
    
    let means1TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let means2TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let error1TextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = StyleGuideManager.circleBoxBorderColor.cgColor
        return textField
    }()
    
    let error2TextField: UITextField = {
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
    
    let freedomLabel: UILabel = {
        let label = UILabel()
        label.text = "Degrees of Freedom:"
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "T-score:"
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
    
    let freedomTextField: UITextField = {
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
extension TTestController {
    
    @objc fileprivate func handleCalculate() {
        
        view.endEditing(true)
        
        if !(checkInvalid()) {
            return
        }
        
        guard let level = self.getLevelValue() else {
            self.showJHTAlerttOkayWithIcon(message: "Please choose a level")
            return
        }
        
        handleCalculateTTest(withLevel: level)
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
    
    /*
 int CalcT(int n1,int n2,double m1,double m2,double se1,double se2, int siglevel)
 {
 double tscore=0;
 double t=0;
 double temp1=0;
 double temp2=0;
 double T=0;
 double x=0;
 double P=0;
 double s=0;
 double R=0;
 double tprob1=0;
 double tprob2=0;
 double ttemp1=0;
 double ttemp2=0;
 double tprob1temp1=0;
 double tprob2temp1=0;
 double tprob1temp2=0;
 double tprob2temp2=0;
 double probnorm=0;
 int df;
 char tprob1Text[10];
 char tprob2Text[10];
 char dfText[10];
 char tText[10];
 
 // T-SCORE CALCULATION - RETURNS T VALUE FOR SIG LOOKUP
 t= (m1-m2) / sqrt((se1*se1)+(se2*se2));
 tscore = (fabs(t));
 
 // T PROBABILITIES
 
 double a=0.40061;                        // constants for t-dist approx
 double b=0.27304;
 double c=10.29722;
 double d=-68.70087;
 
 double c1=0.2316419;                    // constants for normal curve approx
 double b1=0.319381530;
 double b2=-0.356563782;
 double b3=1.781477937;
 double b4=-1.821255978;
 double b5=1.330274429;
 
 df=(abs(n1)+abs(n2))-2;                    // calculate degrees of freedom
 
 if (t>0) {t=t*-1;}                            // make sure t is negative
 s= a+(b*t)+((c*t)/df)+((d*t)/(df*df));
 
 if (fabs(t)<1) {R=1;}
 else {R=exp((s*s)/2);}
 
 if (t<0) {t=t*-1;}                        // make sure t is positive for probnorm
 
 temp1= -(t*t)/2;
 temp2= exp(temp1);
 T= temp2/sqrt(2 * pi);
 x= 1/(1+(c1*t));
 P= (b1*x)+(b2*x*x)+(b3*x*x*x)+(b4*x*x*x*x)+(b5*x*x*x*x*x);
 probnorm=(T*P);
 tprob1=(R*probnorm);
 tprob2=(tprob1*2);
 
 // DETERMINE CONFIDENCE LEVEL
 if (siglevel==99) {
 if (tprob2 < .01) {StrCopy(sigmessage,"SIGNIFICANT at 99% confidence (2-tailed)");}
 else {StrCopy(sigmessage,"NOT SIGNIFICANT at 99% confidence (2-tailed)");}
 }
 if (siglevel==95) {
 if (tprob2 < .05) {StrCopy(sigmessage,"SIGNIFICANT at 95% confidence (2-tailed)");}
 else {StrCopy(sigmessage,"NOT SIGNIFICANT at 95% confidence (2-tailed)");}
 }
 if (siglevel==90) {
 if (tprob2 < .10) {StrCopy(sigmessage,"SIGNIFICANT at 90% confidence (2-tailed)");}
 else {StrCopy(sigmessage,"NOT SIGNIFICANT at 90% confidence (2-tailed)");}
 }
 if (siglevel==80) {
 if (tprob2 < .20) {StrCopy(sigmessage,"SIGNIFICANT at 80% confidence (2-tailed)");}
 else {StrCopy(sigmessage,"NOT SIGNIFICANT at 80% confidence (2-tailed)");}
 }
 
 sprintf(tprob1Text, "%2.4f", tprob1);
 sprintf(tprob2Text, "%2.4f", tprob2);
 sprintf(tText, "%2.4f", tscore);
 sprintf(dfText, "%d", df);
 
 TextSetText( txHandle1, sigmessage);        // display final results
 TextSetText( txHandle2, tprob1Text);
 TextSetText( txHandle3, tprob2Text);
 TextSetText( txHandle4, dfText);
 TextSetText( txHandle5, tText);
 
 ErrorView=ViewAdd("Images/DFError.png", 10,250, RemoveError,0); // set error view invisible
 ViewSetVisible(ErrorView, 0);
 
 if (df<15) {                                // alert if degrees of freedom less than 15
 ViewSetVisible(ErrorView, 1);
 }
 */
    
    private func handleCalculateTTest(withLevel level: Int) {
        
        guard let n1 = Int(baseSize1TextField.text!) else { return }
        guard let n2 = Int(baseSize2TextField.text!) else { return }
        guard let m1 = Double(means1TextField.text!) else { return }
        guard let m2 = Double(means2TextField.text!) else { return }
        guard let se1 = Double(error1TextField.text!) else { return }
        guard let se2 = Double(error2TextField.text!) else { return }
        
        let a = 0.40061;                        // constants for t-dist approx
        let b = 0.27304;
        let c = 10.29722;
        let d = -68.70087;
        
        let c1 = 0.2316419;                    // constants for normal curve approx
        let b1 = 0.319381530;
        let b2 = -0.356563782;
        let b3 = 1.781477937;
        let b4 = -1.821255978;
        let b5 = 1.330274429;
        var R: Double = 0
        
        let df = abs(n1) + abs(n2) - 2
        
        var t = Double(m1 - m2) / sqrt(se1 * se1 + se2 * se2)
        let tscore = fabs(t)
        
        if t > 0 {
            t = t * -1
        }
        
        let s1 = c * t / Double(df)
        let s2 = d * t / Double(df * df)
        let s = a + b * t + s1 + s2
        
        if fabs(t) < 1 {
            R = 1
        } else {
            R = exp(s * s / 2)
        }
        
        if t < 0 {
            t = t * -1
        }
        
        let temp1 = -t * t / 2
        let temp2 = exp(temp1)
        let T = temp2 / sqrt(2 * Double.pi)
        let x = 1 / (1 + c1 * t)
        let P = (b1 * x)+(b2 * x * x)+(b3 * x * x * x)+(b4 * x * x * x * x) + (b5 * x * x * x * x * x)
        let probnorm = T * P
        let tprob1 = Double(R) * probnorm
        let tprob2 = tprob1 * 2
        
        var significantMessage = ""
        if level == 99 {
            if tprob2 < 0.01 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 14)
            }
        }
        
        if level == 95 {
            if tprob2 < 0.05 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 14)
            }
        }
        
        if level == 90 {
            if tprob2 < 0.1 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 14)
            }
        }
        
        if level == 80 {
            if tprob2 < 0.2 {
                significantMessage = self.getSignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 15)
            } else {
                significantMessage = self.getUnsignificantMessage(withLevel: String(level))
                self.significantTextField.font = UIFont.systemFont(ofSize: 14)
            }
        }
        
        self.significantTextField.text = significantMessage
        self.probability1TextField.text = tprob1.cleanFour
        self.probability2TextField.text = tprob2.cleanFour
        self.freedomTextField.text = String(df)
        self.scoreTextField.text = tscore.cleanFour
        
        if df < 15  {
            self.showJHTAlerttOkayWithIcon(message: "Caution: Degrees of freedom too small to yield reliable results.")
        }
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
        
        if (means1TextField.text?.isEmpty)! || !self.isValidProportion(means1TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        if (means2TextField.text?.isEmpty)! || !self.isValidProportion(means2TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        if (error1TextField.text?.isEmpty)! || !self.isValidProportion(error1TextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Please be sure all fields contain valid numbers.")
            return false
        }
        
        if (error2TextField.text?.isEmpty)! || !self.isValidProportion(error2TextField.text!) {
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
        
        guard let _ = Double(number) else { return false }
        
        return true
    }
    
}

//MARK: handle pop controller
extension TTestController {
    
    @objc fileprivate func handleDismissController() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func handleGoingHelpConroller() {
        
        let helpController = HelpController()
        let helpInfo = HelpInfo(title: "T-Test Calculator", help: T_TEST_HELP)
        helpController.helpInfo = helpInfo
        navigationController?.pushViewController(helpController, animated: true)
    }
    
}

extension TTestController: LevelViewDelegate {
    func circleBoxValueChanged(sender: Checkbox, tag: Int) {
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
extension TTestController {
    
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
        setupErrorViews()
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
        
        view.addSubview(freedomLabel)
        _ = freedomLabel.anchor(probability2Label.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(scoreLabel)
        _ = scoreLabel.anchor(freedomLabel.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(probability1TextField)
        _ = probability1TextField.anchor(nil, left: view.centerXAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        probability1TextField.centerYAnchor.constraint(equalTo: probability1Label.centerYAnchor).isActive = true
        
        view.addSubview(probability2TextField)
        _ = probability2TextField.anchor(nil, left: view.centerXAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        probability2TextField.centerYAnchor.constraint(equalTo: probability2Label.centerYAnchor).isActive = true
        
        view.addSubview(freedomTextField)
        _ = freedomTextField.anchor(nil, left: view.centerXAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        freedomTextField.centerYAnchor.constraint(equalTo: freedomLabel.centerYAnchor).isActive = true
        
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
    
    private func setupErrorViews() {
        
        view.addSubview(errorLabel)
        _ = errorLabel.anchor(meansLabel.bottomAnchor, left: meansLabel.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(error1TextField)
        _ = error1TextField.anchor(meansLabel.bottomAnchor, left: sample1ToplessTextField.leftAnchor, bottom: nil, right: sample1ToplessTextField.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        error1TextField.centerYAnchor.constraint(equalTo: errorLabel.centerYAnchor).isActive = true
        
        view.addSubview(error2TextField)
        _ = error2TextField.anchor(meansLabel.bottomAnchor, left: sample2ToplessTextField.leftAnchor, bottom: nil, right: sample2ToplessTextField.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        error2TextField.centerYAnchor.constraint(equalTo: errorLabel.centerYAnchor).isActive = true
    }
    
    private func setupCalculator() {
        
        view.addSubview(calculatorLabel)
        _ = calculatorLabel.anchor(errorLabel.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 35)
        
        view.addSubview(calculatorButton)
        _ = calculatorButton.anchor(nil, left: errorLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 110, heightConstant: 25)
        calculatorButton.centerYAnchor.constraint(equalTo: calculatorLabel.centerYAnchor).isActive = true
        
        view.addSubview(lineView)
        _ = lineView.anchor(calculatorButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 5, leftConstant: 15, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 5)
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
        
        view.addSubview(meansLabel)
        _ = meansLabel.anchor(baseSizeLabel.bottomAnchor, left: selectLevelLabel.leftAnchor, bottom: nil, right: view.centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        view.addSubview(means1TextField)
        _ = means1TextField.anchor(meansLabel.topAnchor, left: sample1ToplessTextField.leftAnchor, bottom: meansLabel.bottomAnchor, right: sample1ToplessTextField.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(means2TextField)
        _ = means2TextField.anchor(meansLabel.topAnchor, left: sample2ToplessTextField.leftAnchor, bottom: meansLabel.bottomAnchor, right: sample2ToplessTextField.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
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
        
        navigationItem.title = "T-Test Calculator"
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

