//
//  AppCoordinator.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 13/12/24.
//

import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func changeView(view: UIViewController) {
        let testVC = TestViewController()
        view.navigationController?.pushViewController(testVC, animated: true)
    }
}
