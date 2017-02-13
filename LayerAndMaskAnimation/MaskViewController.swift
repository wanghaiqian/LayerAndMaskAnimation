//
//  MaskViewController.swift
//  SwiftDemo
//
//  Created by 王海堑 on 2017/2/8.
//  Copyright © 2017年 DSHD network technology co.,. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {
    
    var customButton : UIButton? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red;
        self.title = "Mask"
        self.initCustomLabel()
        self.initButton()
        // Do any additional setup after loading the view.
    }
    
    func initCustomLabel() -> Void {
        let customLabel = UILabel(frame: CGRect(x: 0, y: 200, width: 375, height: 50))
        customLabel.text = "Hello!"
        customLabel.textAlignment = NSTextAlignment.center
        customLabel.textColor = UIColor.white
        customLabel.font = UIFont.systemFont(ofSize: 45)
        self.view.addSubview(customLabel)
    }
    
    func initButton() -> Void {
        self.customButton = UIButton(type: UIButtonType.custom)
        self.customButton?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.customButton?.center = CGPoint(x: 185, y: 467)
        self.customButton?.setBackgroundImage(UIImage(named: "img1"), for: UIControlState.normal)
        self.customButton?.addTarget(self, action:#selector(MaskViewController.initMask), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.customButton!)
//        self.view.mask = self.customButton
        let buttonPath = UIBezierPath(ovalIn:self.customButton!.frame)
        let layer = CAShapeLayer()
        layer.path = buttonPath.cgPath
        self.view.layer.mask = layer
    }
    
    func initMask() -> Void {
        let buttonPath = UIBezierPath(ovalIn:self.customButton!.frame)
        let finalRect = self.customButton!.frame.insetBy(dx: -1000, dy: -1000)
        let finalPath = UIBezierPath(ovalIn: finalRect)
        
        let layer = CAShapeLayer()
        layer.path = finalPath.cgPath
        self.view.layer.mask = layer
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = buttonPath.cgPath
        animation.toValue = finalPath.cgPath
        animation.duration = 2.0
        layer.add(animation, forKey: "path")
    }
    
    func pressButton() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
