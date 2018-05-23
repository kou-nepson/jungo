//
//  ViewController.swift
//  jungo
//
//  Created by 杉山航 on 2018/05/06.
//  Copyright © 2018年 杉山航. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turn_count: [Int] = [1,1]
    var masuArray: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var uk_cont: [Int] = [0,0,0,0,0]
    var ok_count: [Int] = [0,0,0,0,0]
    var n: Int = 0
    var m: Int = 0
    var j: Int = 0
    var k: Int = 0
    @IBOutlet var okcountlabel: [UILabel]!
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
        if turn_count[0] > 5 {
            turn_count[0] = 1
            turn_count[1] += 1
        }
        self.koma_get(tag: Int(sender as! NSNumber))
        //先手ターンの判定条件
        if (turn_count[0] + turn_count[1]) % 2 == 0{
            ok_count[turn_count[0]-1] += 1
            okcountlabel[turn_count[0]-1].text = String(ok_count[turn_count[0]-1])
        }
        //後手ターンの判定条件
        if (turn_count[0] + turn_count[1]) % 2 == 1{
            uk_cont[turn_count[0]-1] += 1
            ukcountlabel[turn_count[0]-1].text = String(uk_cont[turn_count[0]-1])
        }
        self.hantei(sender: sender.tag)
        if masuArray[sender.tag] == 0 {
            masuArray[sender.tag] = turn_count[0]
            hyouji_koma[sender.tag].text = String(turn_count[0])
            turn_count[0] += 1
        }
        
        
        Swift.print("\nturn_count\(turn_count)\nマスの状態\(masuArray[sender.tag])\nsendertag\(sender.tag)")
    }
    
    func  hantei(sender: Int){
        if sender > 12{
            if masuArray[sender] == masuArray[sender-10] && masuArray[sender-5] != turn_count[0] {
                Swift.print("とりまいふ分通った！")
                masuArray[sender-5] = 0
                hyouji_koma[sender-5].text = ""
                self.komapoint()
            }
        }
        if sender < 12 {
            if masuArray[sender] == masuArray[sender+10] && masuArray[sender+5] != turn_count[0]{
                Swift.print("とりまいふ分通った！")
                masuArray[sender+5] = 0
                hyouji_koma[sender+5].text = ""
                self.komapoint()
            }
        }
        
        
        
    }
    
    func komapoint(){
        
        //先手が差したコマかどうかを見分ける式
        if (turn_count[0] + turn_count[1]) % 2 == 0{
            ok_count[turn_count[0]-1] += 1
            okcountlabel[turn_count[0]-1].text = String(ok_count[turn_count[0]-1])
        }
        //後手が刺したコマかどうかを見分ける式
        if (turn_count[0] + turn_count[1]) % 2 == 1{
            uk_cont[turn_count[0]-1] += 1
            ukcountlabel[turn_count[0]-1].text = String(uk_cont[turn_count[0]-1])
        }
    }
    
    func koma_get(tag: Int) {
        //盤上の駒の横
        m = tag % 5
        //盤上の駒の縦
        n = (tag - m)/5
        //左しか取れないコード
        for i in 0...m{
            if masuArray[tag-i] != 0{
                if masuArray[tag-i] == turn_count[0]{
                    for k in 1...j-1{
                        hyouji_koma[tag-k].text = ""
                        
                    }
                }
            }
            
            j += 1
        }
        
    }
}

