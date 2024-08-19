//
//  ViewController.swift
//  calculator-basic-v.2
//
//  Created by Mac User on 8/19/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputDisplay: UILabel!
    @IBOutlet weak var outputDisplay: UILabel!
    
    var recorded = ""
    var currFunc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnNumber(_ sender: Any) {
        let btnNum: UIButton = sender as! UIButton
        let num = (btnNum.titleLabel?.text)!
        
        inputDisplay.text = inputDisplay.text! + num
    }
    
    
    @IBAction func btnFunctions(_ sender: Any) {
        let btnFunc: UIButton = sender as! UIButton
        let mFunc = (btnFunc.titleLabel?.text)!
        var inputVal = 0.0
        var result = 0.0
        
        if ((inputDisplay.text!).contains(recorded)){
            var str = (inputDisplay.text!).index((inputDisplay.text!).startIndex, offsetBy: recorded.count)
            var convert = (inputDisplay.text!).suffix(from: str)
            inputVal = Double(convert)!
        } else {
            inputVal = Double(inputDisplay.text!)!
        }
        
        if (outputDisplay.text != "") {
            result = Double(outputDisplay.text!)!
        }
        
        inputDisplay.text = inputDisplay.text! + mFunc
        
        if (outputDisplay.text == ""){
            result = inputVal
        } else {
            switch (mFunc) {
            case "+":
                result = result + inputVal
                break
            case "-":
                result = result - inputVal
                break
            case "/":
                result = result / inputVal
                break
            case "*":
                result = result * inputVal
                break
            case "=":
                
                break
            default:
                break
            }
        }
        
        recorded = inputDisplay.text!
        outputDisplay.text = String(result)
    }
    
    @IBAction func btnBackspace(_ sender: Any) {
        if (inputDisplay.text == "0.") {
            inputDisplay.text = ""
        } else if (inputDisplay.text != "") {
            inputDisplay.text?.removeLast()
        }
        
    }
    
    @IBAction func btnClearInput(_ sender: Any) {
        inputDisplay.text = ""
    }
    
    @IBAction func btnPeriod(_ sender: Any) {
        if (inputDisplay.text == "") {
            inputDisplay.text = "0."
        } else if ((inputDisplay.text!).contains(".")) {
            return
        } else {
            inputDisplay.text = inputDisplay.text! + "."
        }
    }
    
    
}

