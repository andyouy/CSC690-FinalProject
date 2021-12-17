//
//  ChFlashCardViewController.swift
//  translateapp
//
//  Created by Andy Ouyang on 12/15/21.
//

import UIKit

class KrFlashCardViewController: UIViewController {
    
    @IBOutlet weak var flashcardLabel: UILabel!
    //@IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FlipButton: UIButton!
    
    var currentIndex: Int = 0
    
    
    var FlashCardBank: [FlashCardProtocol] = [
        FlashCard(prompt: "안녕하세요", englishPrompt: "Hello"),
        FlashCard(prompt: "감사 해요", englishPrompt: "Thank You"),
        FlashCard(prompt: "천만에요", englishPrompt: "You're welcome"),
        FlashCard(prompt: "좋은 아침", englishPrompt: "Good morning"),
        FlashCard(prompt: "잘 자", englishPrompt: "Goodnight"),
        FlashCard(prompt: "내 이름은", englishPrompt: "My name is"),
        FlashCard(prompt: "안녕", englishPrompt: "Good Bye"),
        FlashCard(prompt: "잘 지내고 있나요?", englishPrompt: "How are you?"),
        FlashCard(prompt: "만나서 반가워", englishPrompt: "Nice to meet you")
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
