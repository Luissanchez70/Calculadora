//
//  ViewController.swift
//  Calculadora
//
//  Created by Luis Fernando Sanchez Muñoz on 2/4/24.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var contenedor: UIStackView!
    private let botonesTags: [String] = ["1","2","3","4","5","6","7","8","9","0","+","-","*","/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let btn = makeButton("R")
        contenedor.backgroundColor = .blue
        NSLayoutConstraint.activate([
            contenedor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contenedor.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        view.addSubview(btn)
        
        addButtonView()
    }

 
    private func addButtonView(){
        var count = 4
        var fila: UIStackView = makeRow()
        
        for tag in botonesTags {
            
            if (count == 4){
                print(" ")
                contenedor.addArrangedSubview(fila)
                fila = makeRow()
               
                count = 1
            }
            
            print(tag, terminator: " ")
            let auxButton = makeButton(tag)
            fila.addArrangedSubview(auxButton)
            count += 1
        
        }
        
    }
    
    private func makeRow() -> UIStackView{
        
       
        let fila = UIStackView()
        fila.axis = .horizontal
        fila.alignment = .fill
        fila.distribution = .fillEqually
        fila.spacing = 10
        fila.backgroundColor = .cyan
        
        return fila
    }
    
    private func makeButton(_ tagBtn : String) -> UIButton {
        
        let button = UIButton(type: .custom)
        button.setTitle(tagBtn, for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 35
       
        
        return button
    }
}

