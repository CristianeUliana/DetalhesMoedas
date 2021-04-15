
import UIKit
import AlamofireImage
import Commons

// Struct da resposta mockada
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


public struct Botao {
    public static let Adicionar = "ADICIONAR"
    public static let Remover = "REMOVER"
}

public class DetalhesMoeda: UIView {
    
    //MARK: - Variáveis
    //var listaFavoritos: [String] = []
    //var delegate: DetalhesMoedaDelegate?
    //var buttonAction: (() -> Void)?
    
   // variáveis de teste
    var favoritos = "USD|BTC|EUR"
    var ehFavorito = false
    
    // MARK: - IBOutlets
    
    
    
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var viewSup: UIView!
    @IBOutlet weak var siglaMoedaLabel: UILabel!
    @IBOutlet weak var favoritoImage: UIImageView!
    @IBOutlet weak var moedaImage: UIImageView!
    @IBOutlet weak var valorMoedaLabel: UILabel!
    @IBOutlet weak var valorHoraLabel: UILabel!
    @IBOutlet weak var valorMesLabel: UILabel!
    @IBOutlet weak var valorAnoLabel: UILabel!
    
    // MARK: - Métodos
    
    public func makeRequestDetalhes(sigla: String) {
            //let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
            //let api = "https://rest-sandbox.coinapi.io/v1/assets/@@@?apikey=1F8A5E86-F1C9-41C7-B8BB-9DB1B81FDE7C"
            //let newUrl = api.replacingOccurrences(of: "@@@", with: sigla)
        
                         // resposta mockada
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
        viewSup.backgroundColor = HeaderCores.headerColor
        siglaMoedaLabel.text = moeda.assetID
        valorMoedaLabel.text = "$ \(moeda.priceUsd)"
        valorHoraLabel.text = "$ \(moeda.volume1HrsUsd)"
        valorMesLabel.text = "$ \(moeda.volume1HrsUsd)"
        valorAnoLabel.text = "$ \(moeda.volume1HrsUsd)" // fazer configuração dos valores
        //let caminhoIcon = moeda.idIcon
        //let id = caminhoIcon.replacingOccurrences(of: "-", with: "")
        //let url = ApiRest.UrlIcon.replacingOccurrences(of: "@@@", with: id)
        let apiUrl = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/@@@.png"
        let urlReplacing = apiUrl.replacingOccurrences(of: "@@@", with: "4caf2b16a0174e26a3482cea69c34cba")
        guard let url = URL(string: urlReplacing) else {return}
        moedaImage.af_setImage(withURL: url)
    }
    
    
    
    func configurarButton(_ acao: String) {
        let botao = ButtonDetalhes.centralButton
        botao.setTitle(acao, for: .normal)
        viewButton.addSubview(botao)
        botao.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: botao, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewButton, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: botao, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewButton, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: botao, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 240)
        let heightConstraint = NSLayoutConstraint(item: botao, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60)
        viewButton.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    
public func verificarFavoritos(_ sigla: Substring) {
        let listaDeFavoritos = favoritos.split(separator: "|")
        if listaDeFavoritos.contains(sigla) {
            ehFavorito = true
            configurarButton(ActionButton.Remover)
            
        } else {
            configurarButton(ActionButton.Adicionar)
        }
    }
}

    // MARK: - Extensions

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
