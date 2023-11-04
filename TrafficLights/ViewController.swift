//
//  ViewController.swift
//  TrafficLights
//
//  Created by Phạm Hồng Sơn on 27/10/2023.
//

import UIKit

enum lights{
    case yellow
    case green
    case red
}
class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    
    var timer: Timer?
    
    var light :lights = .green
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius = 40
        
        redView.layer.masksToBounds = true
        yellowView.layer.cornerRadius = 40
        
        yellowView.layer.masksToBounds = true
        greenView.layer.cornerRadius = 40
        
        greenView.layer.masksToBounds = true
        
       updateLight()
        
    }

    func updateLight(){
        redView.backgroundColor = .black
        yellowView.backgroundColor = .black
        greenView.backgroundColor = .black
        switch light{
        case .green: 
            greenView.backgroundColor = .green
            timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeYellow), userInfo: nil, repeats: false)
            
        case .yellow:
            yellowView.backgroundColor = .yellow
            timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeRed), userInfo: nil, repeats: false)
            
        case .red:
            redView.backgroundColor = .red
            timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeGreen), userInfo: nil, repeats: false)
          
        }
        
    }
    
    @objc func changeYellow(){
        light = .yellow
        updateLight()
    }
    @objc func changeRed(){
        light = .red
        updateLight()
    }
    @objc func changeGreen(){
        light = .green
        updateLight()
    }
    
}

