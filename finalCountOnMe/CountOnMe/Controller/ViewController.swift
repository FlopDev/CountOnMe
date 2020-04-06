//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calculator = Calculator()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.accessibilityIdentifier = "resultLabel"
    }
    
    func updateDisplay() {
        textView.text = calculator.getTextToDisplay()
    }
    
    func alert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        calculator.addNumber(numberTapped: numberText)
        updateDisplay()
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorTapped = sender.title(for: .normal) else {
            return
        }
        
        if calculator.canAddOperator {
            calculator.addOperator(operatorTapped: operatorTapped)
            updateDisplay()
        } else {
            alert(title: "Erreur", message: "Un operateur est deja mis !")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        if calculator.expressionIsCorrect {
            calculator.calculate()
            updateDisplay()
        } else {
            alert(title: "Erreur", message: "Entrez une expression correcte")
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        calculator.clearAll()
        updateDisplay()
    }
}

