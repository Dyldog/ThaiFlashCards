//
//  Speaker.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 18/9/2023.
//

import Foundation
import AVFoundation

struct Speaker {
    private var speechSynth: AVSpeechSynthesizer?
    
    mutating func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "th")

        speechSynth = AVSpeechSynthesizer()
        speechSynth?.speak(utterance)
    }
}
