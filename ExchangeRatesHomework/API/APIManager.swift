import Alamofire
struct APIManager {
    static let instance = APIManager()

    enum Constants {
        static let baseURL = "https://rest.coinapi.io/v1"
    }
    
    enum EndPoints {
        static let exchanges = "/exchanges"
        static let assets = "/assets"
    }
    
    let header: HTTPHeaders = ["X-CoinAPI-Key" : "2834079E-5D3E-4B50-8F14-607B734AFA74",
                               "Accept" : "application/json"]
    

    func getAllExchanges(completion: @escaping(([ExchangeRatesInfo]) -> Void)) {
        AF.request(Constants.baseURL + EndPoints.assets,
                   method: .get,
                   parameters: [:],
                   headers: header
        ).responseDecodable(of: [ExchangeRatesInfo].self) { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(let error): print(error)
            }
        }
    }
    
    private init() { }
}
