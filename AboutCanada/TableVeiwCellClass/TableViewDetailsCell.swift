//
//  TableViewDetailsCell.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import UIKit

class TableViewDetailsCell: UITableViewCell {
    var lblTitle = UILabel()
    var lblDescription = UILabel()
    var imgDisplay = UIImageView()
    var commonHeight: CGFloat!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(lblTitle)
        self.contentView.addSubview(lblDescription)
        self.contentView.addSubview(imgDisplay)
        calculateCommonHeight()
        setTitleConstraint()
        configureTitleLabel()
        setDescriptionConstraints()
        configureDescriptionLabel()
        setImageViewConstraints()
        configureImageView()
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    //MARK: TABLEVIEW TITLE LABEL
    func configureTitleLabel() {
        self.lblTitle.numberOfLines = 0
        self.lblTitle.adjustsFontSizeToFitWidth = true
        self.lblTitle.font = UIFont(name:appFonts.HELVETICA_B, size: 16.0)
    }
    //MARK: TABLEVIEW DESCRIPTION LABEL
    func configureDescriptionLabel() {
        self.lblDescription.numberOfLines = 0
        self.lblDescription.adjustsFontSizeToFitWidth = true
        self.lblDescription.font = UIFont(name:appFonts.HELVETICA_N, size: 20.0)
    }
    //MARK: TABLEIVIEW IMAGE DISPLAY
    func configureImageView() {
        self.imgDisplay.layer.cornerRadius = self.commonHeight/2
        self.imgDisplay.clipsToBounds = true
        self.imgDisplay.contentMode = .scaleAspectFill
    }
    //MARK: FIND DEVICE HEIGHT
    func calculateCommonHeight() {
            self.commonHeight = UIDevice.screenWidth()/4
}
    //MARK: SETTING CONSTRAINTS TO IMAGE VIEW
    func setImageViewConstraints() {
        self.imgDisplay.translatesAutoresizingMaskIntoConstraints = false
        self.imgDisplay.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 12).isActive = true
        self.imgDisplay.heightAnchor.constraint(equalToConstant: self.commonHeight).isActive = true
        self.imgDisplay.widthAnchor.constraint(equalToConstant: self.commonHeight).isActive = true
        self.imgDisplay.centerYAnchor.constraint(equalTo:self.lblDescription.centerYAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(greaterThanOrEqualTo: self.imgDisplay.bottomAnchor, constant: 10).isActive = true
    }
    //MARK: SETTING CONSTRINTS TO DESCRIPTION LABEL
    func setDescriptionConstraints() {
        self.lblDescription.translatesAutoresizingMaskIntoConstraints = false
        self.lblDescription.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: self.commonHeight + 40).isActive = true
        self.lblDescription.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
        self.lblDescription.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor, constant: 10).isActive = true
        self.lblDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    //MARK: SEETING CONSTRAINTS TO TITLE LABEL
    func setTitleConstraint() {
        self.lblTitle.translatesAutoresizingMaskIntoConstraints = false
        self.lblTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.lblTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        self.lblTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
    }
}
//MARK: GETTING DEVICE HEIGHT AND WIDTH.
extension UIDevice {
    class func screenWidth()-> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    class func screenHeight()-> CGFloat {
        return UIScreen.main.bounds.height
    }
}
