//
//  ViewController.swift
//  translateapp
//
//  Created by Andy Ouyang on 10/31/21.
//

import UIKit
import SwiftGoogleTranslate

struct Translator{
    func Translate(origin: String, target: String, source: String, callback: @escaping (_ translatedResult: String) ->()){
        SwiftGoogleTranslate.shared.translate(source, target, origin) { (text, error) in
            if let t = text {
                callback(t)
            }
        }
    }
}

class TranslateViewController: UIViewController, LanguagePickerDelegate, TargetLanguagePickerDelegate {
    
    
    @IBOutlet weak var originLanguageLabel: UILabel!
    @IBOutlet weak var targetLanguageLabel: UILabel!
    @IBOutlet weak var sourceText: UITextField!
    @IBOutlet weak var targetText: UITextField!
    
    var originLanguage: String = "en"
    
    var targetLanguage: String = "zh-CN"

    let translator = Translator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originLanguageLabel.text="From: English"
        targetLanguageLabel.text = "To: Chinese(Simplified)"
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let languagePickerVC = segue.destination as? LanguageViewController {
            languagePickerVC.delegate = self
        }
        
        if let targetLanguagePickerVC = segue.destination as? TargetLanguageViewController {
            targetLanguagePickerVC.delegate = self
        }
    }

    func languageSelected(_ language: Language) {
        print(language.name)
        originLanguageLabel.text = "From: \(language.name)"
        originLanguage = language.abbreviation
    }
    
    func targetLanguageSelected(_ language: Language) {
        targetLanguageLabel.text = "To: \(language.name)"
        targetLanguage = language.abbreviation
    }
    
    @IBAction func beginTranslation(_ sender: Any) {
        print("in translation")
        translator.Translate(origin: originLanguage, target: targetLanguage, source: sourceText.text ?? "empty") { (result) in DispatchQueue.main.async {
            self.targetText.text = "\(result)"
            }
        }
    }
    
    

}

