//
//  SpeechManager.swift
//  NeuroLearn
//
//  Created by Dev Jr. 15 on 18/04/26.
//

import AVFoundation

@Observable
final class SpeechManager {
    private let synthesizer = AVSpeechSynthesizer()
    var isSpeaking = false

    func speak(_ text: String) {
        stop()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5 // Slower, more deliberate rate
        utterance.pitchMultiplier = 1.0
        
        isSpeaking = true
        synthesizer.speak(utterance)
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        isSpeaking = false
    }
}
