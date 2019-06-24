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
    
    public let timeLineView: AJTimeLine = {
        let view: AJTimeLine = AJTimeLine(
            topBarHeight: 25.0,
            ringSize: 20.0,
            bottomBarHeight: 10.0
        )
        view.backgroundColor = UIColor.white
        return view
    }()
    
    public let timeLineView1: AJTimeLine = {
        let view: AJTimeLine = AJTimeLine(
            topBarHeight: 25.0,
            ringSize: 20.0,
            bottomBarHeight: 10.0
        )
        view.backgroundColor = UIColor.white
        return view
    }()
    
    public let timeLineView2: AJTimeLine = {
        let view: AJTimeLine = AJTimeLine(
            topBarHeight: 25.0,
            ringSize: 20.0,
            bottomBarHeight: 10.0
        )
        view.backgroundColor = UIColor.white
        return view
    }()
    
    public let timelineStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis  = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.center
        view.spacing = 0.0
        return view
    }()
    
    private var timelineStackViewHeight: CGFloat = 0.0
    private var timelineStackViewConstraintHeight: Constraint!
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.timelineStackView
        ])
        
        self.timelineStackView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(50.0)
            self.timelineStackViewConstraintHeight =  make.height.equalTo(200.0).constraint
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
        }
        
        for _ in 1...8 {
            
            let leftLabel: UILabel = {
                let view: UILabel = UILabel()
                view.text = "left label Sample"
                view.font = UIFont.systemFont(
                    ofSize: 14.0,
                    weight: UIFont.Weight.semibold
                )
                view.adjustsFontSizeToFitWidth = true
                return view
            }()
            
            let timeLineView: AJTimeLine = {
                let view: AJTimeLine = AJTimeLine(
                    topBarHeight: 25.0,
                    ringSize: 20.0,
                    bottomBarHeight: 10.0
                )
                view.backgroundColor = UIColor.white
                return view
            }()
            
            let rightLabel: UILabel = {
                let view: UILabel = UILabel()
                view.text = "right label Sample"
                view.font = UIFont.systemFont(
                    ofSize: 14.0,
                    weight: UIFont.Weight.semibold
                )
                view.adjustsFontSizeToFitWidth = true
                return view
            }()
            
            let timelineMomentsStackView: UIStackView = {
                let view: UIStackView = UIStackView()
                view.axis  = NSLayoutConstraint.Axis.horizontal
                view.alignment = UIStackView.Alignment.center
                view.spacing = 0.0
                view.distribution = UIStackView.Distribution.fillEqually
                return view
            }()
            
            timelineMomentsStackView.addArrangedSubview(leftLabel)
            timelineMomentsStackView.addArrangedSubview(timeLineView)
            timelineMomentsStackView.addArrangedSubview(rightLabel)
            
            self.timelineStackView.addArrangedSubview(timelineMomentsStackView)
            
            self.timelineStackViewHeight += 40
            
        }
        
        self.timelineStackView.distribution = UIStackView.Distribution.fillEqually
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        print("FRAME \(self.timelineStackView.frame.height)")
        
        self.timelineStackViewConstraintHeight.update(offset: self.timelineStackViewHeight)
    }
    
}
