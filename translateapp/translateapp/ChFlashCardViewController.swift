//
//  ChFlashCardViewController.swift
//  translateapp
//
//  Created by Andy Ouyang on 12/15/21.
//

import UIKit

protocol FlashCardProtocol {
    var prompt: String {get}
    var englishPrompt: String {get}
}

struct FlashCard: FlashCardProtocol{
    let prompt: String
    let englishPrompt: String
}

class ChFlashCardViewController: UIViewController {
    
    @IBOutlet weak var flashcardLabel: UILabel!
    //@IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FlipButton: UIButton!
    
    var currentIndex: Int = 0
    
    
    var FlashCardBank: [FlashCardProtocol] = [
        FlashCard(prompt: "你好", englishPrompt: "Hello"),
        FlashCard(prompt: "谢谢", englishPrompt: "Thank You"),
        FlashCard(prompt: "别客气", englishPrompt: "You're welcome"),
        FlashCard(prompt: "早上好", englishPrompt: "Good morning"),
        FlashCard(prompt: "晚安", englishPrompt: "Goodnight"),
        FlashCard(prompt: "我的名字是", englishPrompt: "My name is"),
        FlashCard(prompt: "再见", englishPrompt: "Good Bye"),
        FlashCard(prompt: "你好吗？", englishPrompt: "How are you?"),
        FlashCard(prompt: "很高兴见到你", englishPrompt: "Nice to meet you")
    ]
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if(currentIndex + 1 < FlashCardBank.count){
            currentIndex += 1
            let flashcardText: FlashCardProtocol = FlashCardBank[currentIndex]
            flashcardLabel.text = flashcardText.prompt
        }else{
            currentIndex = 0
            let flashcardText: FlashCardProtocol = FlashCardBank[currentIndex]
            flashcardLabel.text = flashcardText.prompt
        }
    }
        
    @IBAction func flipButtonClicked(_ sender: UIButton) {
        let flashcardText: FlashCardProtocol = FlashCardBank[currentIndex]
        if(flashcardLabel.text == flashcardText.prompt){
            flashcardLabel.text = flashcardText.englishPrompt
        }else{
            flashcardLabel.text = flashcardText.prompt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flashcardText: FlashCardProtocol = FlashCardBank[currentIndex]
        flashcardLabel.text = flashcardText.prompt
    }
    
    
    
}
