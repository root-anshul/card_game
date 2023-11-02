//
//  CardSelectionVC.swift
//  card game
//
//  Created by anshul on 03/11/23.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.allvalues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showImage), userInfo: nil, repeats: true)
    }
    
    @objc func showImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
        
    }
    
   
    @IBAction func stop_button(_ sender: UIButton) {
        timer.invalidate()
    }
    
        
    @IBAction func restart_button(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    

}
