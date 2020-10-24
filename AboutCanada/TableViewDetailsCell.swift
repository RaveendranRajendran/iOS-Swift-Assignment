//
//  TableViewDetailsCell.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import UIKit

class TableViewDetailsCell: UITableViewCell {
    var lblTitle = UILabel();
    var lblDescription = UILabel();
    var imgDisplay = UIImageView();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lblTitle);
        addSubview(lblDescription);
        addSubview(imgDisplay);
        
        configureTitleLabel();
        configureDescriptionLabel();
        configureImageView()
        setImageViewConstraints();
        setDescriptionConstraints();
        setTitleConstraint();
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureTitleLabel() {
        self.lblTitle.numberOfLines = 0;
        self.lblTitle.adjustsFontSizeToFitWidth = true;
    }
    
    func configureDescriptionLabel() {
        self.lblDescription.numberOfLines = 0;
        self.lblDescription.adjustsFontSizeToFitWidth = true;
    }
    
    func configureImageView() {
        self.imgDisplay.layer.cornerRadius = 5.0;
        self.imgDisplay.clipsToBounds = true;
        self.imgDisplay.contentMode = .scaleAspectFit
    }
    
    func setImageViewConstraints() {
        self.imgDisplay.translatesAutoresizingMaskIntoConstraints = false
        self.imgDisplay.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
        self.imgDisplay.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 12).isActive = true
        self.imgDisplay.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.imgDisplay.widthAnchor.constraint(equalTo:imgDisplay.heightAnchor, multiplier: 16/9).isActive = true
        self.imgDisplay.topAnchor.constraint(equalTo: lblTitle.bottomAnchor,constant: 5).isActive = true
        
    }
    
    func setDescriptionConstraints() {
        self.lblDescription.translatesAutoresizingMaskIntoConstraints = false
        self.lblDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.lblDescription.leadingAnchor.constraint(equalTo: imgDisplay.trailingAnchor, constant: 40).isActive = true
        self.lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13).isActive = true;
        self.lblDescription.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true;
        self.lblDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true;
    }
    
    func setTitleConstraint() {
        self.lblTitle.translatesAutoresizingMaskIntoConstraints = false;
        self.lblTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true;
        self.lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true;
        self.lblTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true;
    }

}
