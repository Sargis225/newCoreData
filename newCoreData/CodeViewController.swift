//
//  CodeViewController.swift
//  newCoreData
//
//  Created by Saq on 2/4/21.
//

import UIKit

class CodeViewController: UIViewController {

    @IBOutlet var codeTextField: UITextField!
    
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time()
        code = "\(randomCodeNumberOne ?? 0)\(randomCodeNumberTwo ?? 0)\(randomCodeNumberThird ?? 0)\(randomCodeNumberFordh ?? 0)"
        
        print("code - \(code)")
    }
    var randomCodeNumberOne = (0...10).randomElement()
    var randomCodeNumberTwo = (0...10).randomElement()
    var randomCodeNumberThird = (0...10).randomElement()
    var randomCodeNumberFordh = (0...10).randomElement()
    var code = ""
    var timer = Timer()
    var counter = 30
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if codeTextField.text == code {
            performSegue(withIdentifier: "programIdent", sender: nil)
        }
        else {
            print("error - sxal kod")
        }
    }
    
    
    func time() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        counter -= 1
        if counter < 1 {
            timer.invalidate()
            let alertController = UIAlertController(title: "jamanak@ sparvec", message: "", preferredStyle: .alert)
            let alertActionOne = UIAlertAction(title: "kod pavtorno", style: .default) { [self]action -> Void  in
                code = "\(self.randomCodeNumberOne ?? 0)\(self.randomCodeNumberTwo ?? 0)\(self.randomCodeNumberThird ?? 0)\(self.randomCodeNumberFordh ?? 0)"
                self.counter = 30
                self.time()
                print(code)
            }
            let alertActionTwo = UIAlertAction(title: "back", style: .cancel) { [self]action -> Void in
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(alertActionOne)
            alertController.addAction(alertActionTwo)
            present(alertController, animated: true)
        }
        timerLabel.text = "\(counter)"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
}
