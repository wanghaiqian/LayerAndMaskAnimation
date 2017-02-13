//
//  UIBezierPathAndCAShapeLayer.swift
//  SwiftDemo
//
//  Created by 王海堑 on 2017/2/8.
//  Copyright © 2017年 DSHD network technology co.,. All rights reserved.
//

import UIKit

class UIBezierPathAndCAShapeLayer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "UIBezierPathAndShapeLayer"
        self.initCustomLayer()
    }
    
    func initCustomLayer() -> Void {
        //背景圆圈
        let backgroundCirclePath = UIBezierPath(arcCenter: CGPoint(x: 185, y: 200), radius: 100, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let backgroundCircleLayer = CAShapeLayer()
        backgroundCircleLayer.path = backgroundCirclePath.cgPath
        backgroundCircleLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundCircleLayer.fillColor = UIColor.clear.cgColor
        backgroundCircleLayer.lineWidth = 30.0
        backgroundCircleLayer.lineCap = "round"
        self.view.layer.addSublayer(backgroundCircleLayer)
        //绘画圆
        let animationPath = UIBezierPath(arcCenter: CGPoint(x: 185, y: 200), radius: 100, startAngle: CGFloat(M_PI * 3 / 2), endAngle: CGFloat(M_PI), clockwise: true)
        let layer = CAShapeLayer()
        layer.path = animationPath.cgPath
        layer.lineWidth = 30.0
        layer.lineCap = "round"
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.gray.cgColor
        self.view.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 2.0
        layer.add(animation, forKey: "")
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
