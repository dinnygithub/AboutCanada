//
//  CListView.swift
//  AboutCanada
//
//  Created by Dinny Anand on 31/03/2020.
//  Copyright © 2020 Dinny Anand. All rights reserved.
//

import Foundation
import SnapKit

class CListView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundView: UIView = {
           let view = UIView(frame: .zero)
        view.backgroundColor = Theme.colors.acGreen()
           return view
       }()

    
    
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = Theme.colors.acWhite()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
 
    
    private func setup() {
           setupViews()
           setupConstraints()
       }
    
    private func setupConstraints() {
           backgroundView.pinEdges(to: self)
        self.tableview.pinEdges(to: self)
       }

    private func setupViews() {
           self.addSubview(backgroundView)
           self.addSubview(tableview)
    }
}



