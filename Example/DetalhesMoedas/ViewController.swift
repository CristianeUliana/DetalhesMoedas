//
//  ViewController.swift
//  DetalhesMoedas
//
//  Created by cristianeguliana@gmail.com on 04/13/2021.
//  Copyright (c) 2021 cristianeguliana@gmail.com. All rights reserved.
//

import UIKit
import DetalhesMoedas


class ViewController: UIViewController {
    
    let controller = TesteViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botao(_ sender: UIButton) {
        print("clicado")
        show(controller, sender: nil)
      //navigationController?.pushViewController(controller, animated: true)
    }
}
