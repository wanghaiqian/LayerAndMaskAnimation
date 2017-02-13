//
//  GradientLlayerDemo.swift
//  SwiftDemo
//
//  Created by 王海堑 on 2017/2/9.
//  Copyright © 2017年 DSHD network technology co.,. All rights reserved.
//

import UIKit

class GradientLlayerDemo: UIViewController {
    
    var customLabel : UILabel? = nil
    var customImageView : UIImageView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "GradientLayerDemo"
        self.initUI()
    }
    
    private func initUI() {
        //内容视图
        let containerView = UIView()
        containerView.bounds = CGRect(x: 0, y: 0, width: 300, height: 80)
        containerView.center = view.center
        view.addSubview(containerView)
        //
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.25, 0.5, 0.75]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        containerView.layer.addSublayer(gradientLayer)
        //绘制文本图片
        let text: NSString = "Hello world!"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let textAttribute: [String: AnyObject] = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 30)!, NSParagraphStyleAttributeName: style]
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        text.draw(in: containerView.bounds, withAttributes: textAttribute)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageLayer = CALayer()
        imageLayer.frame = self.view.bounds.offsetBy(dx: 0, dy: 20)
        imageLayer.contents = image?.cgImage
        gradientLayer.mask = imageLayer
        //添加动画
        gradientLayer.add(animation(), forKey: "LocationAnimation")
    }
    
    private func animation() -> CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.25]
        animation.toValue = [0.75, 1.0, 1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        return animation
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
