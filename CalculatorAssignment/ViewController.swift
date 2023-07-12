//
//  ViewController.swift
//  CalculatorAssignment
//
//  Created by Terry Jason on 2023/7/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOneField: UITextField!
    
    @IBOutlet weak var numberTwoField: UITextField!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    // 針對每個按鍵做相應處理
    @IBAction func plusButton(_ sender: Any) {
        solveInput(symbol: "+", oneFieldText: numberOneField.text, twoFieldText: numberTwoField.text)
    }
    
    @IBAction func minusButton(_ sender: Any) {
        solveInput(symbol: "-", oneFieldText: numberOneField.text, twoFieldText: numberTwoField.text)
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        solveInput(symbol: "*", oneFieldText: numberOneField.text, twoFieldText: numberTwoField.text)
    }
    
    @IBAction func dividedButton(_ sender: Any) {
        solveInput(symbol: "/", oneFieldText: numberOneField.text, twoFieldText: numberTwoField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 處理用戶輸入的值
    func solveInput(symbol: String, oneFieldText: String?, twoFieldText: String?) {
        let stringOne = checkNil(text: oneFieldText)
        let stringTwo = checkNil(text: twoFieldText)
        
        solveString(symbol: symbol, textOne: stringOne, textTwo: stringTwo)
    }
    
    // 解封包，確認 textField.text 不是空值 nil
    func checkNil(text: String?) -> String {
        if let text = text {
            return text
        } else {
            return ""
        }
    }
    
    // 將 String 丟到處理 Int 的函式
    func solveString(symbol: String, textOne: String, textTwo: String) {
        turnToInt(symbol: symbol, stringNumOne: textOne, stringNumTwo: textTwo)
    }
    
    // 將 String 轉換為 Int，並進入下一階段處理
    func turnToInt(symbol: String, stringNumOne: String, stringNumTwo: String) {
        if let numberOne = Int(stringNumOne), let numberTwo = Int(stringNumTwo) {
            calculate(symbol: symbol, num1: numberOne, num2: numberTwo)
        } else {
            errorDisplay(text1: stringNumOne, text2: stringNumTwo)
        }
    }
    
    // 計算結果與顯示
    func calculate(symbol: String, num1: Int, num2: Int) {
        if  symbol == "+" {
            sumLabel.text = String(num1 + num2)
        } else if symbol == "-" {
            sumLabel.text = String(num1 - num2)
        } else if symbol == "*" {
            sumLabel.text = String(num1 * num2)
        } else {
            sumLabel.text = String(num1 / num2)
        }
    }
    
    // 處理錯誤結果顯示
    func errorDisplay(text1: String, text2: String) {
        if text1 == "" && text2 == "" {
            sumLabel.text = "請在空格內輸入數字"
        } else if text1 != "" && text2 != "" {
            sumLabel.text = "請輸入有效的數字"
        } else {
            oneFieldEmpty(fieldOne: text1, fieldTwo: text2)
        }
    }
    
    // 處理只輸入一格的情況
    func oneFieldEmpty(fieldOne: String, fieldTwo: String) {
        if convertString(string: fieldOne) || convertString(string: fieldTwo) {
            sumLabel.text = "請填寫完全部空格"
        } else {
            sumLabel.text = "請輸入有效數字，且需填寫完全部空格"
        }
    }
    
    // 檢查單個 String 是否能轉換為 Int
    func convertString(string: String) -> Bool {
        if Int(string) != nil {
            return true
        } else {
            return false
        }
    }
    
}

