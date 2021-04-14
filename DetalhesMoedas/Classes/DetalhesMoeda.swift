
import UIKit

// APAGAR DEPOIS - VIRÁ NO MÓDULO COMMONS
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
// APAGAR ATÉ AQUI




public struct Botao {
    public static let Adicionar = "ADICIONAR"
    public static let Remover = "REMOVER"
}

public class DetalhesMoeda: UIView {
    
    //var listaFavoritos: [String] = []
    //var delegate: DetalhesMoedaDelegate?
    //var buttonAction: (() -> Void)?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var siglaLabel: UILabel!
    @IBOutlet weak var imagemFavoritos: UIImageView!
    @IBOutlet weak var imagemMoeda: UIImageView!
    @IBOutlet weak var valorMoedaLabel: UILabel!
    @IBOutlet weak var botaoAdcionarRemoverOutlet: UIButton!
    @IBOutlet weak var valorHoraLabel: UILabel!
    @IBOutlet weak var valorMesLabel: UILabel!
    @IBOutlet weak var valorAnoLabel: UILabel!
    
   
    // MARK: - Métodos
    
    func makeRequestDetalhes(sigla: String) {
            //let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
            let api = "http://rest-sandbox.coinapi.io/v1/assets/@@@?apikey=1F8A5E86-F1C9-41C7-B8BB-9DB1B81FDE7C"
            let newUrl = api.replacingOccurrences(of: "@@@", with: sigla)
            let url = URL(string: newUrl)!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moeda = try JSONDecoder().decode(CriptoMoeda.self, from: responseData)
                    self.configuraTela(moeda)
                } catch let error {
                    print("error: \(error)")
                }
            }
            task.resume()
        }
    
    
    func configuraTela(_ moeda: CriptoMoeda) {
        siglaLabel.text = moeda.assetID
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


