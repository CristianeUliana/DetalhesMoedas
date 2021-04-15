
import UIKit



//struct MoedaElement: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
//    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
//    let dataSymbolsCount: Int
//    let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double
//    let idIcon: String
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataSymbolsCount = "data_symbols_count"
//        case volume1HrsUsd = "volume_1hrs_usd"
//        case volume1DayUsd = "volume_1day_usd"
//        case volume1MthUsd = "volume_1mth_usd"
//        case priceUsd = "price_usd"
//        case idIcon = "id_icon"
//    }
//}
//
//typealias Moeda = [MoedaElement]

struct MoedaElement: Codable {
    let id, assetID, name: String
    let priceUsd: Int
    let idIcon: String
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Int

    enum CodingKeys: String, CodingKey {
        case id
        case assetID = "asset_id"
        case name
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
    }
}

typealias Moeda = [MoedaElement]


//public struct Botao {
//    public static let Adicionar = "ADICIONAR"
//    public static let Remover = "REMOVER"
//}

public class DetalhesMoeda: UIView {
    
    //var listaFavoritos: [String] = []
    //var delegate: DetalhesMoedaDelegate?
    //var buttonAction: (() -> Void)?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var siglaMoedaLabel: UILabel!
    @IBOutlet weak var favoritoImage: UIImageView!
    @IBOutlet weak var moedaImage: UIImageView!
    @IBOutlet weak var valorMoedaLabel: UILabel!
    @IBOutlet weak var botaoOutlet: UIButton!
    @IBOutlet weak var valorHoraLabel: UILabel!
    @IBOutlet weak var valorMesLabel: UILabel!
    @IBOutlet weak var valorAnoLabel: UILabel!
    
    // MARK: - Métodos
    
    public func makeRequestDetalhes(sigla: String) {
            //let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
            //let api = "https://rest-sandbox.coinapi.io/v1/assets/@@@?apikey=1F8A5E86-F1C9-41C7-B8BB-9DB1B81FDE7C"
            //let newUrl = api.replacingOccurrences(of: "@@@", with: sigla)
            let newUrl = "https://607797ae1ed0ae0017d6afb7.mockapi.io/api/v1/users"
            let url = URL(string: newUrl)!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moedas = try JSONDecoder().decode(Moeda.self, from: responseData)
                    for moeda in moedas {
                        DispatchQueue.main.async {
                            self.configuraTela(moeda)
                        }
                        
                    }
                    
                } catch let error {
                    print("error: \(error)")
                }
            }
            task.resume()
        }


    func configuraTela(_ moeda: MoedaElement) {
        siglaMoedaLabel.text = moeda.assetID
        valorMoedaLabel.text = "$ \(moeda.priceUsd)"
        valorHoraLabel.text = "$ "
        valorMesLabel.text = "$ "
        valorAnoLabel.text = "$ "

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    public func setupUI(moedaDelegate: DetalhesMoedaDelegate?) {
//        botaoAdcionarRemoverOutlet.setTitle(Botao.Adicionar, for: .normal)
//        delegate = moedaDelegate
//    }
//
//
//
//
//
//    @IBAction func botaoAcao(_ sender: UIButton) {
//        if let _buttonAction = buttonAction {
//            _buttonAction()
//        } else {
//            delegate?.buttonAction()
//        }
//        // se moeda está em listaFavoritos -> Remove
//        // senão -> Adiciona
//
//    }
}



extension UIView {

    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let b = Bundle(identifier: "org.cocoapods.demo.DetalhesMoedas") {
            bundle = b
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }

    public class func fromNib() -> Self {
        return fromNib(viewType: self)
    }

    public class func fromNib<T: UIView>(viewType: T.Type) -> T {
        if let nib = bundleUI.loadNibNamed(
            String(describing: viewType), owner: nil, options: nil)?.first as? T {
            return nib
        }
        return T()
    }
}


