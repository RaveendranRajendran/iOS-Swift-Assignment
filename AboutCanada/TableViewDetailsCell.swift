//
//  TableViewDetailsCell.swift
//  AboutCanada
//
//  Created by Raveendran on 22/10/20.
//  Copyright © 2020 com.ravi. All rights reserved.
//

import UIKit

class TableViewDetailsCell: UITableViewCell {
    
    let lblTitle : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.font = UIFont.boldSystemFont(ofSize: 16)
    lbl.textAlignment = .left
    lbl.frame = CGRect(x: 20.0, y: 2, width: 100, height: 40)

    return lbl
    }()
    
    
    let lblDescription : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.font = UIFont.systemFont(ofSize: 16)
    lbl.textAlignment = .left
    lbl.numberOfLines = 0
    lbl.frame = CGRect(x: 150, y: 2, width: 200, height: 80)
    return lbl
    }()
    
     let imgDisplay : UIImageView = {
    let imgView = UIImageView();
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lblTitle);
        addSubview(lblDescription);
        addSubview(imgDisplay);
        
//        lblTitle.translatesAutoresizingMaskIntoConstraints = false
//        imgDisplay.translatesAutoresizingMaskIntoConstraints = false
//        imgDisplay.translatesAutoresizingMaskIntoConstraints = false
        
            
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
