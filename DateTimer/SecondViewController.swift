//
//  SecondViewController.swift
//  Timer
//
//  Created by Aslan on 27.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    var dateFirst: Date?
    var dateSecond: Date?

    
    var timer: Timer?
    var currentDisplayDate: Date?
    var isTimerRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
        
        if let dateFirst = dateFirst, let dateSecond = dateSecond {
            label.text = "Первая дата: \(dateFormatter.string(from: dateFirst))"
            label2.text = "Вторая дата: \(dateFormatter.string(from: dateSecond))"
            
            label3.text = "Дата: \(dateFormatter.string(from: dateFirst))"
        }
    }

    @IBAction func startTimer(_ sender: Any) {
        guard !isTimerRunning, let dateFirst = dateFirst, let dateSecond = dateSecond else { return }
        
        isTimerRunning = true
        currentDisplayDate = dateFirst
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self, let currentDisplayDate = self.currentDisplayDate else { return }
            
            
            if currentDisplayDate >= dateSecond {
                self.stopTimer()
                return
            }
            
            
            self.currentDisplayDate = currentDisplayDate.addingTimeInterval(86400)
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
            self.label3.text = dateFormatter.string(from: self.currentDisplayDate!)
        }
    }

    @IBAction func stopTimer(_ sender: Any) {
        stopTimer()
    }

    @IBAction func restartTimer(_ sender: Any) {
        stopTimer()
        if let dateFirst = dateFirst {
            currentDisplayDate = dateFirst
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
            label3.text = dateFormatter.string(from: dateFirst)
        }
    }

    private func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()  
        timer = nil
    }
}
