//
//  ViewController.swift
//  Calculadora
//
//  Created by Luis Fernando Sanchez Muñoz on 2/4/24.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var contenedor: UIStackView!
    
    private let botonesTags: [String] = ["1","2","3","AC","4","5","6"," - ","7","8","9"," X ","0","."," / "," + ","="]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        configurarVista()
        
    }
    
    private func configurarVista(){
        view.backgroundColor = .green
        
        contenedor.spacing = 10
        
        NSLayoutConstraint.activate([
            contenedor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contenedor.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        addButtonView()
    }

 
    private func addButtonView(){
        var count = 5
        var fila: UIStackView = ComponentesUI.makeRow()
        
        for tag in botonesTags {
            if (count == 5){
                contenedor.addArrangedSubview(fila)
                fila = ComponentesUI.makeRow()
                count = 1
            }
            
            let auxButton = ComponentesUI.makeButton(tag)
            if(tag == "="){
                auxButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
                auxButton.layer.cornerRadius = 30
            }
            auxButton.addTarget(self, action: #selector(selectorBtn), for: .touchUpInside)

            fila.addArrangedSubview(auxButton)
            count += 1
        
        }
        contenedor.addArrangedSubview(fila)
    
    }
    
    @objc func selectorBtn(_ btn: AnyObject){
       
        let digito = btn.title(for: .normal)
        
        if (digito == "=" && label.text != ""){
            if(label.text!.count > 1){
                let resultado = Calculos.getOperation(label.text!)
                label.text = "\(resultado)"
            }
        }else if (digito == "AC"){
            label.text = ""
        }else{
            
            var operacion_existente = label.text ?? ""
             
            if (operacion_existente.count > 0){
                
                if(operacion_existente.last == " " && digito!.contains(" ")){
                    print("Signo ya insertado ")
                }else{
                    operacion_existente += btn.title(for: .normal)!
                    label.text = operacion_existente
                }
            }else{
                operacion_existente += btn.title(for: .normal)!
                label.text = operacion_existente
            }
        }
        
        
    }
}

