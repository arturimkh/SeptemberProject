//
//  CustomMemberButton.swift
//  SeptemberProject
//
//  Created by Павел Широкий on 14.09.2023.
//

import UIKit
import CoreMotion

final class CustomMemberButton: UIButton {

        // Имена изображений для разных состояний кнопки
        var normalImageName: String?
        var highlightedImageName: String?
        var disabledImageName: String?
        
        // Изображения для разных состояний
        var normalImage: UIImage?
        var highlightedImage: UIImage?
        var disabledImage: UIImage?
 
        private var isHighlightedState = false
        
    init(normalImageName: String?, highlightedImageName: String?, disabledImageName: String?) {
            super.init(frame: .zero)
            
            self.normalImageName = normalImageName
            self.highlightedImageName = highlightedImageName
            self.disabledImageName = disabledImageName
   
            normalImage = UIImage(named: normalImageName ?? "")
            highlightedImage = UIImage(named: highlightedImageName ?? "")
            disabledImage = UIImage(named: disabledImageName ?? "")
 
            setImage(normalImage, for: .normal)
            setImage(highlightedImage, for: .highlighted)
            setImage(disabledImage, for: .disabled)
        
            addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        @objc private func buttonPressed() {
            // Меняем изображение кнопки при нажатии
            isHighlightedState.toggle()
            if isHighlightedState {
                setImage(highlightedImage, for: .normal)
            } else {
                setImage(normalImage, for: .normal)
            }
        }
    }


    




