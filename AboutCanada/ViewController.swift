//
//  ViewController.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tblAboutCanada: UITableView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tblAboutCanada = UITableView()
        tblAboutCanada.delegate = self;
        tblAboutCanada.dataSource = self;
        tblAboutCanada.register(TableViewDetailsCell.self, forCellReuseIdentifier: "CanadaDetailsCell")
        tblAboutCanada.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tblAboutCanada);
        tblAboutCanada.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tblAboutCanada.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tblAboutCanada.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tblAboutCanada.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true

        // Do any additional setup after loading the view.
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5;
 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tblAboutCanada.dequeueReusableCell(withIdentifier: "CanadaDetailsCell", for: indexPath) as! TableViewDetailsCell
    cell.lblTitle.text = "About Canada";
    cell.lblDescription.text = "A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.";
    cell.imgDisplay.image = UIImage(named: "http://icons.iconarchive.com/icons/iconshock/alaska/256/Igloo-icon.png");
    return cell;
 }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
}

