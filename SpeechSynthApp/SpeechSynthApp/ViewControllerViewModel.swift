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
    public var currentLanguage = ""
    let synthesizer = AVSpeechSynthesizer()
    
    
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
    
    func speak(whatToSay speechStr:String, inWhatLanguage languageStr:String)
    {
       
        let speaker = AVSpeechUtterance(string: speechStr)
        speaker.voice = AVSpeechSynthesisVoice(language: languageStr)
        
        synthesizer.speak(speaker)
    }
    
}
