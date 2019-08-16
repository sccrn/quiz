//
//  ControlView.swift
//  quiz
//
//  Created by Samanta Coutinho on 2019-08-16.
//  Copyright © 2019 Samanta Coutinho. All rights reserved.
//

import Foundation
import UIKit

enum ControlViewState {
    case allWords
    case textState(enable: Bool)
    case endTimer
}

protocol ControlViewDelegate: class {
    func didChange(with action: ControlViewState)
}

class ControlView: UIView, NibLoadable {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var numberOfHits: UILabel!
    @IBOutlet weak var startResetButton: UIButton!
    
    weak var delegate: ControlViewDelegate?
    private var seconds = 300
    private var timer: Timer?
    private var isTimerRunning = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTopBorder()
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTopBorder()
        setupFromNib()
    }
    
    func configureLayout() {
        startResetButton.setTitle(Constants.Titles.start, for: .normal)
        seconds = 300
        timerLabel.text = formatterTimer(time: TimeInterval(seconds))
        isTimerRunning = false
    }
    
    func insertNewWord(count: Int) {
        numberOfHits.text = "\(count)/50"
        if count == 50 {
            delegate?.didChange(with: .allWords)
            timer?.invalidate()
        }
    }
    
    @IBAction func actionStartReset(_ sender: Any) {
        if(startResetButton.titleLabel?.text == Constants.Titles.start) {
            startResetButton.setTitle(Constants.Titles.reset, for: .normal)
            startCountDown()
        } else {
            startResetButton.setTitle(Constants.Titles.start, for: .normal)
            resetCountDown()
        }
    }
    
    private func startCountDown() {
        if !isTimerRunning {
            delegate?.didChange(with: .textState(enable: true))
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                                selector: #selector(updateCountDown),
                                                userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    
    private func resetCountDown() {
        delegate?.didChange(with: .textState(enable: false))
        timer?.invalidate()
        seconds = 300
        timerLabel.text = formatterTimer(time: TimeInterval(seconds))
        isTimerRunning = false
    }
    
    @objc private func updateCountDown() {
        if seconds == 0 {
            timer?.invalidate()
            delegate?.didChange(with: .endTimer)
        } else {
            seconds -= 1
            timerLabel.text = formatterTimer(time: TimeInterval(seconds))
        }
    }
    
    private func formatterTimer(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
