//
//  AJTimeLine.swift
//  TimeLine
//
//  Created by Alvin Joseph Valdez on 24/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public class AJTimeLine: UIView {
    
    // MARK: - Subviews
    public let topBarView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    public let ringView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    public let hollowView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    public let bottomBarView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    // MARK: - Initializer
    public init(topBarHeight: CGFloat, ringSize: CGFloat, bottomBarHeight: CGFloat) {
        
        self.topBarHeight = topBarHeight
        self.ringSize = ringSize
        self.bottomBarHeight = bottomBarHeight
        
        super.init(frame: CGRect.zero)
        
        let hollowSize: CGFloat = self.ringSize - 4
        
        self.subviews(forAutoLayout: [
            self.topBarView, self.ringView,
            self.bottomBarView
        ])
        
        self.topBarView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.height.equalTo(self.topBarHeight)
            make.width.equalTo(5.0)
            make.bottom.equalTo(self.ringView.snp.top).offset(10.0)
            make.centerX.equalTo(self.ringView)
        }
        
        self.ringView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(self.ringSize)
            make.width.equalTo(self.ringSize)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        self.ringView.subview(forAutoLayout: self.hollowView)
        
        self.hollowView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(hollowSize)
            make.width.equalTo(hollowSize)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.bottomBarView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.height.equalTo(self.bottomBarHeight)
            make.width.equalTo(5.0)
            make.top.equalTo(self.ringView.snp.bottom).inset(2.0)
            make.centerX.equalTo(self.ringView)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.hollowView.layoutIfNeeded()
        self.ringView.layoutIfNeeded()
        self.ringView.setRadius()
        self.hollowView.setRadius()
    }
    
    // MARK: - Stored Properties
    private var topBarHeight: CGFloat
    private var ringSize: CGFloat
    private var bottomBarHeight: CGFloat
}
