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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tblAboutCanada: UITableView!;
    var countryInfo: CanadaInfo?
    var imgUrl: URL?
    var navBar: UINavigationBar!
    var navItem: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountryInfo();
        // Do any additional setup after loading the view.
    }
    
    // Fetch Country Informtion from Server API
    func fetchCountryInfo() {
        API.fetchCountryData(success: { (result) in
            self.countryInfo = result;
            DispatchQueue.main.async {
                 self.viewDidLayoutSubviews();
            }
            self.registerTableView();
        }) { (error) in
            print(error);
        }
    }
    // Register Table view to display Country Information.
    func registerTableView() {
        DispatchQueue.main.async {
            self.tblAboutCanada = UITableView()
            self.tblAboutCanada.delegate = self;
            self.tblAboutCanada.dataSource = self;
            self.tblAboutCanada.register(TableViewDetailsCell.self, forCellReuseIdentifier: "CanadaDetailsCell");
            self.tblAboutCanada.rowHeight = UITableView.automaticDimension;
            self.tblAboutCanada.estimatedRowHeight = UITableView.automaticDimension;
            self.view.addSubview(self.tblAboutCanada);
            self.setTableViewConstraints();
        }
    }
    //Set TableView Constraints
    func setTableViewConstraints() {
        self.tblAboutCanada.translatesAutoresizingMaskIntoConstraints = false
        self.tblAboutCanada.topAnchor.constraint(equalTo:self.view.topAnchor, constant: 44).isActive = true
        self.tblAboutCanada.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        self.tblAboutCanada.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.tblAboutCanada.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
    
   // Table View data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryInfo?.rows.count ?? 0;
 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblAboutCanada.dequeueReusableCell(withIdentifier: "CanadaDetailsCell", for: indexPath) as! TableViewDetailsCell
        cell.layer.cornerRadius = 10.0;
        if let title = countryInfo?.rows[indexPath.row].title {
            cell.lblTitle.text = title;
        } else {
            cell.lblTitle.text = "Title Not Avilable";
        }
        if let description = countryInfo?.rows[indexPath.row].description {
            cell.lblDescription.text = description;
        } else {
             cell.lblDescription.text = "Description Not Avilable";
        }
        //Used SDWebImage to display Image
        imgUrl = URL(string: countryInfo?.rows[indexPath.row].imageHref ?? "");
        cell.imgDisplay.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: "NoImage.jpg"), options: .transformAnimatedImage, progress: nil, completed: nil);
       return cell;
    }
    //Table View Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    //Setting Navigation Bar and Item
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = self.view.frame.width
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        navBar?.barTintColor = #colorLiteral(red: 0.3529411765, green: 0.7333333333, blue: 0.3529411765, alpha: 1)
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navItem = UINavigationItem.init(title: self.countryInfo?.title ?? "Title")
        // Assign the navigation item to the navigation bar
        navBar.items = [navItem];
        self.view.addSubview(navBar)
    }
    
}

