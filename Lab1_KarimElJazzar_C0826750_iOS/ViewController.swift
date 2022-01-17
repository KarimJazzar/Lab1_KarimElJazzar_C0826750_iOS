//
//  ViewController.swift
//  Lab1_KarimElJazzar_C0826750_iOS
//
//  Created by Karim El Jazzar on 18/01/2022.
//

import UIKit

class ViewController: UIViewController {
    var turn = 0
    var finished = false
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMidButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var midLeftButton: UIButton!
    @IBOutlet weak var midMidButton: UIButton!
    @IBOutlet weak var midRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomMidButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender:UIButton){
        if(finished == false){
            if(sender.isSelected == false){
                if(turn%2==0){
                    sender.setImage(UIImage(named: "cross"), for: .normal)
                    turn = turn + 1
                }else{
                    sender.setImage(UIImage(named: "nought"), for: .normal)
                    turn = turn + 1
                }
            }
        }
        
        sender.isSelected = true
        if(checkWinCross(but1: topLeftButton, but2: topMidButton, but3: topRightButton) || checkWinCross(but1: midLeftButton, but2: midMidButton, but3: midRightButton) || checkWinCross(but1: bottomLeftButton, but2: bottomMidButton, but3: bottomRightButton) || checkWinCross(but1: topLeftButton, but2: midLeftButton, but3: bottomLeftButton) || checkWinCross(but1: topMidButton, but2: midMidButton, but3: bottomMidButton) || checkWinCross(but1: topRightButton, but2: midRightButton, but3: bottomRightButton) || checkWinCross(but1: topLeftButton, but2: midMidButton, but3: bottomRightButton) || checkWinCross(but1: topRightButton, but2: midMidButton, but3: bottomLeftButton)){
            result.text = "Cross is the winner!\nSwipe to start a new game"
            finished = true
        }else if(checkWinNought(but1: topLeftButton, but2: topMidButton, but3: topRightButton) || checkWinNought(but1: midLeftButton, but2: midMidButton, but3: midRightButton) || checkWinNought(but1: bottomLeftButton, but2: bottomMidButton, but3: bottomRightButton) || checkWinNought(but1: topLeftButton, but2: midLeftButton, but3: bottomLeftButton) || checkWinNought(but1: topMidButton, but2: midMidButton, but3: bottomMidButton) || checkWinNought(but1: topRightButton, but2: midRightButton, but3: bottomRightButton) || checkWinNought(but1: topLeftButton, but2: midMidButton, but3: bottomRightButton) || checkWinNought(but1: topRightButton, but2: midMidButton, but3: bottomLeftButton)){

            result.text = "Nought is the winner!"
            finished = true
        }
    }
    
    func checkWinCross(but1:UIButton, but2:UIButton, but3:UIButton) -> Bool{
        if(but1.image(for: .normal) == UIImage(named: "cross") && but2.image(for: .normal) == UIImage(named: "cross") && but3.image(for: .normal) == UIImage(named: "cross")){
            return true
        }
        return false
    }
    
    func checkWinNought(but1:UIButton, but2:UIButton, but3:UIButton) -> Bool{
        if(but1.image(for: .normal) == UIImage(named: "nought") && but2.image(for: .normal) == UIImage(named: "nought") && but3.image(for: .normal) == UIImage(named: "nought")){
            return true
        }
        return false
    }
    
}

