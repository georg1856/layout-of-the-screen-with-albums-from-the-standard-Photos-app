//
//  AppDelegate.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if #available(iOS 15, *) {
              let tabBarAppearance = UITabBarAppearance()
              tabBarAppearance.configureWithDefaultBackground()
              UITabBar.appearance().standardAppearance = tabBarAppearance
              UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }

        let tapBarController = UITabBarController()
        let appearance = UITabBarAppearance()

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        tapBarController.tabBar.standardAppearance = appearance
        tapBarController.tabBar.scrollEdgeAppearance = appearance

        let mediaLibraryViewController = UIViewController()
        mediaLibraryViewController.view.backgroundColor = .systemRed
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                      image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                      tag: 0)

        let forYouViewController = UIViewController()
        forYouViewController.view.backgroundColor = .systemGreen
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                       image: UIImage(systemName: "heart.text.square.fill"),
                                                       tag: 1)

        let photoGalleryViewController = PhotoGalleryViewController()
        photoGalleryViewController.view.backgroundColor = .white
        photoGalleryViewController.tabBarItem = UITabBarItem(title: "Альбомы",
                                                      image: UIImage(systemName: "rectangle.stack.fill"),
                                                      tag: 2)

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .systemYellow
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                     image: UIImage(systemName: "magnifyingglass"),
                                                     tag: 2)

        var navigationPhotoGalleryController = UINavigationController()
        navigationPhotoGalleryController = UINavigationController(rootViewController: photoGalleryViewController)
        navigationPhotoGalleryController.navigationBar.prefersLargeTitles = true
        navigationPhotoGalleryController.navigationBar.isTranslucent = true

        tapBarController.setViewControllers([
            mediaLibraryViewController,
            forYouViewController,
            navigationPhotoGalleryController,
            searchViewController
        ], animated: true)

        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
        return true
    }
}

