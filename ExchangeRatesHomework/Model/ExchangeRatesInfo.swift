import Foundation
struct ExchangeRatesInfo: Codable {
    let name: String?
    let price_usd: Double?
}

extension ExchangeRatesInfo: CustomStringConvertible {
    var description: String {
        let result =
"""
$\(((price_usd ?? 0.000)*1000).rounded()/1000)
"""
        return result
    }
}


