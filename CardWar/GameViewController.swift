//
//  GameViewController.swift
//  CardWar
//
//  Created by Abderrahmane Mokrani on 16/10/2020.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var leftCardView: UIImageView!
    
    @IBOutlet weak var rightCardView: UIImageView!

    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    private var playerScore = 0
    private var cpuScore = 0
    
    private let maxScore = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dealButtonClicked() {
        let leftCardNumber = Int.random(in: 2...14)
        let rightCardNumber = Int.random(in: 2...14)
        
        leftCardView.image = UIImage(named: "card\(leftCardNumber)")
        rightCardView.image = UIImage(named: "card\(rightCardNumber)")
        
        if leftCardNumber > rightCardNumber {
            playerScore += leftCardNumber - rightCardNumber
        }
        
        if rightCardNumber > leftCardNumber {
            cpuScore += rightCardNumber - leftCardNumber
        }
        
        playerScoreLabel.text = "\(playerScore)"
        cpuScoreLabel.text = "\(cpuScore)"
        
        if playerScore >= maxScore {
            let alert = UIAlertController(title: "Congratulations!", message: "🎉 We have a winner! 🎉", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        
        if cpuScore >= maxScore {
            let alert = UIAlertController(title: "Game Over!", message: "Try again! 😵", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func closeButtonClicked() {
        let alert = UIAlertController(title: "Giving up!", message: "You don't feel up to it 😓?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I'll do it 👊", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Not today 🥱", style: .destructive, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }

}
