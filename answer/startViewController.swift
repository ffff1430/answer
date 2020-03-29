//
//  startViewController.swift
//  answer
//
//  Created by star on 2020/3/24.
//  Copyright © 2020 star. All rights reserved.
//

import UIKit

class startViewController: UIViewController {

    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var qusLabel: UILabel!
    @IBOutlet var optionButton: [UIButton]!
    
    var i = 0
      var score = 0
      var rightanswer = ""
      
     var qus = [
      Qus(qus: "遇到交通意外，跳車逃生時，應該向前跳還是向後跳比較安全呢？", ans:[ "A.向前跳","B.不要跳","C.向後跳"],answer:"C.向後跳" ),
        Qus(qus: "50個人中，至少有兩個人的生日相同的機率為幾%", ans:[ "A.50%","B.97%","C.84%"],answer:"B.97%" ),
        Qus(qus: "尿液在顯微鏡下是什麼顏色的", ans: ["A.七彩的","B.透明的","C.白色的"],answer:"A.七彩的"),
        Qus(qus: "平均每天眼部肌肉會移動幾次", ans: ["A.1萬次","B.10萬次","C.100萬次"],answer:"B.10萬次" ),
        Qus(qus: "鯊魚平均可以活到幾歲?", ans: ["A.15歲","B.60歲","C.100歲"],answer: "C.100歲"),
        Qus(qus: "胡蘿波最初是什麼顏色", ans: ["A.紅色","B.紫色","C.橘色"], answer: "B.紫色")
      ]
    override func viewDidLoad() {
        super.viewDidLoad()
        qus.shuffle()
        qusLabel.text = qus[i].qus
              rightanswer = qus[i].answer
              qus[i].ans.shuffle()
              for j in 0...2{
              optionButton[j].setTitle(qus[i].ans[j], for: UIControl.State.normal)
              }
    }
    
    @IBAction func choiceButton(_ sender: UIButton) {
        i = i + 1
        if sender.currentTitle == rightanswer{
        score = score + 1
        Score.text = String(score)
        }
        if i == 5{
            let alertController = UIAlertController(
                  title: "遊戲結束",
                  message: "獲得: \(score)分",
                  preferredStyle: .alert)
                  //參數 preferredStyle 傳入 .alert 將顯示中間彈出視窗
                  //利用 UIAlertAction 生成視窗上顯示的按鈕
                  let okButton = UIAlertAction(
                  title: "確定",
                  style: .default
                  )
          alertController.addAction(okButton)
          self.present(alertController, animated: true, completion: nil)
        }
        qusLabel.text = qus[i].qus
        rightanswer = qus[i].answer
        for j in 0...2{
                     optionButton[j].setTitle(qus[i].ans[j], for: UIControl.State.normal)
                     }
      
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
