//
//  ViewController.swift
//  MVVM_APP_ UIKit
//
//  Created by Евгений Березенцев on 20.01.2022.
//

import UIKit

class GreetingViewController: UIViewController {
    
    var greetingLabel = UILabel()
    
    private var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = self.viewModel.greeting
            }
        }
    }
    
    let setGreetingButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Tim", surname: "Cook")
        viewModel = GreetingViewModel(person: person)
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(setGreetingButton)
        setGreetingButton.setTitle("Set greeting", for: .normal)
        setGreetingButton.backgroundColor = .systemBlue
        setGreetingButton.layer.cornerRadius = 10
        setGreetingButton.layer.shadowRadius = 5
        setGreetingButton.layer.shadowOpacity = 0.5
        setGreetingButton.layer.shadowOffset = .zero
        setGreetingButton.layer.shadowColor = UIColor.black.cgColor
        setGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        setGreetingButton.addTarget(self , action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(greetingLabel)
        greetingLabel.text = "Press the button"
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.textAlignment = .center
    }
    
    func setConstraints() {
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            setGreetingButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            setGreetingButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            setGreetingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            greetingLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            greetingLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            greetingLabel.bottomAnchor.constraint(equalTo: setGreetingButton.topAnchor, constant: -150),
        ])
    }
    
    @objc func buttonTapped() {
        viewModel.showGreeting()
    }
    
    
    
    
    
}

