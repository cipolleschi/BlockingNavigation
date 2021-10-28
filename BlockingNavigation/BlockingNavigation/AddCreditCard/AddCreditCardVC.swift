//
//  AddCreditCardVC.swift
//  BlockingNavigation
//
//  Created by Riccardo Cipolleschi on 28/10/21.
//

import UIKit

// MARK: - Add Credit Card VC
final class AddCreditCardVC: UIViewController, PopRequiresConfirmation {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Credit Card"
        self.view.backgroundColor = .systemBackground
    }
}
