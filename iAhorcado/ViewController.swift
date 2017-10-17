//
//  ViewController.swift
//  iAhorcado
//
//  Created by Alex on 17/10/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let acierto = 0
    let fallo = 0
    let palabra = ["yoda","estrellita","scarif","horrocrux","voldemort","potter","reliquias","always"]
    let palabraAAdivinar : String = "Pene"
    /*let posicionSorpresa : UInt32 = arc4random_uniform(palabra.count)
    
    let palabraAAdivinar = palabra[posicionSorpresa]*/
    
    @IBOutlet var panelAhorcado: UIImageView!
    @IBOutlet var palabraOculta: UILabel!
    
    
    
    @IBAction func letraPulsada(_ sender: UIButton) {
        var letra : String! = sender.currentTitle
        letra = letra.lowercased()
        palabraOculta.text! += letra
    }
    
    func ponerGuiones() {
        /*var palabraConGuiones : String = "";
        for var i in 0..< palabraAAdivinar.Character.count {
            palabraConGuiones = palabraConGuiones + "_ "
        }*/
        palabraOculta.text! = palabraAAdivinar//palabraConGuiones
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ponerGuiones()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

