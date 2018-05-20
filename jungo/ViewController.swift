//
//  ViewController.swift
//  jungo
//
//  Created by 杉山航 on 2018/05/06.
//  Copyright © 2018年 杉山航. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turn_count: Int = 1
    var masuArray: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var uk_cont: [Int] = [0,0,0,0,0]
    @IBOutlet var hyouji_koma: [UILabel]!
    @IBOutlet var ukcountlabel: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func masu(sender: AnyObject) {
        if turn_count > 5 {
            turn_count = 1
        }
        self.hantei(sender: sender.tag)
        if masuArray[sender.tag] == 0 {
            masuArray[sender.tag] = turn_count
            hyouji_koma[sender.tag].text = String(turn_count)
            turn_count += 1
        }
        
        
        Swift.print("\nturn_count\(turn_count)\nマスの状態\(masuArray[sender.tag])\nsendertag\(sender.tag)")
    }
    
    func  hantei(sender: Int){
        if sender > 7{
            if masuArray[sender] == masuArray[sender-8] && masuArray[sender-5] != turn_count {
                masuArray[sender-5] = 0
                hyouji_koma[sender-5].text = ""
                uk_cont[turn_count-1] += 1
                ukcountlabel[turn_count-1].text = String(uk_cont[turn_count-1])
                
            }
        }
        if sender < 7 {
            if masuArray[sender] == masuArray[sender+8] && masuArray[sender+5] != turn_count{
                masuArray[sender+5] = 0
                hyouji_koma[sender+5].text = ""
            }
        }
        
        
        
    }
    
}

