//
//  ViewController.swift
//  TestBallAnimation
//
//  Created by iOS on 2018/10/17.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ScreenWidth = UIScreen.main.bounds.size.width
    let ScreenHeight = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var ballView: BallView!
    
    private var adBigView: UIView = {
        $0.backgroundColor = .green
        return $0
    }( UIView() )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        view.addSubview(adBigView)
        adBigView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        adBigView.center = view.center
        adBigView.layer.cornerRadius = 10
        adBigView.layer.masksToBounds = true
    }
    
    @IBAction func start(_ sender: Any) {
        
        ballView.start()
        
        UIView.animate(withDuration: 2.0, animations: { [weak self] in
            
            guard let this = self else {
                return
            }
            
            this.adBigView.frame = CGRect(x: this.ScreenWidth - 75, y: 60, width: 30, height: 40)
            this.adBigView.alpha = 0
            this.view.layoutIfNeeded()
        }) { [weak self](_) in
            
            guard let this = self else {
                return
            }

            this.adBigView.frame = CGRect(x: this.ScreenWidth - 75, y: 60, width: 30, height: 40)
            this.adBigView.alpha = 0
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        
        ballView.reset()
        
        adBigView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        adBigView.center = view.center
        adBigView.alpha = 1.0
    }
    
}

