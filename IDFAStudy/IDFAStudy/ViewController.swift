//
//  ViewController.swift
//  AdSDKStudy
//
//  Created by 황은지 on 2023/01/29.
//

import UIKit
import AppTrackingTransparency

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestTrackingAuthorization()
    }
    
    func requestTrackingAuthorization() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization { (status) in
                    switch status {
                    case .notDetermined:
                        print("notDetermined") // 결정되지 않음
                    case .restricted:
                        print("restricted") // 제한됨
                    case .denied:
                        print("denied") // 거부됨
                    case .authorized:
                        print("authorized") // 허용됨
                    @unknown default:
                        print("error") // 알려지지 않음
                    }
                }
            }
        }
    }
}

