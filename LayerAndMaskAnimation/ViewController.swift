//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 王海堑 on 2016/12/27.
//  Copyright © 2016年 DSHD network technology co.,. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var customTableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.gray
        self.title = "SwiftDemo"
        self.automaticallyAdjustsScrollViewInsets = false
        self.initCustomTableView()
    }
    
    func initCustomTableView() -> Void{
        self.customTableView = UITableView(frame: CGRect(x: 0, y: 64, width: 375, height: 603), style: UITableViewStyle.grouped)
        self.customTableView?.backgroundColor = UIColor.lightGray
        self.customTableView?.dataSource = self;
        self.customTableView?.delegate = self;
        self.view.addSubview(self.customTableView!)
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3;
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "UITableViewCell")
        if indexPath.row == 0 {
            cell.textLabel?.text = "UIBeZierPath"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "Mask"
        } else if indexPath.row == 2  {
            cell.textLabel?.text = "GradientLayerDemo"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 44;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let bezierAndshaperLayerVC = UIBezierPathAndCAShapeLayer()
            self.navigationController?.pushViewController(bezierAndshaperLayerVC, animated: true)
        }else if indexPath.row == 1 {
            let maskVC = MaskViewController()
            self.navigationController?.pushViewController(maskVC, animated: true)
        }else if indexPath.row == 2 {
            let gradientLayerDemoVC = GradientLlayerDemo()
            self.navigationController?.pushViewController(gradientLayerDemoVC, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

