//
//  CustomMemberButton.swift
//  SeptemberProject
//
//  Created by Павел Широкий on 14.09.2023.
//

import UIKit
import CoreMotion

final class CustomMemberButton: UIButton {

    var status: Bool = false {
        didSet {
            self.update()
        }
    }
    var onImage = UIImage(named: "ManOn")
    var offImage = UIImage(named: "ManOff")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStatus(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        UIView.transition(with: self, duration: 0.10, options: .transitionCrossDissolve, animations: {
            self.status ? self.setImage(self.onImage, for: .normal) : self.setImage(self.offImage, for: .normal)
        }, completion: nil)
    }
    func toggle() {
        self.status ? self.setStatus(false) : self.setStatus(true)
    }
    
    func setStatus(_ status: Bool) {
        self.status = status
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.sendHapticFeedback()
        self.toggle()
    }
    
    func sendHapticFeedback() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
}
