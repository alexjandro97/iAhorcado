//
//  ViewController.swift
//  iAhorcado
//
//  Created by Alex on 17/10/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
/*
     LA VISTA ES CON EL TELEFONO VOLTEADO A IZQUIERDA O DERECHA
     
     TODAS LAS PALABRAS QUE HAY QUE ADIVINAR TIENEN QUE ESTAR EN MINUSCULAS
     
 */
    var fallo : Int = 0
    let palabra = ["yoda","estrellita","scarif","horrocrux","voldemort","potter","reliquias","always"]
    var palabraVacia : String = ""
    let palabraAAdivinar : String = "harry"
    
    @IBOutlet var panelAhorcado: UIImageView!
    @IBOutlet var palabraOculta: UILabel!
    
    @IBOutlet var letraQ: UIButton!
    @IBOutlet var letraW: UIButton!
    @IBOutlet var letraE: UIButton!
    @IBOutlet var letraR: UIButton!
    @IBOutlet var letraT: UIButton!
    @IBOutlet var letraY: UIButton!
    @IBOutlet var letraU: UIButton!
    @IBOutlet var letraI: UIButton!
    @IBOutlet var letraO: UIButton!
    @IBOutlet var letraP: UIButton!
    @IBOutlet var letraA: UIButton!
    @IBOutlet var letraS: UIButton!
    @IBOutlet var letraD: UIButton!
    @IBOutlet var letraF: UIButton!
    @IBOutlet var letraG: UIButton!
    @IBOutlet var letraH: UIButton!
    @IBOutlet var letraJ: UIButton!
    @IBOutlet var letraK: UIButton!
    @IBOutlet var letraL: UIButton!
    @IBOutlet var letraSOR: UIButton!
    @IBOutlet var letraZ: UIButton!
    @IBOutlet var letraX: UIButton!
    @IBOutlet var letraC: UIButton!
    @IBOutlet var letraV: UIButton!
    @IBOutlet var letraB: UIButton!
    @IBOutlet var letraN: UIButton!
    @IBOutlet var letraM: UIButton!
   
    
    @IBAction func letraPulsada(_ sender: UIButton) {
        var letra : String! = sender.currentTitle
        letra = letra.lowercased()
        if palabraAAdivinar.contains(letra){
            let longitud = palabraAAdivinar.characters.count
            for var j in 0..<longitud{
                if palabraAAdivinar.charAt(at: j) == letra.charAt(at: 0) {
                    palabraOculta.text! += letra
                }
            }
        }else{
            fallo += 1
            print("Fallos ",fallo)
        }
        
        if palabraOculta.text! == palabraAAdivinar {
            fallo = -1
        }
        
        if fallo == 6 {
            deshabilita()
        }
        sender.isEnabled = false
        cambiaImagen(fallo: fallo)
    }
    
    func aleatorio(){
        let posicionSorpresa = Int(arc4random_uniform(UInt32(palabra.count)))
        let palabraAAdivinar = palabra[posicionSorpresa]
    }
    
    
    func deshabilita(){
        letraQ.isEnabled = false
        letraW.isEnabled = false
        letraE.isEnabled = false
        letraR.isEnabled = false
        letraT.isEnabled = false
        letraY.isEnabled = false
        letraU.isEnabled = false
        letraI.isEnabled = false
        letraO.isEnabled = false
        letraP.isEnabled = false
        letraA.isEnabled = false
        letraS.isEnabled = false
        letraD.isEnabled = false
        letraF.isEnabled = false
        letraG.isEnabled = false
        letraH.isEnabled = false
        letraJ.isEnabled = false
        letraK.isEnabled = false
        letraL.isEnabled = false
        letraSOR.isEnabled = false
        letraZ.isEnabled = false
        letraX.isEnabled = false
        letraC.isEnabled = false
        letraV.isEnabled = false
        letraB.isEnabled = false
        letraN.isEnabled = false
        letraM.isEnabled = false
    }
    
    func cambiaImagen(fallo:Int){
        var image : UIImage = UIImage(named: "ahorcado_0.png")!
        
        switch fallo {
        case 1:
            panelAhorcado.image = UIImage(named: "ahorcado_1.png")
        case 2:
            panelAhorcado.image = UIImage(named: "ahorcado_2.png")
        case 3:
            panelAhorcado.image = UIImage(named: "ahorcado_3.png")
        case 4:
            panelAhorcado.image = UIImage(named: "ahorcado_4.png")
        case 5:
            panelAhorcado.image = UIImage(named: "ahorcado_5.png")
        case 6:
            panelAhorcado.image = UIImage(named: "perder.png")
        case -1:
            panelAhorcado.image = UIImage(named: "acertasteTodo.png")
        default:
            panelAhorcado.image = UIImage(named: "ahorcado_0.png")
        }
    }
    
    func sustituirLetra(_ letra: String){
        for i in 0..<palabraAAdivinar.characters.count{
            if (palabraAAdivinar.charAt(at: i) == letra.charAt(at: 0)){
                palabraVacia = palabraVacia.substring(with: 0..<i) + letra + palabraVacia.substring(with: i+1..<palabraVacia.characters.count)
                palabraOculta.text = palabraVacia
            }
        }
    }
    
    func mostrarPorPantalla(){
        for i in 0..<palabraAAdivinar.characters.count{
            palabraOculta.text = palabraOculta.text! + "_"
            palabraVacia = palabraVacia + "_"
        }
    }
    func ponerGuiones(){
        var guiones: String = ""
        print(palabraAAdivinar)
        //var tamaño: Int = palabraOculta.length
        for var i in 0 ..< palabraAAdivinar.characters.count{
            guiones = guiones + "_ "
            
            
        }
        palabraOculta.text = guiones
    }
    
    //POR DEFECTO DE LA APP
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //aleatorio()
        ponerGuiones()
        mostrarPorPantalla()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 
            METODOS DE STRING
 
 */


extension String {
    func charAt(at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
    
    
}
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    //desde donde lo pones hsata el final
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    //desde el principio
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
