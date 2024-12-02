//
//  AppDelegate.swift
//  Slider
//
//  Created by Dinesh Kumar on 02/12/24.
//

import UIKit




@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window!.makeKeyAndVisible()

    let controller = SlidingMenuTabsController()
    let tabsControllerProvider = GenericAccountsTabsControllerProvider(account: MailAccount())
    let controllers = tabsControllerProvider.buildTabViewControllers()
    controller.viewControllers = controllers
    
    self.window?.rootViewController = controller
    return true
  }
}

protocol GenericAccount { }
struct MailAccount: GenericAccount { }
struct CustomerAccount: GenericAccount { }



class GenericAccountsTabsControllerProvider {

  private let account: GenericAccount

  init(account: GenericAccount) {
    self.account = account
  }

  func buildTabViewControllers() -> [TabControllerWithLeftMenu] {
    var controllers = [TabControllerWithLeftMenu]()
    if let account = account as? MailAccount {
      let mailTab = MailTabViewNavigationController(account: account)
      controllers.append(mailTab)
      let calTab = CalendarTabViewNavigationController(account: account)
      controllers.append(calTab)
      let searchTab = SearchPlaceNavigationViewController(account: account)
      controllers.append(searchTab)
    }
    let siteTab = SiteTabViewNavigationController(account: account)
    controllers.append(siteTab)
    return controllers
  }
}
