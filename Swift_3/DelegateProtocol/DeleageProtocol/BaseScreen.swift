//
//  ViewController.swift
//  DeleageProtocol
//
//  Created by Miguel Silva da Rocha Junior on 8/3/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit

class BaseScreen: UIViewController, SideSelectionDelegate {

    @IBOutlet weak var starWarsLogo: UIImageView!
    @IBOutlet weak var chooseSideButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        chooseSideButton.layer.cornerRadius = chooseSideButton.frame.size.height/2
        
    }
    
    @IBAction func chooseSideTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        selectionVC.intern = self
        //selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
    
    // Conform to Protocol SideSelectionDelegate
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        starWarsLogo.image = image
        nameLabel.text = name
        view.backgroundColor  = color
    }
    var mustBeSettable: Int = 3
    var doesNotNeedToBeSettable: Int = 4
    //Conformed to Protocol SideSelectionDelegate
}




protocol RandomNumberGenerator {
    func random() -> Double
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}



class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}


class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}
