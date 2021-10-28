//
//  CreditCardWalletVC.swift
//  BlockingNavigation
//
//  Created by Riccardo Cipolleschi on 28/10/21.
//

import UIKit

// MARK: - View Model
class CreditCardWalletVM {
    let creditCards: [CreditCard]
    
    init(creditCards: [CreditCard]) {
        self.creditCards = creditCards
    }
    
    var numberOfSections: Int { return 1 }
    
    func numberOfRows(in section: Int) -> Int {
        return self.creditCards.count
    }
    
    func viewModel(for indexPath: IndexPath) -> CreditCardCellVM {
        let card = self.creditCards[indexPath.row]
        
        return CreditCardCellVM(
            cardHolder: card.holder,
            expirationMonth: card.expirationMonth,
            expirationYear: card.expirationYear,
            cardNumber: card.creditCardNumber
        )
    }
}

// MARK: - View Controller
class CreditCardWalletVC: UITableViewController {
    
    let viewModel: CreditCardWalletVM
    
    init(viewModel: CreditCardWalletVM) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigation()
        self.configureTableView()
     
        self.style()
    }
    
    func configureNavigation() {
        navigationItem.title = "Credit Cards"
        navigationItem.rightBarButtonItem = .init(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(goToAdd))
    }
    
    @objc func goToAdd() {
        let vc = AddCreditCardVC()
        self.show(vc, sender: self)
    }
    
    func style() {
        self.tableView.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        self.tableView.register(
            CreditCardCell.self,
            forCellReuseIdentifier: CreditCardCell.reusableIdentifier
        )
    }
}

// MARK: - Table View Delegate Methods
extension CreditCardWalletVC {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                withIdentifier: CreditCardCell.reusableIdentifier,
                for: indexPath
            ) as! CreditCardCell
        let cellVM = self.viewModel.viewModel(for: indexPath)
        cell.viewModel = cellVM
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

