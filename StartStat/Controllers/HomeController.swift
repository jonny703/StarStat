//
//  HomeController.swift
//  StartStat
//
//  Created by John Nik on 1/20/18.
//  Copyright © 2018 johnik703. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    let cellId = "cellId"
    
    let testContents: [TestContent] = {
        
        let test1 = TestContent(imageName: AssetName.starIcon.rawValue, test: Z_TEST)
        let test2 = TestContent(imageName: AssetName.starIcon.rawValue, test: T_TEST)
        let test3 = TestContent(imageName: AssetName.starIcon.rawValue, test: SAMPLE_TEST)
        return [test1, test2, test3]
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    let questionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "What do you want to do?"
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
        
    }()
    
    lazy var visitButton: UIButton = {
        
        let button = UIButton(type: .system)
        let image = UIImage(named: AssetName.homeIcon.rawValue)
        button.setImage(image, for: .normal)
        button.setTitle("Visit our website", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleVisitWebsite), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

}

extension HomeController {
    
    @objc fileprivate func handleVisitWebsite() {
        guard let destinationUrl = URL(string: "http://www.surveystar.com/") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(destinationUrl, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(destinationUrl)
        }
    }
    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return testContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TestCell
        
        cell.testContents = self.testContents[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let zTestConroller = ZTestController()
            navigationController?.pushViewController(zTestConroller, animated: true)
        } else if indexPath.row == 1 {
            let tTestController = TTestController()
            navigationController?.pushViewController(tTestController, animated: true)
        } else if indexPath.row == 2 {
            let sampleTestController = SampleTestController()
            navigationController?.pushViewController(sampleTestController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeController {
    
    @objc fileprivate func handleGoingToMoreInfoConroller() {
        
        let moreInfoController = MoreInfoController()
        navigationController?.pushViewController(moreInfoController, animated: true)
    }
    
}

//MARK: setup views
extension HomeController {
    
    fileprivate func setupViews() {
        
        setupBackground()
        setupNavBar()
        setupLabels()
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.register(TestCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        
        _ = tableView.anchor(questionLabel.bottomAnchor, left: view.leftAnchor, bottom: visitButton.topAnchor, right: view.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
    }
    
    private func setupLabels() {
        
        view.addSubview(titleLabel)
        _ = titleLabel.anchor(self.topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        
        
        
        view.addSubview(questionLabel)
        _ = questionLabel.anchor(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
    }
    
    private func setupBackground() {
        
        view.backgroundColor = StyleGuideManager.mainYellowBackgroundColor
        
        let iconImageView = UIImageView()
        let iconImage = UIImage(named: AssetName.appIcon.rawValue)
        iconImageView.image = iconImage
        
        view.addSubview(iconImageView)
        _ = iconImageView.anchor(topLayoutGuide.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        
        let nameImageView = UIImageView()
        let image = UIImage(named: AssetName.appName.rawValue)
        nameImageView.image = image
        
        view.addSubview(nameImageView)
        _ = nameImageView.anchor(topLayoutGuide.bottomAnchor, left: nil, bottom: nil, right: iconImageView.leftAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: -10, widthConstant: 206, heightConstant: 78)
        
        
        view.addSubview(visitButton)
        _ = visitButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 10, widthConstant: 200, heightConstant: 40)
    }
    
    private func setupNavBar() {
        
        navigationItem.title = "A Statistical Testing Utility"
        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        let infoImage = UIImage(named: AssetName.infoIcon.rawValue)
        let moreButton = UIBarButtonItem(image: infoImage, style: .done, target: self, action: #selector(handleGoingToMoreInfoConroller))
        
        navigationItem.rightBarButtonItem = moreButton
    }
}
