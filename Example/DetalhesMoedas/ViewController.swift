//
//  ViewController.swift
//  DetalhesMoedas
//
//  Created by cristianeguliana@gmail.com on 04/13/2021.
//  Copyright (c) 2021 cristianeguliana@gmail.com. All rights reserved.
//

import UIKit
import DetalhesMoedas
import AlamofireImage
import Commons


class ViewController: UIViewController, DetalhesMoedaDelegate {
    
    @IBOutlet weak var myStack: UIStackView!
    @IBOutlet weak var data: UILabel!
    
    
    
    let detalhes = DetalhesMoeda.fromNib()
    var sigla: Substring = "LOH"
    var listaFavoritos = "USD|BTC|EUR"
    var ehFavorito = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myStack.addSubview(detalhes)
        // detalhes.verificarFavoritos(listaFavoritos, sigla)
        detalhes.makeRequestDetalhes("BTC", "estrela")
        detalhes.setupUI(moedaDelegate: self)
        detalhes.verificarFavoritos(ehFavorito)
        
        data.text = mostrarDataAtual()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    public func buttonAction() {
        print("botão")
        if ehFavorito {
            detalhes.verificarFavoritos(false)
            ehFavorito = false
        } else {
            detalhes.verificarFavoritos(true)
            ehFavorito = true
        }
    
    }
}
