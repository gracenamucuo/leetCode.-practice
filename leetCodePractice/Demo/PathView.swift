//
//  PathView.swift
//  Demo
//
//  Created by dyp on 2020/4/20.
//  Copyright © 2020 戴运鹏. All rights reserved.
//

import UIKit

class PathView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addMatrix([[1,4,5,6,10],[7,8,11,22,23],[111,34,66,33,34],[-1,-2,-3,-4,-5]])

//        test1()
    }
    
  

    func test1() {
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 100, y: 10))
        path.addLine(to: CGPoint(x: 100,y: 250))
        path.addLine(to: CGPoint(x: 200, y: 250))
        
        let layer = CAShapeLayer.init()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 3
        layer.frame = self.bounds
        layer.fillColor = UIColor.clear.cgColor
        aniamtion(layer)
        self.layer.addSublayer(layer)
        
    }

    func addMatrix(_ array:[[Int]]){
        guard array.count > 0 else {
            return
        }
        
        let row = array.count
        let column = array.first!.count
        let origin = CGPoint(x: 0, y: 50)
        let w = UIScreen.main.bounds.width / CGFloat(column - 1)
        for r in 0..<row {//行
            //列
            let y = origin.y + w * CGFloat(r)
            for c in 0..<column {//列
                var x = origin.x + CGFloat(c) * w
                if x == UIScreen.main.bounds.size.width {
                    x -= 20
                }
                let dot = UILabel.init(frame: CGRect(x: x, y: y, width: 30, height: 20))
      
                dot.text = String("(") + String(array[r][c])+String(")")
                dot.font = UIFont.systemFont(ofSize: 10)
                dot.backgroundColor = UIColor.red
                dot.sizeToFit()
                self.addSubview(dot)
            }
        }
        
        
        let path = UIBezierPath.init()
        let points = drawPath(array)
        guard points.count > 0 else {
            return
        }
        path.move(to: points.first!)
        for x in 1..<points.count {
            let point = points[x]
            path.addLine(to: point)
            
        }
        
        let layer = CAShapeLayer.init()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.blue.cgColor
        layer.lineWidth = 3
        layer.frame = self.bounds
        layer.fillColor = UIColor.clear.cgColor
        aniamtion(layer)
        self.layer.addSublayer(layer)
        
    }
    
    func aniamtion(_ layer:CALayer){
        let baseAni = CABasicAnimation.init(keyPath: "strokeEnd")
        baseAni.duration = 10
        baseAni.delegate = self as? CAAnimationDelegate
        baseAni.fromValue = NSNumber.init(integerLiteral: 0)
        baseAni.toValue = NSNumber.init(integerLiteral: 1)
        layer.add(baseAni, forKey: "key")
    }
    
    func drawPath(_ array:[[Int]]) -> [CGPoint]{
        guard array.count > 0 else {
            return []
        }
        
        ///行
        let row = array.count
        ///列
        let column = array.first!.count
        
        var result:[Int] = Array()
        var flag:[String] = Array()
        var points:[CGPoint] = Array()
        
        func generateCoordinate(_ x:Int,_ y:Int)-> String{
            return String(x) + "_" + String(y)
        }
        func generateCoordinatePoint(_ x:CGFloat,_ y:CGFloat)->CGPoint{
            return CGPoint(x: x, y: y)
        }
        
        var r = 0
        var c = 0
        let w = UIScreen.main.bounds.width / CGFloat(column - 1)
        let origin = CGPoint(x: 0, y: 50)

        ///顺时针走
        var clockwise = true
        while (r < row && r >= 0) && (c < column && c >= 0) && result.count <= row * column {
            if !flag.contains(generateCoordinate(r, c)) {
                result.append(array[r][c])
                flag.append(generateCoordinate(r, c))
                
                let y = origin.y + w * CGFloat(r)
                let x = origin.x + CGFloat(c) * w
                points.append(CGPoint(x: x, y: y))
            }
            
            if clockwise {///走行
                if (c + 1) < column && !flag.contains(generateCoordinate(r, c + 1)) {
                    c += 1
                }else if (c - 1) >= 0 && !flag.contains(generateCoordinate(r, c - 1)) {
                    c -= 1
                }else{
                    clockwise = false
                }
                
            }
            else{//走列
                if (r - 1) >= 0 && !flag.contains(generateCoordinate(r - 1, c)) {///上
                    r -= 1
                }
                else if (r + 1) < row && !flag.contains(generateCoordinate(r + 1, c)) {//下
                    r += 1
                }else{
                    clockwise = true
                }
            }
            
            ///跳出循环
            if result.count == row * column {
                r = -1
            }
        }
        
        
        return points
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
//        addMatrix([[1,4,5,6],[4,3,5,9],[11,34,66,33]])
    }
    
      func test(){
            
            let aniLayer = CALayer.init()
            let color = UIColor.red.cgColor
            aniLayer.backgroundColor = color
    //        aniLayer.frame = self.bounds
            aniLayer.position = CGPoint(x: 20, y: 10)
            aniLayer.bounds = CGRect(x: 0, y: 0, width: 5, height: 5)
            self.layer.addSublayer(aniLayer)
            
            
            let path = UIBezierPath(rect: CGRect(x: 20, y: 10, width: 100, height: 100))
            path.lineWidth = 10
            UIColor.blue.set()
            UIView.animate(withDuration: 1) {
                 path.stroke()
            }
            
            
            
            let ani = CAKeyframeAnimation.init(keyPath: "position")
            ani.path = path.cgPath
            ani.duration = 3
            ani.beginTime = CACurrentMediaTime() + 1
            aniLayer.add(ani, forKey: "keyFrameAnimation")

            
        }
}
