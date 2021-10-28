//
//  NavigationController.swift
//  BlockingNavigation
//
//  Created by Riccardo Cipolleschi on 28/10/21.
//

import UIKit

/// Marker protocol for all the VC that requires confirmation on Pop
protocol PopRequiresConfirmation {}

// MARK: - Custom Navigation Controller
final class NavigationController: UINavigationController {}

// MARK: - UINavigationBarDelegate Conformance
extension NavigationController: UINavigationBarDelegate {
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        guard shouldAskConfirmation(for: item) else {
            return true
        }

        self.askUserForConfirmation()
        return false
    }
    
    private func shouldAskConfirmation(for item: UINavigationItem) -> Bool {
        guard
            let vc = self.viewControllers.last(where: { $0.navigationItem === item}),
            vc is PopRequiresConfirmation
        else {
            return false
        }
        
        return true
    }
    
    func askUserForConfirmation() {
        let alertController = UIAlertController(
            title: "Cancel Insertion",
            message: "Do you really want to go back? If you proceed, all the inserted data will be lost.",
            preferredStyle: .alert
        )
        
        alertController.addAction(
            .init(
                title: "Yes, cancel",
                style: .cancel,
                handler: { [weak self] _ in
                    self?.popViewController(animated: true)
                }
            )
        )
        
        alertController.addAction(
            .init(
                title: "No, continue",
                style: .default,
                handler: nil
            )
        )
        
        self.present(alertController, animated: true, completion: nil)
    }
}
