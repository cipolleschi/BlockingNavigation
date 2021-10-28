//
//  AppDelegate.swift
//  BlockingNavigation
//
//  Created by Riccardo Cipolleschi on 28/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow()
        let walletVC = CreditCardWalletVC(viewModel: .init(creditCards: Self.dummyCreditCardData))
        let navigationController = NavigationController(rootViewController: walletVC)
        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }

}

extension AppDelegate {
    static let dummyCreditCardData = [
        CreditCard(
            creditCardNumber: "0000-1111-2222-3333",
            holder: "Riccardo Cipolleschi",
            expirationMonth: 11,
            expirationYear: 2024
        ),
        CreditCard(
            creditCardNumber: "4444-5555-6666-7777",
            holder: "Riccardo Cipolleschi",
            expirationMonth: 04,
            expirationYear: 2022
        ),
    ]
}
