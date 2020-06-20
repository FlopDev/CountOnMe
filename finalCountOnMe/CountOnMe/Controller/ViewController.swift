//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

/** ViewController of the app, it takes the data to the view, send it to the model, and then get back the data of the model, to send it to the view */
class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let calculator = Calculator()

    // MARK: - IBOutlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - View Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    /** This fonction display the text to the user */
    func updateDisplay() {
        textView.text = calculator.getTextToDisplay()
    }
    
    /** This function create an alert
     - parameter title: a string with the title of the alert
     - parameter message:  a string who give more information about the alert
     */
    func alert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    
    /** the title of the button (his value) is send in numberText. Then we add the number in the calculator, and we update the display for the user.
    - parameter button: the number button that the user pressed
    */
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        calculator.addNumber(numberTapped: numberText)
        updateDisplay()
    }
    
    /** we take the title of the button (his value), and we put it in operatorTapped. Then we check if we can add and operator. If yes, the operator is add in the calculator, and we update the display for the user. If we can not add operator, we present alert to the user.
    - parameter button: the operator button that the user pressed
    */
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
    
    /** This function is call when you press equal button, we check if the expression is correct, and if yes we calculate, and update display. If expression isn't correct, we show an alert to the user.
    - parameter button: the equal button that the user press
    */
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        if calculator.expressionIsCorrect {
            calculator.calculate()
            updateDisplay()
        } else {
            alert(title: "Erreur", message: "Entrez une expression correcte")
        }
    }
    
    /** This function is call when you press AC button, we clear all the data in calculator, and we update display.
    - parameter button: the AC button that the user press
    */
    @IBAction func clearButton(_ sender: Any) {
        calculator.clearAll()
        updateDisplay()
    }
}

