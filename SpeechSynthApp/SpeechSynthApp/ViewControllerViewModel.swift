//
//  ViewControllerViewModel.swift
//  SpeechSynthApp
//
//  Created by Namik Karabiyik on 26.12.2022.
//

import Foundation
import AVKit
class ViewControllerViewModel
{
    
    private var languages:[String] = []
    private var sounds:[String] = []
    private var presetSoundModel = [SpeechSynthModel]()
    public var currentLanguage = ""
    var presetSoundCount = 0
    let synthesizer = AVSpeechSynthesizer()
    static let ahared = ViewControllerViewModel()
    
    
    
    func getLanguages()->[String]
    {
        for voice in (AVSpeechSynthesisVoice.speechVoices())
        {
            languages.append(voice.language)
        }
        return languages
    }
    
    func getSounds()->[String]
    {
        for voice in (AVSpeechSynthesisVoice.speechVoices())
        {
            sounds.append(voice.name)
        }
        return sounds
    }
    
    func getLanguageCount()->Int
    {
        return languages.count
    }
    
    func getSoundCount()->Int
    {
        return sounds.count
    }
    
    @discardableResult func getPresetSounds(count:Int) -> [SpeechSynthModel]
    {
        
        if count < randomSentences.count
        {
            for _ in 0...count
            {
                let randomLanguage = languages.randomElement()
                let randomSound = randomSentences.randomElement()
                let randomModelElemnt = SpeechSynthModel(presetSoundName: randomSound, presetSoundLang: randomLanguage)
                presetSoundModel.append(randomModelElemnt)
                
            }
        }
      
        presetSoundCount = presetSoundModel.count
        return presetSoundModel
    }
    
    
    func speak(whatToSay speechStr:String, inWhatLanguage languageStr:String)
    {
        
        let speaker = AVSpeechUtterance(string: speechStr)
        speaker.voice = AVSpeechSynthesisVoice(language: languageStr)
        
        synthesizer.speak(speaker)
    }
    
    func getCellData<T>(at IndexPath:IndexPath,from data:[T?])->T?
    {
        return data.isEmpty == true ? nil : data[IndexPath.row]
    }
    
}
