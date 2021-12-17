//
//  ChFlashCardViewController.swift
//  translateapp
//
//  Created by Andy Ouyang on 12/15/21.
//

import UIKit

class JpFlashCardViewController: UIViewController {
    
    @IBOutlet weak var flashcardLabel: UILabel!
    //@IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FlipButton: UIButton!
    
    var currentIndex: Int = 0
    
    
    var FlashCardBank: [FlashCardProtocol] = [
        FlashCard(prompt: "こんにちは", englishPrompt: "Hello"),
        FlashCard(prompt: "ありがとうございます", englishPrompt: "Thank You"),
        FlashCard(prompt: "どういたしまして", englishPrompt: "You're welcome"),
        FlashCard(prompt: "おはようございます", englishPrompt: "Good morning"),
        FlashCard(prompt: "おやすみ", englishPrompt: "Goodnight"),
        FlashCard(prompt: "私の名前は", englishPrompt: "My name is"),
        FlashCard(prompt: "さようなら", englishPrompt: "Good Bye"),
        FlashCard(prompt: "元気ですか？", englishPrompt: "How are you?"),
        FlashCard(prompt: "会えて嬉しい", englishPrompt: "Nice to meet you")
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
