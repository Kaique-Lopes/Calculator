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
    }


}
