//
//  MainView.swift
//  TimeLine
//
//  Created by Alvin Joseph Valdez on 21/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public class MainView: UIView {
    
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
    
    public let timeLineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.timeLineView
        ])
        
        self.timeLineView.subviews(forAutoLayout: [
            self.topBarView, self.ringView,
            self.bottomBarView
        ])
        
        self.timeLineView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(50.0)
            make.height.equalTo(300.0)
            make.leading.equalToSuperview().offset(50.0)
            make.trailing.equalToSuperview().inset(50.0)
        }
        
        self.topBarView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.height.equalTo(25.0)
            make.width.equalTo(5.0)
            make.bottom.equalTo(self.ringView.snp.top).offset(10.0)
            make.centerX.equalTo(self.ringView)
        }
        
        self.ringView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        self.ringView.subview(forAutoLayout: self.hollowView)
        
        self.hollowView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(16.0)
            make.width.equalTo(16.0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.bottomBarView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.height.equalTo(10.0)
            make.width.equalTo(5.0)
            make.top.equalTo(self.ringView.snp.bottom).inset(2.0)
            make.centerX.equalTo(self.ringView)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        print(self.ringView.frame)
        self.hollowView.layoutIfNeeded()
        self.ringView.layoutIfNeeded()
        self.ringView.setRadius()
        self.hollowView.setRadius()
    }
    
}
