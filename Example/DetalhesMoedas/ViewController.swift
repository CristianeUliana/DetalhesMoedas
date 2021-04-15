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


class ViewController: UIViewController {
    
    @IBOutlet weak var myStack: UIStackView!

    let detalhes = DetalhesMoeda.fromNib()
    var sigla: Substring = "LOH"
    var listaFavoritos = "USD|BTC|EUR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myStack.addSubview(detalhes)
        detalhes.verificarFavoritos(listaFavoritos, sigla)
        detalhes.makeRequestDetalhes(sigla: "BTC")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
