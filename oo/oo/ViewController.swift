//
//  ViewController.swift
//  oo
//
//  Created by Varun Kumar on 02/07/18.
//  Copyright © 2018 Varun Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

   var rotView = UIView()
    
         var panGesture: UIPanGestureRecognizer?
         var deltaAngle: Float = 0.0
         var startTransform: CGAffineTransform?
         var prevPoint = CGPoint.zero
    
      override func viewDidLoad() {
            rotView = UIView(frame: CGRect(x: -100, y: 50, width: 250, height: 260))
            rotView.backgroundColor = UIColor.blue
            self.view.addSubview(rotView)
            super.viewDidLoad()
            panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.rotateItem(_:)))
        panGesture?.delegate = self as? UIGestureRecognizerDelegate
            if let aGesture = panGesture {
                rotView.addGestureRecognizer(aGesture)
            }
        }
        
        @objc func rotateItem(_ recognizer: UIPanGestureRecognizer?) {
            let currPoint: CGPoint? = recognizer?.location(in: view)
            let center: CGPoint? = recognizer?.view?.center
            let ang: CGFloat = CGFloat(atan2f(Float((currPoint?.y ?? 0.0) - (center?.y ?? 0.0)), Float((currPoint?.x ?? 0.0) - (center?.x ?? 0.0))) - atan2f(Float(prevPoint.y - (center?.y ?? 0.0)), Float(prevPoint.x - (center?.x ?? 0.0))))
            prevPoint = recognizer?.location(in: view) ?? CGPoint.zero
            deltaAngle += Float(ang)
            rotView.transform = CGAffineTransform.init(rotationAngle: CGFloat(deltaAngle))
        }
        
        func gestureRecognizerShouldBegin(_ recognizer: UIGestureRecognizer) -> Bool {
            startTransform = rotView.transform
            return true
        }
    }




