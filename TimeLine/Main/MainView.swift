//
//  MainView.swift
//  TimeLine
//
//  Created by Alvin Joseph Valdez on 21/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit

public class MainView: UIView {
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
