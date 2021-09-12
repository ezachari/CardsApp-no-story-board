//
//  CardSelectionVC.swift
//  CardsApp_prog
//
//  Created by Юрий Ни on 12.09.2021.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView = UIImageView()
    let stopB   = CAButton(bgColor: .systemRed, title: "Stop!")
    let resetB  = CAButton(bgColor: .systemGreen, title: "Restart")
    let rulesB  = CAButton(bgColor: .systemBlue, title: "Rules")
    var timer: Timer!
    var images = Deck.allCards
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        updateRandomImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRuleButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = images[Int(arc4random_uniform(UInt32(images.count)))]
        cardImageView.layer.borderWidth = 3
        cardImageView.layer.cornerRadius = 8
        cardImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopB)
        stopB.addTarget(self, action: #selector(stopRandomGeneration), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopB.widthAnchor.constraint(equalToConstant: 250),
            stopB.heightAnchor.constraint(equalToConstant: 50),
            stopB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopB.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetB)
        resetB.addTarget(self, action: #selector(restartRandomGeneration), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetB.widthAnchor.constraint(equalToConstant: 115),
            resetB.heightAnchor.constraint(equalToConstant: 50),
            resetB.leadingAnchor.constraint(equalTo: stopB.leadingAnchor),
            resetB.topAnchor.constraint(equalTo: stopB.bottomAnchor, constant: 20)
        ])
    }
    
    
    func configureRuleButton() {
        view.addSubview(rulesB)
        rulesB.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesB.widthAnchor.constraint(equalToConstant: 115),
            rulesB.heightAnchor.constraint(equalToConstant: 50),
            rulesB.trailingAnchor.constraint(equalTo: stopB.trailingAnchor),
            rulesB.topAnchor.constraint(equalTo: stopB.bottomAnchor, constant: 20)
        ])
    }
    
    
    func updateRandomImage() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateImageView), userInfo: nil, repeats: true)
    }

    
    @objc func updateImageView() {
        cardImageView.image = images[Int(arc4random_uniform(UInt32(images.count)))]
    }
    
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
    @objc func stopRandomGeneration() {
        timer.invalidate()
    }
    
    @objc func restartRandomGeneration() {
        timer.invalidate()
        updateRandomImage()
    }
}
