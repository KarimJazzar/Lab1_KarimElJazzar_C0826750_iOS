//
//  ViewController.swift
//  Lab1_KarimElJazzar_C0826750_iOS
//
//  Created by Karim El Jazzar on 18/01/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var turn = 0
    var finished = false
    var noughtScore = 0
    var crossScore = 0
    var crossFirst = true
    var selectedButton: UIButton!
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var scores:[GameScores]?
    var states:[GameState]?
    
    var tL = ""
    var tM = ""
    var tR = ""
    var mL = ""
    var mM = ""
    var mR = ""
    var bL = ""
    var bM = ""
    var bR = ""
    
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
    @IBOutlet weak var crossS: UILabel!
    @IBOutlet weak var noughtS: UILabel!
    @IBOutlet weak var alert: UILabel!
    
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        view.addGestureRecognizer(swipe)
        
        buttons.append(topLeftButton)
        buttons.append(topMidButton)
        buttons.append(topRightButton)
        buttons.append(midLeftButton)
        buttons.append(midMidButton)
        buttons.append(midRightButton)
        buttons.append(bottomLeftButton)
        buttons.append(bottomMidButton)
        buttons.append(bottomRightButton)
        
        fetchGameScores()
        fetchGameState()
        //deleteGameScores()
        //deleteGameStates()
        crossS.text = "Cross (Player 1): \(crossScore)"
        noughtS.text = "Nought (Player 2): \(noughtScore)"
        
        if(tL == "cross"){
            topLeftButton.setImage(UIImage(named: "cross"), for: .normal)
            topLeftButton.isSelected = true
        }else if(tL == "nought"){
            topLeftButton.setImage(UIImage(named: "nought"), for: .normal)
            topLeftButton.isSelected = true
        }
        
        if(tM == "cross"){
            topMidButton.setImage(UIImage(named: "cross"), for: .normal)
            topMidButton.isSelected = true
        }else if(tM == "nought"){
            topMidButton.setImage(UIImage(named: "nought"), for: .normal)
            topMidButton.isSelected = true
        }
        
        if(tR == "cross"){
            topRightButton.setImage(UIImage(named: "cross"), for: .normal)
            topRightButton.isSelected = true
        }else if(tR == "nought"){
            topRightButton.setImage(UIImage(named: "nought"), for: .normal)
            topRightButton.isSelected = true
        }
        
        if(mL == "cross"){
            midLeftButton.setImage(UIImage(named: "cross"), for: .normal)
            midLeftButton.isSelected = true
        }else if(mL == "nought"){
            midLeftButton.setImage(UIImage(named: "nought"), for: .normal)
            midLeftButton.isSelected = true
        }
        
        if(mM == "cross"){
            midMidButton.setImage(UIImage(named: "cross"), for: .normal)
            midMidButton.isSelected = true
        }else if(mM == "nought"){
            midMidButton.setImage(UIImage(named: "nought"), for: .normal)
            midMidButton.isSelected = true
        }
        
        if(mR == "cross"){
            midRightButton.setImage(UIImage(named: "cross"), for: .normal)
            midRightButton.isSelected = true
        }else if(mR == "nought"){
            midRightButton.setImage(UIImage(named: "nought"), for: .normal)
            midRightButton.isSelected = true
        }
        
        if(bL == "cross"){
            bottomLeftButton.setImage(UIImage(named: "cross"), for: .normal)
            bottomLeftButton.isSelected = true
        }else if(bL == "nought"){
            bottomLeftButton.setImage(UIImage(named: "nought"), for: .normal)
            bottomLeftButton.isSelected = true
        }
        
        if(bM == "cross"){
            bottomMidButton.setImage(UIImage(named: "cross"), for: .normal)
            bottomMidButton.isSelected = true
        }else if(bM == "nought"){
            bottomMidButton.setImage(UIImage(named: "nought"), for: .normal)
            bottomMidButton.isSelected = true
        }
        
        if(bR == "cross"){
            bottomRightButton.setImage(UIImage(named: "cross"), for: .normal)
            bottomRightButton.isSelected = true
        }else if(bR == "nought"){
            bottomRightButton.setImage(UIImage(named: "nought"), for: .normal)
            bottomRightButton.isSelected = true
        }
        
    }
    
    @objc func swiped(g: UISwipeGestureRecognizer){
        if(finished == true){
            fetchGameState()
            deleteGameStates()
            //states?.removeAll()
            turn = 0
            
            for but in buttons{
                but.setImage(nil, for: .normal)
                but.isSelected = false
            }
            result.text = ""
            alert.text = ""
            finished = false
            if(crossFirst == true){
                crossFirst = false
                tL = ""
                tM = ""
                tR = ""
                mL = ""
                mM = ""
                mR = ""
                bL = ""
                bM = ""
                bR = ""
                
                changeGameState(turn: turn, tL: "", tM: "", tR: "", mL: "", mM: "", mR: "", bL: "", bM: "", bR: "", cFirst: false)
            }else{
                crossFirst = true
                tL = ""
                tM = ""
                tR = ""
                mL = ""
                mM = ""
                mR = ""
                bL = ""
                bM = ""
                bR = ""
                changeGameState(turn: turn, tL: "", tM: "", tR: "", mL: "", mM: "", mR: "", bL: "", bM: "", bR: "", cFirst: true)
            }
            

            //fetchGameState()
            
        }
    }
    
    func checkWhichButton(but:UIButton, type:String, first:Bool){
        switch but {
        case topLeftButton:
            tL = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case topMidButton:
            tM = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case topRightButton:
            tR = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case midLeftButton:
            mL = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case midMidButton:
            mM = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case midRightButton:
            mR = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case bottomLeftButton:
            bL = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case bottomMidButton:
            bM = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        case bottomRightButton:
            bR = type
            changeGameState(turn: turn, tL: tL, tM: tM, tR: tR, mL: mL, mM: mM, mR: mR, bL: bL, bM: bM, bR: bR, cFirst: first)
        default: break
            
        }
    }

    @IBAction func buttonClicked(_ sender:UIButton){
        if(finished == false){
            
            if(sender.isSelected == false){
                
                if(crossFirst == true){
                    if(turn%2==0){
                        sender.setImage(UIImage(named: "cross"), for: .normal)
                        selectedButton = sender
                        turn = turn + 1
                        checkWhichButton(but: sender, type: "cross", first: true)
                    }else{
                        sender.setImage(UIImage(named: "nought"), for: .normal)
                        selectedButton = sender
                        turn = turn + 1
                        checkWhichButton(but: sender, type: "nought", first: true)
                    }
                }else{
                    if(turn%2==0){
                        sender.setImage(UIImage(named: "nought"), for: .normal)
                        selectedButton = sender
                        turn = turn + 1
                        checkWhichButton(but: sender, type: "nought", first: false)
                    }else{
                        sender.setImage(UIImage(named: "cross"), for: .normal)
                        selectedButton = sender
                        turn = turn + 1
                        checkWhichButton(but: sender, type: "cross", first: false)
                    }
                }
            }
        
        
        sender.isSelected = true
        if(checkWinCross(but1: topLeftButton, but2: topMidButton, but3: topRightButton) || checkWinCross(but1: midLeftButton, but2: midMidButton, but3: midRightButton) || checkWinCross(but1: bottomLeftButton, but2: bottomMidButton, but3: bottomRightButton) || checkWinCross(but1: topLeftButton, but2: midLeftButton, but3: bottomLeftButton) || checkWinCross(but1: topMidButton, but2: midMidButton, but3: bottomMidButton) || checkWinCross(but1: topRightButton, but2: midRightButton, but3: bottomRightButton) || checkWinCross(but1: topLeftButton, but2: midMidButton, but3: bottomRightButton) || checkWinCross(but1: topRightButton, but2: midMidButton, but3: bottomLeftButton)){
            result.text = "Cross is the winner!"
            alert.text = "Swipe right to start a new game"
            crossScore = crossScore + 1
            changeGameScores(p1: crossScore, p2: noughtScore)
            crossS.text = "Cross (Player 1): \(crossScore)"
            finished = true
        }else if(checkWinNought(but1: topLeftButton, but2: topMidButton, but3: topRightButton) || checkWinNought(but1: midLeftButton, but2: midMidButton, but3: midRightButton) || checkWinNought(but1: bottomLeftButton, but2: bottomMidButton, but3: bottomRightButton) || checkWinNought(but1: topLeftButton, but2: midLeftButton, but3: bottomLeftButton) || checkWinNought(but1: topMidButton, but2: midMidButton, but3: bottomMidButton) || checkWinNought(but1: topRightButton, but2: midRightButton, but3: bottomRightButton) || checkWinNought(but1: topLeftButton, but2: midMidButton, but3: bottomRightButton) || checkWinNought(but1: topRightButton, but2: midMidButton, but3: bottomLeftButton)){
            noughtScore = noughtScore + 1
            result.text = "Nought is the winner!"
            alert.text = "Swipe right to start a new game"
            changeGameScores(p1: crossScore, p2: noughtScore)
            noughtS.text = "Nought (Player 2): \(noughtScore)"
            finished = true
            deleteGameStates()
        }else if(turn == 9){
            result.text = "It is a draw!"
            alert.text = "Swipe right to start a new game"
            finished = true
        }
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
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if(event?.subtype == UIEvent.EventSubtype.motionShake){
                if(finished == false){
                    if(turn < 9 && turn > 0){
                        turn = turn - 1
                        selectedButton.setImage(nil, for: .normal)
                        for but in buttons{
                            if(selectedButton == but){
                                but.isSelected = false
                            }
                        }
                    }
                }
            }
    }
    
    func fetchGameScores(){
        do{
            scores = try managedContext.fetch(GameScores.fetchRequest())
            if(scores?.count != 0){
                let s = scores![scores!.count - 1]
                crossScore = Int(s.player1Score)
                noughtScore = Int(s.player2Score)
            }
        }
        catch{
            
        }
    }
    
    func changeGameScores(p1:Int, p2:Int){
        //deleteGameScores()
        let scores = GameScores(context: self.managedContext)
        scores.player1Score = Int16(p1)
        scores.player2Score = Int16(p2)
        
        do{
            try managedContext.save()
        }
        catch{
            
        }
        
    }
    
    func deleteGameScores(){
        for i in 0..<scores!.count{
            managedContext.delete(scores![i])
        }
        do{
            try managedContext.save()
        }
        catch{
            
        }
    }
    
    func fetchGameState(){
        do{
            states = try managedContext.fetch(GameState.fetchRequest())
            if(states?.count != 0){
                let s = states![states!.count - 1]
                turn = Int(s.turn)
                tL = s.topLeft!
                tM = s.topMid!
                tR = s.topRight!
                mL = s.midLeft!
                mM = s.midMid!
                mR = s.midRight!
                bL = s.bottomLeft!
                bM = s.bottomMid!
                bR = s.bottomRight!
                crossFirst = s.crossFirst
            }
        }
        catch{
            
        }
    }
    
    func changeGameState(turn:Int, tL:String, tM:String, tR:String, mL:String, mM:String, mR:String, bL:String, bM:String, bR:String, cFirst:Bool){
        
        let state = GameState(context: self.managedContext)
        state.turn = Int16(turn)
        state.topLeft = tL
        state.topMid = tM
        state.topRight = tR
        state.midLeft = mL
        state.midMid = mM
        state.midRight = mR
        state.bottomLeft = bL
        state.bottomMid = bM
        state.bottomRight = bR
        state.crossFirst = cFirst
        do{
            try managedContext.save()
        }
        catch{
            
        }
    }
    
    func deleteGameStates(){
        for i in 0..<states!.count{
            managedContext.delete(states![i])
        }
        do{
            try managedContext.save()
        }
        catch{
            
        }
    }
}

