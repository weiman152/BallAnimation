//
//  BallView.swift
//  TestBallAnimation
//
//  Created by iOS on 2018/10/17.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class BallView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var redBallView: UIView!
    @IBOutlet weak var yellowBallView: UIView!
    @IBOutlet weak var blueBallView: UIView!
    @IBOutlet weak var adContentView: UIView!
    @IBOutlet weak var adContentViewWidthConstraint: NSLayoutConstraint!
    
    private var adImageView: UIImageView = {
        $0.image = UIImage(named: "greenBall")
        return $0
    } ( UIImageView() )
    
    let ScreenWidth = UIScreen.main.bounds.size.width
    let ScreenHeight = UIScreen.main.bounds.size.height
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        
        adContentView.addSubview(adImageView)
        adImageView.frame = CGRect(x: 0,
                                   y: adContentView.frame.size.height / 2.0,
                                   width: 0,
                                   height: 0)
        
        redBallView.layer.cornerRadius = 30
        redBallView.layer.masksToBounds = true
        yellowBallView.layer.cornerRadius = 30
        yellowBallView.layer.masksToBounds = true
        blueBallView.layer.cornerRadius = 30
        blueBallView.layer.masksToBounds = true
    }
}

extension BallView {
    
    func start() {
        // 计算右边间距
        let distance = (ScreenWidth - 15 * 2 - 60 * 4) / 3.0
        let constant = distance + 60
        
        UIView.animate(withDuration: 2.0, animations: { [weak self] in
            
            guard let this = self else {
                return
            }
            
            this.adContentViewWidthConstraint.constant = constant
            this.adImageView.frame = CGRect(x: constant - 60, y: 0, width: 60, height: 60)
            this.layoutIfNeeded()
        }) { [weak self](_) in
            
            guard let this = self else {
                return
            }
            
            this.adContentViewWidthConstraint.constant = constant
            this.adImageView.frame = CGRect(x: constant - 60, y: 0, width: 60, height: 60)
        }
    }
    
    func reset() {
        adContentViewWidthConstraint.constant = 0
        adImageView.frame = CGRect(x: 0,
                                   y: adContentView.frame.size.height / 2.0,
                                   width: 0,
                                   height: 0)
    }
}
