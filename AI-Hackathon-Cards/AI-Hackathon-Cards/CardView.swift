//
//  CardView.swift
//  Cards
//
//  Created by Z on 14.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

class CardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCardView()
    }
    
    private func setupCardView() {
        //backgroundColor = Colors.white
        layer.cornerRadius = 7
        layer.shadowColor = Colors.blue.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
