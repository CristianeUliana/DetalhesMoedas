
import UIKit

public class DetalhesMoeda: UIView {
    
    //var listaFavoritos: [String] = []
    var delegate: DetalhesMoedaDelegate?
    var buttonAction: (() -> Void)?
   
    
    @IBOutlet weak var imagemFavoritos: UIImageView!
    @IBOutlet weak var imagemMoeda: UIImageView!
    @IBOutlet weak var valorMoedaLabel: UILabel!
    @IBOutlet weak var botaoAdcionarRemoverOutlet: UIButton!
    @IBOutlet weak var valorHoraLabel: UILabel!
    @IBOutlet weak var valorMesLabel: UILabel!
    @IBOutlet weak var valorAnoLabel: UILabel!
    
    public func setupUI(moedaDelegate: DetalhesMoedaDelegate?) {
        delegate = moedaDelegate
    }
    
    @IBAction func botaoAcao(_ sender: UIButton) {
        if let _buttonAction = buttonAction {
            _buttonAction()
        } else {
            delegate?.buttonAction()
        }
        // se moeda está em listaFavoritos -> Remove
        // senão -> Adiciona
        
    }
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



//public extension UIView {
//    func loadNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nibName = type(of: self).description().components(separatedBy: ".").last!
//        let nib = UINib(nibName: nibName, bundle: bundle)
//        return nib.instantiate(withOwner: self, options: nil).first as! UIView
//    }
//
//}
