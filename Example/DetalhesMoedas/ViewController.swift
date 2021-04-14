//
//  ViewController.swift
//  DetalhesMoedas
//
//  Created by cristianeguliana@gmail.com on 04/13/2021.
//  Copyright (c) 2021 cristianeguliana@gmail.com. All rights reserved.
//

import UIKit
import DetalhesMoedas

struct CriptoMoeda: Codable {
    let idIcon, assetID, name: String
    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: Int
    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: Int
    let dataSymbolsCount, volume1HrsUsd, volume1DayUsd, volume1MthUsd: Int
    let priceUsd: Int

    enum CodingKeys: String, CodingKey {
        case idIcon = "id_icon"
        case assetID = "asset_id"
        case name
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
    }
}

typealias CriptoMoedas = [CriptoMoeda]



class ViewController: UIViewController {
    
    let controller = TesteViewController()
    var favoritos: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
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
    
    private func makeRequest() {
        let url = URL( string: "https://6076e5cf1ed0ae0017d6a02f.mockapi.io/api/v1/users")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(response as Any)
            
            guard let responseData = data else { return }
          
            do {
                let moedas = try JSONDecoder().decode(CriptoMoedas.self, from: responseData)
                
                for moeda in moedas {
//                    print(moedas)
//                    print("*************************************")
//                    print(moeda)
//                    print("*************************************")
                    print(moeda.assetID)
                }
            
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
    
    
}
