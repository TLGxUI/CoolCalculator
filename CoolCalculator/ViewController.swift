//
//  ViewController.swift
//  CoolCalculator
//
//  Created by Tolga DINCEL on 7/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //MARK: - Property
    
    var numberOnScreen:Double = 0
    var previousNumber: Double = 0;
    var performingMath:Bool = false
    var operation = 0
   
    
    //MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    //MARK: - Actions

    
    @IBAction func numbers(_ sender: UIButton){
        
        if performingMath == true {
            
            resultLabel.text = String(sender.tag-1)
            numberOnScreen = Double(resultLabel.text!)!
            performingMath = false
            
        }else {
            
            resultLabel.text = resultLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(resultLabel.text!)!
        }
     
    }
    
    
    @IBAction func operations(_ sender: UIButton){
        
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            operation = sender.tag
            previousNumber = Double(resultLabel.text!)!
            
            switch operation {
            case  12 :                     //Divide
                resultLabel.text = "÷"
            case  13 :                     //Multiply
                resultLabel.text = "x"
            case  14 :                     //Minus
                 resultLabel.text = "-"
            case  15 :                     //Plus
                resultLabel.text = "+"
           
            default:
                break
            }
   
            
            performingMath = true
        }

       
        else if sender.tag == 16{
            switch operation {
            case 12 :
                resultLabel.text = String(previousNumber / numberOnScreen)
                
            case 13 :
                resultLabel.text = String(previousNumber * numberOnScreen)
                
            case 14 :
                resultLabel.text = String(previousNumber - numberOnScreen)
                
            case 15 :
                resultLabel.text = String(previousNumber + numberOnScreen)
                
            default:
                break
            }
          
        }

        else if sender.tag == 11 {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
        }
    }


}

