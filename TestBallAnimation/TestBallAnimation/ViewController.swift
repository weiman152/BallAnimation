//
//  ViewController.swift
//  TestBallAnimation
//
//  Created by iOS on 2018/10/17.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    private var adBigView: UIView = {
        $0.backgroundColor = .green
        return $0
    }( UIView() )
    
    let ScreenWidth = UIScreen.main.bounds.size.width
    let ScreenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        view.addSubview(adBigView)
        adContentView.addSubview(adImageView)
        adImageView.frame = CGRect(x: 0,
                              y: adContentView.frame.size.height / 2.0,
                              width: 0,
                              height: 0)
        
        adBigView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        adBigView.center = view.center
        
        redBallView.layer.cornerRadius = 30
        redBallView.layer.masksToBounds = true
        yellowBallView.layer.cornerRadius = 30
        yellowBallView.layer.masksToBounds = true
        blueBallView.layer.cornerRadius = 30
        blueBallView.layer.masksToBounds = true
        adBigView.layer.cornerRadius = 10
        adBigView.layer.masksToBounds = true
    }
    
    @IBAction func start(_ sender: Any) {
        
        // 计算右边间距
        let distance = (ScreenWidth - 15 * 2 - 60 * 4) / 3.0
        let constant = distance + 60
        
        UIView.animate(withDuration: 2.0, animations: { [weak self] in
            
            guard let this = self else {
                return
            }
            
            this.adContentViewWidthConstraint.constant = constant
            this.adImageView.frame = CGRect(x: constant - 60, y: 0, width: 60, height: 60)
            this.adBigView.frame = CGRect(x: this.ScreenWidth - 75, y: 60, width: 30, height: 40)
            this.adBigView.alpha = 0
            this.view.layoutIfNeeded()
        }) { [weak self](_) in
            
            guard let this = self else {
                return
            }
            
            this.adContentViewWidthConstraint.constant = constant
            this.adImageView.frame = CGRect(x: constant - 60, y: 0, width: 60, height: 60)
            this.adBigView.frame = CGRect(x: this.ScreenWidth - 75, y: 60, width: 30, height: 40)
            this.adBigView.alpha = 0
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        adContentViewWidthConstraint.constant = 0
        adImageView.frame = CGRect(x: 0,
                              y: adContentView.frame.size.height / 2.0,
                              width: 0,
                              height: 0)
        adBigView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        adBigView.center = view.center
        adBigView.alpha = 1.0
    }
    
}

