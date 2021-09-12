//
//  RulesVC.swift
//  CardsApp_prog
//
//  Created by Юрий Ни on 12.09.2021.
//

import UIKit

class RulesVC: UIViewController {

    let titleLable = UILabel()
    let rulesLabel = UILabel()
    let exLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExLabel()
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "Rules"
        titleLable.font = .systemFont(ofSize: 40, weight: .bold)
        titleLable.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExLabel() {
        view.addSubview(exLabel)
        exLabel.translatesAutoresizingMaskIntoConstraints = false
        exLabel.text = "♠️ = Push-ups\n\n♥️ = Sit-ups\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
        exLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 75),
            exLabel.widthAnchor.constraint(equalToConstant: 200),
            exLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
