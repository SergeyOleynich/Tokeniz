//
//  SceneDelegate.swift
//  Tokeniz
//
//  Created by Serhii Oleinich on 11.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)

        let rootViewController = TokenizerViewController()
        let presenter = TokenizerPresenter()

        presenter.viewInput = rootViewController
        rootViewController.output = presenter


        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(
            rootViewController: rootViewController)
        window?.makeKeyAndVisible()
    }
}

