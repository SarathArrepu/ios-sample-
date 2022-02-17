//
//  ViewController.swift
//  Arrepu_calculator
//
//  Created by Arrepu,Sarath on 2/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var operandOne = ""
    var operandTwo = ""
    var operation = ""
    var operatorChanged = false
    var currentNumber2 = ""
    var multipleOperators = false
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ACButton(_ sender: Any) {
        operandTwo = ""
                operandOne = ""
                operatorChanged = false
                operation = ""
                currentNumber2 = ""
                displayLabel.text = "0"
                multipleOperators=false
                
    }
   
    @IBAction func CButton(_ sender: Any) {
        operandTwo = ""
        displayLabel.text = ""
    }
    @IBAction func AbbSubButton(_ sender: Any) {
        if operandOne != "" {
                   
                   displayLabel.text = "-" + displayLabel.text!
                   operandOne = "\(displayLabel.text!)"
               }
               else{
                   displayLabel.text = "-" + displayLabel.text!
                   operandTwo = "\(displayLabel.text!)"
               }
    }
    @IBAction func DivButton(_ sender: Any) {
        let value = calTemp(operation)
                operation = "/"
                displayLabel.text = (value != "") ? resultFormatter(value) : ""
                if value != "" {
                    if operandTwo != ""{
                        multipleOperators = true
                        if operatorChanged {
                            result = String(Double(value)! / Double(operandTwo)!)
                            if result == "inf"{
                                displayLabel.text! = "Error"
                            }else{
                                displayLabel.text! = resultFormatter(result)
                            }
                        }
                    }
                }
                operatorChanged = true
    }
    @IBAction func MulButton(_ sender: Any) {
        let temp = calTemp(operation)
               operation = "*"
               currentNumber2=""
               displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
               operatorChanged=true
               displayLabel.text = ""
    }
    @IBAction func SubButton(_ sender: Any) {
        let temp = calTemp(operation)
                operation = "-"
                displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                if temp != "" {
                            if operandTwo != ""{
                        multipleOperators = true
                        currentNumber2 = operandTwo;
                        if operatorChanged {
                            result = String(Double(temp)! - Double(operandTwo)!)
                            displayLabel.text! = resultFormatter(result)
                        }
                    }
                }
                operatorChanged = true
    }
   
    @IBAction func AddButton(_ sender: Any) {
        let temp = calTemp(operation)
                operation = "+"
                currentNumber2=""
                displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                operatorChanged=true
                displayLabel.text = ""
    }
    
    @IBAction func EqualButton(_ sender: Any) {
        var res = ""
                switch operation {
                case "+":
                    
                    if currentNumber2 != "" {
                        res = String(Double(operandOne)! + Double(currentNumber2)!)
                        displayLabel.text = resultFormatter(res)
                         operandTwo = currentNumber2
                    }else{
                        res = String(Double(operandOne)! + Double(operandTwo)!)
                        displayLabel.text = resultFormatter(res)
                    }
                    operandOne = res
                    
                    break
                case "*":
                    if currentNumber2 != "" {
                        res = String(Double(operandOne)! * Double(currentNumber2)!)
                        displayLabel.text = resultFormatter(res)
                    }else{
                        res = String(Double(operandOne)! * Double(operandTwo)!)
                        displayLabel.text = resultFormatter(res)
                    }
                    operandOne = res
                    
                    break
                case "-":
                    if currentNumber2 != "" {
                        res = String(Double(operandOne)! - Double(currentNumber2)!)
                        displayLabel.text = resultFormatter(res)
                        //                number2 = ""
                    }else{
                        res = String(Double(operandOne)! - Double(operandTwo)!)
                        displayLabel.text = resultFormatter(res)
                    }
                    operandOne = res
                    break
                case "/":
                    if displayLabel.text == "Error"{
                        operandTwo = ""
                        operandOne = ""
                        operatorChanged = false
                        operation = ""
                        currentNumber2 = ""
                        displayLabel.text = "0"
                        multipleOperators=false
                    }else{
                        if currentNumber2 != "" {
                            res = String(Double(operandOne)! / Double(currentNumber2)!)
                            if res == "inf"{
                                displayLabel.text! = "Error"
                                return
                            }else{
                                displayLabel.text = resultFormatter(res)
                            }
                        }else{
                            res = String(Double(operandOne)! / Double(operandTwo)!)
                            if res == "inf"{
                                displayLabel.text! = "Error"
                                return
                            }else{
                                displayLabel.text = resultFormatter(res)
                            }
                        }
                        operandOne = res
                    }
                    break
                default:
                    print("Nothing")
                }
                
    }
    @IBAction func RootButton(_ sender: Any) {
        if displayLabel.text == "" || displayLabel.text == "0"{
                    return
                }
                let squareRoot = displayLabel.text
                displayLabel.text = resultFormatter(String(Double(squareRoot!)!.squareRoot()))
                operandOne = displayLabel.text!
                operandTwo = ""
    }
    @IBAction func PointButton(_ sender: Any) {
        let number = "."
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func ZeroButton(_ sender: Any) {
        let number = "0"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                  
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func OneButton(_ sender: Any) {
        let number = "1"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                   
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func TwoButton(_ sender: Any) {
        let number = "2"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                   
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func ThreeButton(_ sender: Any) {
        let number = "3"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func FourButton(_ sender: Any) {
        let number = "4"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
               
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func FiveButton(_ sender: Any) {
        let number = "5"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                  
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func SixButton(_ sender: Any) {
        let number = "6"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func SevenButton(_ sender: Any) {
        let number = "7"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                  
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func EightButton(_ sender: Any) {
        let number = "8"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
                
    }
    @IBAction func NineButton(_ sender: Any) {
        let number = "9"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    func calTemp(_ operation:String)->String {
            if operandOne != "" && operandTwo != ""{
                if operation == "+"{
                    operandOne = String(Double(operandOne)! + Double(operandTwo)!)
                    currentNumber2 = operandTwo
                    operandTwo = ""
                    return String(operandOne)
                }
                if operation == "-"{
                    operandOne = String(Double(operandOne)! - Double(operandTwo)!)
                    currentNumber2 = operandTwo
                    operandTwo = ""
                    return String(operandOne)
                }
                if operation == "*"{
                    operandOne = String(Double(operandOne)! * Double(operandTwo)!)
                    currentNumber2 = operandTwo
                    operandTwo = ""
                    return String(operandOne)
                }
                if operation == "/"{
                    operandOne = String(Double(operandOne)! / Double(operandTwo)!)
                    currentNumber2 = operandTwo
                    operandTwo = ""
                    return String(operandOne)
                }
            }
            return ""
        }
    func resultFormatter(_ result:String)->String {
            let value = Double(result)!
            var resultStr = String(round(value * 100000) / 100000.0)
            
            if resultStr.contains(".0"){
                resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
            }
            
            return resultStr
        }
    


}


