import UIKit

final class TableViewCell: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let mainStackView: UIStackView = UIStackView()
    private let cryptoView: UIView = UIView()
    private let nameLabel: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        addSubviews()
        addSetups()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    func set(_ name: String, _ description: String) {
        nameLabel.text = name
        priceLabel.text = description
    }

    // MARK: - Setups
private func addConstraints() {
    addCryptoViewConstraints()
    addMainStackViewConstraints()
}

private func addCryptoViewConstraints() {
    cryptoView.translatesAutoresizingMaskIntoConstraints = false
    cryptoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    cryptoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    cryptoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    cryptoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
}

private func addMainStackViewConstraints() {
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    mainStackView.topAnchor.constraint(equalTo: cryptoView.topAnchor, constant: 10).isActive = true
    mainStackView.leadingAnchor.constraint(equalTo: cryptoView.leadingAnchor, constant: 10).isActive = true
    mainStackView.trailingAnchor.constraint(equalTo: cryptoView.trailingAnchor, constant: -10).isActive = true
    mainStackView.bottomAnchor.constraint(equalTo: cryptoView.bottomAnchor, constant: -10).isActive = true
}

private func addSubviews() {
    contentView.addSubview(cryptoView)
    cryptoView.addSubview(mainStackView)
    mainStackView.addArrangedSubview(nameLabel)
    mainStackView.addArrangedSubview(priceLabel)
}

private func addSetups() {
    addCryptoViewSetups()
    addMainStackViewSetups()
    addNameLabelSetups()
    addPriceLabelSetups()
}

private func addCryptoViewSetups() {
    cryptoView.backgroundColor = UIColor(red: 43/255, green: 41/255, blue: 57/255, alpha: 1.0)
    cryptoView.layer.cornerRadius = 10
}

private func addMainStackViewSetups() {
    mainStackView.axis = .horizontal
    mainStackView.distribution = .fillEqually
    mainStackView.alignment = .fill
}

private func addNameLabelSetups() {
    nameLabel.textAlignment = .left
    nameLabel.textColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha: 1.0)
    nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
}

private func addPriceLabelSetups() {
    priceLabel.textAlignment = .right
    priceLabel.textColor = UIColor(red: 125/255, green: 125/255, blue: 135/255, alpha: 0.8)
    priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
}

    // MARK: - Helpers

}
