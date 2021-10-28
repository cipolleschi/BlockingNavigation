//
//  CreditCardCell.swift
//  BlockingNavigation
//
//  Created by Riccardo Cipolleschi on 28/10/21.
//

import UIKit

// MARK: - Credit Card Cell View Model
class CreditCardCellVM {
    let cardHolder: String
    let expirationDate: String
    let cardNumber: String
    
    init(cardHolder: String, expirationMonth: Int, expirationYear: Int, cardNumber: String) {
        self.cardHolder = cardHolder
        self.expirationDate = "\(expirationMonth)/\(expirationYear)"
        self.cardNumber = cardNumber
    }
}

// MARK: - Credit Card Cell
class CreditCardCell: UITableViewCell {
    static let reusableIdentifier = "\(CreditCardCell.self)"
    
    var viewModel: CreditCardCellVM? {
        didSet {
            self.update(oldModel: oldValue)
        }
    }
    
    private let cardHolderLabel = UILabel()
    private let cardNumberLabel = UILabel()
    private let cardExpirationLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
        self.style()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.contentView.addSubview(cardHolderLabel)
        self.contentView.addSubview(cardNumberLabel)
        self.contentView.addSubview(cardExpirationLabel)
    }
    
    func style() {
        self.contentView.backgroundColor = .clear
    }
    
    func setupConstraints() {
        self.cardHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cardExpirationLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.cardHolderLabel.leadingAnchor.constraint(
                equalTo: self.contentView.readableContentGuide.leadingAnchor
            ),
            self.cardHolderLabel.bottomAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            self.cardNumberLabel.leadingAnchor.constraint(
                equalTo: self.contentView.readableContentGuide.leadingAnchor
            ),
            self.cardNumberLabel.topAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        
            self.cardExpirationLabel.trailingAnchor.constraint(
                equalTo: self.contentView.readableContentGuide.trailingAnchor
            ),
            self.cardExpirationLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func update(oldModel: CreditCardCellVM?) {
        
        self.cardHolderLabel.text = self.viewModel?.cardHolder
        self.cardNumberLabel.text = self.viewModel?.cardNumber
        self.cardExpirationLabel.text = self.viewModel?.expirationDate
        
        self.setNeedsUpdateConstraints()
    }
}
