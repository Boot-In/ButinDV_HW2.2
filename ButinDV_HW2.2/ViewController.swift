//
//  ViewController.swift
//  ButinDV_HW2.2
//
//  Created by Dmitriy Butin on 31.01.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 30
        
        redSlider.value = 0.3
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.value = 0.6
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.value = 0.9
        blueSlider.minimumTrackTintColor = .blue
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(hideKeyboardGesture)
        
        changeColor(r: CGFloat(redSlider.value), g: CGFloat(greenSlider.value), b: CGFloat(blueSlider.value))
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
        setValue()
    }

    @IBAction func redSliderAction() {
        changeColor(r: CGFloat(redSlider.value), g: CGFloat(greenSlider.value), b: CGFloat(blueSlider.value))
    }
    
    @IBAction func greenSliderAction() {
         changeColor(r: CGFloat(redSlider.value), g: CGFloat(greenSlider.value), b: CGFloat(blueSlider.value))
    }
    
    @IBAction func blueSliderAction() {
         changeColor(r: CGFloat(redSlider.value), g: CGFloat(greenSlider.value), b: CGFloat(blueSlider.value))
    }
    
    
    func changeColor (r: CGFloat, g: CGFloat, b: CGFloat) {
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        redValueLabel.text = NSString(format: "%.2f", redSlider.value) as String
        greenValueLabel.text = NSString(format: "%.2f", greenSlider.value) as String
        blueValueLabel.text = NSString(format: "%.2f", blueSlider.value) as String
        
        redTextField.text = NSString(format: "%.2f", redSlider.value) as String
        greenTextField.text = NSString(format: "%.2f", greenSlider.value) as String
        blueTextField.text = NSString(format: "%.2f", blueSlider.value) as String
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        setValue()
        return true
    }
    
    func setValue() {
        if let redInputValue = Float (redTextField.text!), redInputValue <= 1 && redInputValue >= 0 {
            redSlider.value = redInputValue
        } else { error() }
        
        if let greenInputValue = Float (greenTextField.text!), greenInputValue <= 1 && greenInputValue >= 0 {
            greenSlider.value = greenInputValue
        } else { error() }
        
        if let blueInputValue = Float (blueTextField.text!), blueInputValue <= 1 && blueInputValue >= 0 {
            blueSlider.value = blueInputValue
        } else { error() }
        
        changeColor(r: CGFloat(redSlider.value), g: CGFloat(greenSlider.value), b: CGFloat(blueSlider.value))
    }
    
    func error() {
        let alert = UIAlertController(title: "ERROR!", message: "Неверный тип данных", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

