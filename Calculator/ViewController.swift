import UIKit

class ViewController: UIViewController {
    
    var currentNum = Double()
    
    var secondNum = Double()
    
    var isFirst = true
    
    var exponent = 1
    
    var operationInProgress = false
    
    var isAlreadyDec = false
    
    var currentOperation = 0
    
    @IBOutlet weak var screen: UILabel!
    @IBAction func number(sender: AnyObject) {

        if operationInProgress == true {
            currentNum = 0
            operationInProgress = false
        }
        
        if isAlreadyDec{
            currentNum = currentNum + Double( sender.tag) / pow(10, Double(exponent))
            exponent += 1
            screen.text = String(currentNum)
        }
        else {
            currentNum = currentNum * 10 + Double( sender.tag)
            
            switch String (currentNum) {
            
            case let word where word.hasSuffix(".0"):
                screen.text = String(Int(currentNum))
            
            default:
                screen.text = String(currentNum)
            }
        }
    }
    
    @IBAction func operations(sender: AnyObject) {
 
        
        if operationInProgress == false && isFirst == true {
            switch currentOperation {
            case 111:
                currentNum = secondNum + currentNum
                
            case 222:
                currentNum = secondNum - currentNum
                
            case 333:
                currentNum = secondNum * currentNum
            
            case 444:
                currentNum = secondNum / currentNum

            default: print("default")
                
            }
        }
        currentOperation = sender.tag
        
        secondNum = currentNum
        
        switch String (currentNum) {
        case let word where word.hasSuffix(".0"):
            screen.text = String(Int(currentNum))
        default:
            screen.text = String(currentNum)
        }
        isFirst = true
        
        operationInProgress = true
        
        isAlreadyDec = false
        
        exponent = 1
        
    }
    
    @IBAction func clear(sender: AnyObject) {
        isAlreadyDec = false
        
        currentNum = 0
        
        secondNum = 0
        
        screen.text = "0"
        
        isFirst = true
        
        operationInProgress = true
        
        currentOperation = 0
        
        exponent = 1
        
    }
    @IBAction func decimal(sender: AnyObject) {
        
        if isAlreadyDec == false {
        
            screen.text = screen.text! + "."
            
            isAlreadyDec = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

