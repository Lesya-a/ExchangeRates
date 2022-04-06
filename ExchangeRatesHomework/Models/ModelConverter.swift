import Foundation
struct ModelConverter {
    static let instance = ModelConverter()
    
    func converter(_ serverModel: CoinServerModel) -> CoinClientModel {
        
        let clientModel = CoinClientModel(name: serverModel.name,
                                          priceUsd: serverModel.price_usd)
        return clientModel

    }
    private init() {}
}


