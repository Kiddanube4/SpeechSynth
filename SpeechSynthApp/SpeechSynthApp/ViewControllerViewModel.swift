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
    
}
