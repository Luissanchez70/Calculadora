//
//  ComponentesUI.swift
//  Calculadora
//
//  Created by Luis Fernando Sanchez Muñoz on 2/4/24.
//

import Foundation
import UIKit

class ComponentesUI{
    
    private static let signos: String = " / X + - = AC"
    
    static func makeButton(_ tagBtn : String) -> UIButton {
        
        let button = UIButton(type: .custom)
        button.setTitle(tagBtn, for: .normal)
        
        if (signos.contains(tagBtn)){
            button.backgroundColor = .orange
        }else{
            button.backgroundColor = .lightGray
        }
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 40
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        return button
    }
    
    static func makeRow() -> UIStackView{
    
        let fila = UIStackView()
        fila.axis = .horizontal
        fila.distribution = .fillEqually
        fila.spacing = 10
        return fila
    }
}
