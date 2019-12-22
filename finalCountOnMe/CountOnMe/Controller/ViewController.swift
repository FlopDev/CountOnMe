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
        // Do any additional setup after loading the view.
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
        calculator.addNumber(numberTapped: numberText) // on envoi au calculator le nombre qui a été tappe pour l'ajouter au calcul
        updateDisplay() // on vient récupérer le texte a afficher dans notre textview

        textView.text.append(numberText)
    }
    
    
    func updateDisplay() {
        textView.text = calculator.getTextToDisplay()
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorTapped = sender.title(for: .normal) else {
            return
        }
        
        
            calculator.addOperator(operatorTapped: operatorTapped)
             updateDisplay()
       
        
        
           // if textView.text.contains("=") {
               // calculator.operation.append(elements.last!)
            
             // MARK: - TO DO : Bouger ca dans le model
           //  if calculator.operation.count == 1 {
            //    textView.text = "\(calculator.operation[0]) \(operatorTapped) "
                
               // calculator.operation = elements
           // } else {
              //  textView.text.append(" \(operatorTapped) ")
              //  calculator.operation = elements
          //  }
        //} else {
           // alert(title: "Zero", message: "Un operateur est deja mis !")
       // }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard let total = calculator.calculate() else {
            // le calculate ma retouner nil je dois afficher une erreur
            return
        }

        // je display le total dans mon textview
        
      //  guard calculator.expressionIsCorrect else {
         //   return alert(title: "Zero", message: "Entrez une expression correcte")
       // }
        if textView.text.contains("=") {
            return alert(title: "Nouveau Calcul", message: "Veuillez démarrer un nouveau calcul")
        }
        // calculator.operation = elements

       // calculator.operation.removeAll()
        
        textView.text.append(" = \(total)")
    }
}

