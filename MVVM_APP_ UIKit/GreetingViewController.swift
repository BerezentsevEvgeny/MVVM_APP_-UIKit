//
//  ViewController.swift
//  MVVM_APP_ UIKit
//
//  Created by Евгений Березенцев on 20.01.2022.
//

import UIKit

class GreetingViewController: UIViewController {
    
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = self.viewModel.greeting
            }
        }
    }
    
    let greetingLabel = UILabel()
    let setGreetingButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGreetingButton.addTarget(viewModel, action: Selector(("showGreeting")), for: .touchUpInside)
    }
    
    
    
    
    
}

