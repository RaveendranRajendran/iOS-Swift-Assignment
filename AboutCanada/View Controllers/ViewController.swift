//
//  ViewController.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage


class ViewController: UIViewController {
    
    var tblAboutCanada: UITableView!
    var countryInfo: CanadaInfo?
    var imgUrl: URL?
    var refreshControl = UIRefreshControl()
    var activityIndicator: UIActivityIndicatorView!
    let loadingTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableView()
        self.customizeActivityIndicator()
        fetchCountryInfo()
        self.title = appStrings.DEFAULT_TITLE
        // Do any additional setup after loading the view.
    }
    //MARK: CUSTOMIZE ACTIVITY INDICATOR VIEW
    func customizeActivityIndicator() {
        self.activityIndicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        self.activityIndicator.alpha = 1.0
        self.activityIndicator.color = .red
        loadingTextLabel.textColor = UIColor.black
        loadingTextLabel.text = appStrings.LOADING_STRING
        loadingTextLabel.font = UIFont(name: appFonts.HELVETICA_N, size: 12)
        loadingTextLabel.sizeToFit()
        loadingTextLabel.center = CGPoint(x: activityIndicator.center.x, y: activityIndicator.center.y + 30)
        
    }
    //MARK: PULL TO REFRESH
    @objc func refreshTableViewData() {
        self.fetchCountryInfo()
    }
    
    //MARK: Fetch COUNTRY INFORMATION FROM SERVER API
    func fetchCountryInfo() {
        self.activityIndicator.startAnimating()
        API.fetchCountryData(success: { (result) in
            self.countryInfo = result
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
               self.refreshControl.endRefreshing()
                self.tblAboutCanada.reloadData()
                self.title = self.countryInfo?.title ?? appStrings.DEFAULT_TITLE
            }
        }) { (error) in
            print(error)
        }
    }
    //MARK: REGISTER TABLEVIEW
    func registerTableView() {
        DispatchQueue.main.async {
            self.tblAboutCanada = UITableView()
            self.tblAboutCanada.delegate = self
            self.tblAboutCanada.dataSource = self
            self.tblAboutCanada.register(TableViewDetailsCell.self, forCellReuseIdentifier: appStrings.REUSE_IDENTIFIER)
            self.tblAboutCanada.rowHeight = UITableView.automaticDimension
            self.tblAboutCanada.estimatedRowHeight = 100
            self.view.addSubview(self.tblAboutCanada)
            self.tblAboutCanada.addSubview(self.activityIndicator)
            self.activityIndicator.addSubview(self.loadingTextLabel)
            self.setConstraintsToActivityIndicator()
            self.tblAboutCanada.addSubview(self.refreshControl)
            self.refreshControl.attributedTitle = NSAttributedString(string: appStrings.REFRESHCONTROL_STRING)
            self.refreshControl.addTarget(self, action: #selector(self.refreshTableViewData), for: UIControl.Event.valueChanged)
            self.setTableViewConstraints()
        }
    }
    //MARK: SET CONSTRAINTS TO ACTIVITY INDICATOR
    func setConstraintsToActivityIndicator() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    //MARK: SET TABLEVIEW CONSTRAINTS
    func setTableViewConstraints() {
        self.tblAboutCanada.translatesAutoresizingMaskIntoConstraints = false
        self.tblAboutCanada.topAnchor.constraint(equalTo:self.view.topAnchor, constant: 0).isActive = true
        self.tblAboutCanada.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        self.tblAboutCanada.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.tblAboutCanada.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
}
//MARK: TABLE VIEW DELEGATE AND DATASOURCE METHODS
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Table View data Source
       func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return countryInfo?.rows.count ?? 0
    }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblAboutCanada.dequeueReusableCell(withIdentifier: appStrings.REUSE_IDENTIFIER, for: indexPath) as! TableViewDetailsCell
           if let title = countryInfo?.rows[indexPath.row].title {
               cell.lblTitle.text = title
           } else {
            cell.lblTitle.text = appStrings.TABLE_TITLE_NOTAVILABLE
           }
           if let description = countryInfo?.rows[indexPath.row].description {
               cell.lblDescription.text = description
           } else {
            cell.lblDescription.text = appStrings.TABLE_DESCRIPTION_NOTAVILABLE
           }
           //Used SDWebImage to display Image
           imgUrl = URL(string: countryInfo?.rows[indexPath.row].imageHref ?? "")
           cell.imgDisplay.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: "PlaceHolderImage.jpg"), options: .transformAnimatedImage, progress: nil, completed: nil)
          return cell
       }
       //Table View Delegate
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.tblAboutCanada.deselectRow(at: indexPath, animated: true)
       }
}

