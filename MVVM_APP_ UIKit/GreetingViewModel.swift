//
//  MainViewModel.swift
//  MVVM_APP_ UIKit
//
//  Created by Евгений Березенцев on 20.01.2022.
//

import Foundation

protocol GreetingViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
    init(person: Person)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {

    let person: Person!
    
    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    required init(person: Person) {
        self.person = person
    }
    
    func showGreeting() {
        greeting = "Hello" + " " + person.name + " " + person.surname
    }
    
}
