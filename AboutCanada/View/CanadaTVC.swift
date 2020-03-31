//
//  CanadaTVC.swift
//  AboutCanada
//
//  Created by Dinny Anand on 31/03/2020.
//  Copyright © 2020 Dinny Anand. All rights reserved.
//


import UIKit
import SnapKit

class CanadaTVC: UITableViewCell {
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func makeRoundCorners(byRadius rad: CGFloat) {
       self.layer.cornerRadius = rad
       self.clipsToBounds = true
    }
    
    let cellView: UIView = {
        let view = UIView()
    //    view.backgroundColor = Theme.colors.acGreen()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.colors.acWhite()
        label.backgroundColor = Theme.colors.acBlack()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let subStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.colors.acBlack()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
      //  label.backgroundColor = UIColor.yellow
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let canadaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
      
        return imageView
    }()
    
    let mainStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(mainStack)
        addSubview(canadaImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        cellView.addSubview(subStack)
        cellView.pinEdges(to: self)
        mainStack.pinEdges(to: cellView)
        subStack.pinEdges(to: mainStack)
        mainStack.addArrangedSubview(canadaImageView)
        
        subStack.addArrangedSubview(titleLabel)
        subStack.addArrangedSubview(descriptionLabel)
        
        mainStack.addArrangedSubview(subStack)
        mainStack.addSubview(subStack)
        addSubview(mainStack)
        
        
        self.selectionStyle = .none
           
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(cellView.snp.top)
            make.bottom.equalTo(descriptionLabel.snp.top)
            make.height.equalTo(30)
            make.trailing.equalTo(cellView.snp.trailing)
        }
        
        descriptionLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(cellView.snp.trailing)
            make.bottom.equalTo(cellView.snp.bottom)
        }
        
        canadaImageView.snp.makeConstraints{ make in
            make.leading.equalTo(cellView.snp.leading)
            make.width.equalTo(200)
            make.top.equalTo(mainStack.snp.top)
            make.bottom.equalTo(descriptionLabel.snp.bottom)
        }
    }
}

