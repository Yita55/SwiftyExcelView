//
//  ViewController.swift
//  AKExcelDemo
//
//  Created by 吴莎莉 on 2017/5/31.
//  Copyright © 2017年 alasku. All rights reserved.
//

import UIKit

class ViewController: UIViewController , AKExcelViewDelegate {

    var excelView : AKExcelView = AKExcelView.init(frame: CGRect.init(x: 0, y: 0, width: 375, height: 667))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "我的统计"
        automaticallyAdjustsScrollViewInsets = false
        
        // 设置表头背景色
        excelView.headerBackgroundColor = UIColor.cyan
        // 设置表头
        excelView.headerTitles = ["货号","品名","规格","数量","说明"]
        // 设置间隙
        excelView.textMargin = 20
        // 设置左侧冻结栏数
        excelView.leftFreezeColumn = 1
        // 设置对应模型里面的属性  按顺序
        excelView.properties = ["productNo","productName","specification","quantity","note"]
        excelView.delegate = self
        // 设置指定列指定宽度
        excelView.setsDic = [3:180]
//        excelView.itemInsets = UIEdgeInsets.init(top: 0, left: 1, bottom: 0, right: 1)
        var arrM = [Model]()
        for i in 0 ..< 50 {
            
            let model = Model()
            model.productNo = String.init("货号 - \(i)")
            model.productName = String.init("品名 - \(i)")
            model.specification = String.init("规格  - \(i)")
            model.quantity = String.init("数量 - \(i)")
            model.note = String.init("说明说明说明说明说明说明说明说明 - \(i)")
            model.pro = "others ..."
            
            arrM.append(model)
        }
        
        excelView.contentData = arrM
        view.addSubview(excelView)
        excelView.reloadData()
    }
}

//MARK: - AKExcelViewDelegate

extension UIViewController {
    // 代理方法 点击cell
    func excelView(_ excelView: AKExcelView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section)  -   \(indexPath.item)")
    }
    
//    // 替换item View的代理方法
//    func excelView(_ excelView: AKExcelView, viewAt indexPath: IndexPath) -> UIView? {
//        
//        // 获取当前cell的size
//        let size = excelView.sizeForRow(row: indexPath.row)
//        
//        print(size)
//        
//        if indexPath.section == 5 && indexPath.row == 3 {
//            
//            let v = UIView()
//            v.backgroundColor = UIColor.blue
//            
//            return v
//        }
//        return nil
//    }
    
}



