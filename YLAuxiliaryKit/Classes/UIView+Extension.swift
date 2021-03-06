//
//  UIView+Extension.swift
//  YLTestCode
//
//  Created by 王留根 on 17/3/28.
//  Copyright © 2017年 ios-mac. All rights reserved.
//

import UIKit


public extension UIView
{
    // 移除所有子控件
    public func removeAllSubViews() -> Void {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    // layer的简单配置
    public func setupLayer(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat = 0, _ masksToBounds: Bool = true) -> Void {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = masksToBounds
    }
    
    
    
}


// MARK: - 四周线条的简便添加


public enum LineViewSide
{
    case none
    // in 内侧
    case inBottom   // 内底(线条在view内的底部)
    case inTop      // 内顶
    case inLeft     // 内左
    case inRight    // 内右
    
    // out 外侧
    case outBottom  // 外底(线条在view外的底部)
    case outTop     // 外顶
    case outLeft    // 外左
    case outRight   // 外右
}



public  extension UIView {
    
    private var top : CGFloat{
        get {
            return self.bounds.origin.y
        }
    }
    
    private var left: CGFloat {
        get {
            return self.bounds.origin.x
        }
    }
    
    private var bottom: CGFloat {
        return self.bounds.origin.y + self.frame.size.height
    }
    
    private var right : CGFloat {
        return self.bounds.origin.x + self.frame.size.width
    }
    /**
     给视图添加线条
     
     - parameter side:      线条在视图的哪侧(内外 + 上下左右)
     - parameter color:     线条颜色
     - parameter thickness: 线条厚度(水平方向为高度，竖直方向为宽度)
     - parameter margin1:   水平方向表示左侧间距，竖直方向表示顶部间距
     - parameter margin2:             右侧间距            底部间距
     */
    public func addLineWithSide(_ side:LineViewSide, color:UIColor, thickness:CGFloat, margin1:CGFloat, margin2:CGFloat) -> Void {
        
        guard side != .none else {
            return
        }
        let lineView = UIView()
        self.addSubview(lineView)
        // 配置
        lineView.backgroundColor = color
        switch side
        {
        // 线条为水平方向
        case .inBottom:
            lineView.frame = CGRect(x: margin1, y: self.bottom - thickness, width: self.right - (margin1 + margin2), height: thickness)
            break
        case .inTop:
            lineView.frame = CGRect(x: margin1, y: self.top, width: self.right - (margin1 + margin2), height: thickness)
            break
        case .outBottom:
            lineView.frame = CGRect(x: margin1, y: self.bottom, width: self.right - (margin1 + margin2), height: thickness)
            break
        case .outTop:
            lineView.frame = CGRect(x: margin1, y: self.top - thickness, width: self.right - (margin1 + margin2), height: thickness)
            break
        case .inLeft:
            lineView.frame = CGRect(x: self.left, y: margin1, width: thickness, height: self.bottom - (margin1 + margin2))
            break
        case .inRight:
            lineView.frame = CGRect(x: self.right - thickness, y: margin1, width: thickness, height: self.bottom - (margin1 + margin2))
            break
        case .outLeft:
            lineView.frame = CGRect(x: self.left - thickness , y: margin1, width: thickness, height: self.bottom - (margin1 + margin2))
            break;
        case .outRight:
            lineView.frame = CGRect(x: self.right, y: margin1, width: thickness, height: self.bottom - (margin1 + margin2))
            break;
        case .none : break
        }
        

    }
    
}
