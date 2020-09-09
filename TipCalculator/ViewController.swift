//  ViewController.swift
//  TipCalculator
//  Created by Pincheng Huang on 2020/9/8.
//  Copyright © 2020 Pincheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 顯示 小費 % (元件 UI Slider 所對應的數值)
    @IBOutlet weak var showTipPercentage: UILabel!
    
    // 顯示 分攤人數 (元件 UI Slider 所對應的數值)
    @IBOutlet weak var showShare: UILabel!
    
    // 讓使用者輸入 餐費
    @IBOutlet weak var AmountTextField: UITextField!
    
    // 顯示 小費金額
    @IBOutlet weak var TipLabel: UILabel!
    
    // 顯示 分攤金額
    @IBOutlet weak var TotalLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    // 點擊鍵盤外的區域，即可收起鍵盤，並執行計算
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
        calculation()
    }

    // 顯示 小費 % 。將元件 UI Slider 所對應的數值，顯示在 元件 UI Label (showTipPercentage) 上，並執行計算
    @IBAction func setTipPercentage(_ sender: UISlider) {
        showTipPercentage.text = "\(Int(sender.value))"
        calculation()
        }
    
    // 顯示 分攤人數。將元件 UI Slider 所對應的數值，顯示在 元件 UI Label (showShare) 上，並執行計算
    @IBAction func setShare(_ sender: UISlider) {
        showShare.text = "\(Int(sender.value))"
        calculation()
            
        }
    
    func calculation() {
        
        let billAmount = Double(AmountTextField.text!) ?? 0 // 為了避免使用者未輸入餐費前 (AmountTextField 無值) 就動到 元件 UI Slider ，而造成 app 閃退，這裡先給一個預設值 (0)
        let tipPercentage = Double(showTipPercentage.text!) ?? 10 // 為了避免使用者未輸入餐費前 (AmountTextField 無值) 就動到 元件 UI Slider ，而造成 app 閃退，這裡先給一個預設值 (10)
        let share = Double(showShare.text!)
            
        // 將上面幾個常數 (billAmount, tipPercentage, share) 都宣告成 浮點數，之後就可以來計算 totalCost (分攤後總金額)
        let totalCost = (billAmount * tipPercentage / 100 + billAmount) / (share!)

        let TipLabelvalue = billAmount * tipPercentage / 100 // 計算小費的公式
    
        TipLabel.text = String(format:"%.2f", TipLabelvalue) // 取小數點兩位後，顯示 小費金額 在 元件 UI Label (TipLabel)
        TotalLabel.text = String(format:"%.2f", totalCost) // 取小數點兩位，顯示 分攤金額 在 元件 UI Label (TotalLabel)
                   
    }
    
}

