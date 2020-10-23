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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountryInfo();
        // Do any additional setup after loading the view.
    }
    // Fetch Country Informtion from Server API
    func fetchCountryInfo() {
        API.fetchCountryData(success: { (result) in
            self.countryInfo = result;
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
            self.tblAboutCanada.rowHeight = UITableView.automaticDimension
            self.tblAboutCanada.estimatedRowHeight = UITableView.automaticDimension
            self.tblAboutCanada.register(TableViewDetailsCell.self, forCellReuseIdentifier: "CanadaDetailsCell")
            self.view.addSubview(self.tblAboutCanada);
            self.setTableViewConstraints();
        }
    }
    //Set TableView Constraints
    func setTableViewConstraints() {
        self.tblAboutCanada.translatesAutoresizingMaskIntoConstraints = false
        self.tblAboutCanada.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
}

