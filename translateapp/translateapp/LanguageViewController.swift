//
//  LanguageViewController.swift
//  translateapp
//
//  Created by Andy Ouyang on 12/8/21.
//

import UIKit

protocol LanguagePickerDelegate: AnyObject{
    func languageSelected(_ language: Language)
}

class LanguageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    weak var delegate: LanguagePickerDelegate?
    
    var languages: [Language] = [
        Language(abbreviation: "af", name:"Afrikaans" ),
        Language(abbreviation: "sq", name:"Albanian" ),
        Language(abbreviation: "am", name:"Amharic" ),
        Language(abbreviation: "ar", name:"Arabic" ),
        Language(abbreviation: "hy", name:"Armenian" ),
        Language(abbreviation: "az", name:"Azerbaijani" ),
        Language(abbreviation: "eu", name:"Basque" ),
        Language(abbreviation: "be", name:"Belarusian" ),
        Language(abbreviation: "bn", name:"Bengali" ),
        Language(abbreviation: "bs", name:"Bosnian" ),
        Language(abbreviation: "ca", name:"Catalan" ),
        Language(abbreviation: "ceb", name:"Cebuano" ),
        Language(abbreviation: "ny", name:"Chichewa" ),
        Language(abbreviation: "zh-CN", name:"Chinese(Simplified)" ),
        Language(abbreviation: "zh-TW", name:"Chinese(Traditional)" ),
        Language(abbreviation: "hr", name:"Croatian" ),
        Language(abbreviation: "cs", name:"Czech" ),
        Language(abbreviation: "da", name:"Danish" ),
        Language(abbreviation: "nl", name:"Dutch" ),
        Language(abbreviation: "en", name:"English" ),
        Language(abbreviation: "eo", name:"Estonian" ),
        Language(abbreviation: "tl", name:"Amharic" ),
        Language(abbreviation: "am", name:"Filipino" ),
        Language(abbreviation: "fi", name:"Finnish" ),
        Language(abbreviation: "fr", name:"French" ),
        Language(abbreviation: "fy", name:"Frisian" ),
        Language(abbreviation: "gl", name:"Galician" ),
        Language(abbreviation: "ka", name:"Georgian" ),
        Language(abbreviation: "de", name:"German" ),
        Language(abbreviation: "el", name:"Greek" ),
        Language(abbreviation: "gu", name:"Gujarati" ),
        Language(abbreviation: "ht", name:"Haitian Creole" ),
        Language(abbreviation: "ha", name:"Hausa" ),
        Language(abbreviation: "haw", name:"Hawaiin" ),
        Language(abbreviation: "iw", name:"Hebrew" ),
        Language(abbreviation: "hi", name:"Hindi" ),
        Language(abbreviation: "hmn", name:"Hmong" ),
        Language(abbreviation: "hu", name:"Hungarian" ),
        Language(abbreviation: "is", name:"Icelandic" ),
        Language(abbreviation: "ig", name:"Igbo" ),
        Language(abbreviation: "id", name:"Indonesian" ),
        Language(abbreviation: "ga", name:"Irish" ),
        Language(abbreviation: "it", name:"Italian" ),
        Language(abbreviation: "ja", name:"Japanese" ),
        Language(abbreviation: "jw", name:"Javanese" ),
        Language(abbreviation: "kn", name:"Kannada" ),
        Language(abbreviation: "kk", name:"Kazakh" ),
        Language(abbreviation: "km", name:"Khmer" ),
        Language(abbreviation: "rw", name:"Kinyarwanda" ),
        Language(abbreviation: "ko", name:"Korean" ),
        Language(abbreviation: "ku", name:"Kurdish" ),
        Language(abbreviation: "ky", name:"Kyrgyz" ),
        Language(abbreviation: "lo", name:"Lao" ),
        Language(abbreviation: "la", name:"Latin" ),
        Language(abbreviation: "lv", name:"Latvian" ),
        Language(abbreviation: "lt", name:"Lithuanian" ),
        Language(abbreviation: "lb", name:"Luxembourgish" ),
        Language(abbreviation: "mk", name:"Macedonian" ),
        Language(abbreviation: "mg", name:"Malagasy" ),
        Language(abbreviation: "ms", name:"Malay" ),
        Language(abbreviation: "ml", name:"Malayalam" ),
        Language(abbreviation: "mt", name:"Maltese" ),
        Language(abbreviation: "mi", name:"Maori" ),
        Language(abbreviation: "mr", name:"Marathi" ),
        Language(abbreviation: "mn", name:"Mongolian" ),
        Language(abbreviation: "my", name:"Myanmar" ),
        Language(abbreviation: "ne", name:"Nepali" ),
        Language(abbreviation: "no", name:"Norwegian" ),
        Language(abbreviation: "or", name:"Odia" ),
        Language(abbreviation: "ps", name:"Pashto" ),
        Language(abbreviation: "fa", name:"Persian" ),
        Language(abbreviation: "pl", name:"Polish" ),
        Language(abbreviation: "pt", name:"Portuguese" ),
        Language(abbreviation: "pa", name:"Punjabi" ),
        Language(abbreviation: "ro", name:"Romanian" ),
        Language(abbreviation: "ru", name:"Russian" ),
        Language(abbreviation: "sm", name:"Samoan" ),
        Language(abbreviation: "gd", name:"Scots Gaelic" ),
        Language(abbreviation: "sr", name:"Serbian" ),
        Language(abbreviation: "st", name:"Sesotho" ),
        Language(abbreviation: "sn", name:"Shona" ),
        Language(abbreviation: "sd", name:"Sindhi" ),
        Language(abbreviation: "si", name:"Sinhala" ),
        Language(abbreviation: "sk", name:"Slovak" ),
        Language(abbreviation: "sl", name:"Slovenian" ),
        Language(abbreviation: "so", name:"" ),
        Language(abbreviation: "", name:"Somali" ),
        Language(abbreviation: "es", name:"Spanish" ),
        Language(abbreviation: "su", name:"Sundanese" ),
        Language(abbreviation: "sw", name:"Swahili" ),
        Language(abbreviation: "sv", name:"Swedish" ),
        Language(abbreviation: "tg", name:"Tajik" ),
        Language(abbreviation: "ta", name:"Tamil" ),
        Language(abbreviation: "tt", name:"Tatar" ),
        Language(abbreviation: "te", name:"Telugu" ),
        Language(abbreviation: "th", name:"Thai" ),
        Language(abbreviation: "tr", name:"Turkish" ),
        Language(abbreviation: "tk", name:"Turkmen" ),
        Language(abbreviation: "uk", name:"Ukrainian" ),
        Language(abbreviation: "ur", name:"Urdu" ),
        Language(abbreviation: "ug", name:"Uyghur" ),
        Language(abbreviation: "uz", name:"Uzbek" ),
        Language(abbreviation: "vi", name:"Vietnamese" ),
        Language(abbreviation: "cy", name:"Welsh" ),
        Language(abbreviation: "xh", name:"Xhosa" ),
        Language(abbreviation: "yi", name:"Yiddish" ),
        Language(abbreviation: "yo", name:"Yoruba" ),
        Language(abbreviation: "zu", name:"Zulu" )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languagePicker.delegate = self
        languagePicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }

    func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let language = languages[row]
        return language.name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedLanguage = languages[row]
        
        dismiss(animated: true, completion: nil)
        
        delegate?.languageSelected(selectedLanguage)
        
    }
}
