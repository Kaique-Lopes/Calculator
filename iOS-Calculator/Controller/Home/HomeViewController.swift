//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by Kaique Lopes on 23/02/21.
//

import UIKit

final class HomeViewController: UIViewController {
        // MARK: - Outlets
    
        // Result
    @IBOutlet weak var resultLabel: UILabel!
    
        // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
        // Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
        // MARK: - Variables
    private var total: Double = 0
    private var temp: Double = 0
    private var operating: Bool = false
    private var decimal: Bool = false
    private var operation: OperatingType = .none
    
        // MARK: - Constants
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    private enum OperatingType {
        case none
        case addiction
        case subtraction
        case division
        case multiplication
        case percent
    }
    
        // MARK: - Formaters
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    private let printScientficFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
        // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        result()
    }
    
        // MARK: - Buttons Actions
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }
        operating = true
        operation = .percent
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .division
        sender.shine()
    }
    
    @IBAction func operatorMultiplierAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .multiplication
        sender.shine()
    }
    
    @IBAction func operatorSubtractionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .subtraction
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .addiction
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {

        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        print(sender.tag)
        sender.shine()
    }
    
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
        }
    }
    
    private func result() {
        switch operation {
            
        case .none:
            break
            
        case .addiction:
            total = total + temp
            break
            
        case .subtraction:
            total = total - temp
            break
            
        case .division:
            total = total / temp
            break
            
        case .multiplication:
            total = total * temp
            break
            
        case .percent:
            total = total / 100
            total = temp
            break
        }
        
        if total <= kMaxValue || total > kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        print("TOTAL \(total)")
    }
    private func selectVisualOperation() {
        if !operating {
            
        } else {
            switch operation {
            
            case .none, .percent:
                
            case .addiction:
                
            case .subtraction:
                
            case .division:
                
            case .multiplication:
                
            case :
                
            }
        }
    }
}
