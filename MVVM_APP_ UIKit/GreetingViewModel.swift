//
//  MainViewModel.swift
//  MVVM_APP_ UIKit
//
//  Created by Евгений Березенцев on 20.01.2022.
//

//import Foundation

protocol GreetingViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)? { get set }
    var person: Person { get }
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    var person: Person {
        Person(name: "Tim", surname: "Cook")
    }
    

    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    
    func showGreeting() {
        greeting = "Hello" + " " + person.name + " " + person.surname
    }
    
}
