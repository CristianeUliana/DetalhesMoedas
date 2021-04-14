//
//  TesteViewController.swift
//  DetalhesMoedas_Example
//
//  Created by Cristiane Goncalves Uliana on 13/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import DetalhesMoedas

class TesteViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var myStack: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let detalhes = DetalhesMoeda().loadNib()
        myStack.addSubview(detalhes)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
