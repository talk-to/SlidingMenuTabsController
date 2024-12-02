//
//  SlidingMenuTabsController.swift
//  Slider
//
//  Created by Dinesh Kumar on 02/12/24.
//

import UIKit

protocol TabControllerWithLeftMenu: UIViewController {
  func leftMenuController() -> UIViewController
  func avoidsSelection() -> Bool
  func onSelectionAvoided()
}

class SlidingMenuTabsController: UIViewController, UITabBarControllerDelegate {

  private var slideMenuController: SlideMenuController!
  private var centerTabBarController: UITabBarController!

  init() {
    super.init(nibName: nil, bundle: nil)
    self.centerTabBarController = UITabBarController()
    self.centerTabBarController.delegate = self
    self.slideMenuController = SlideMenuController(mainViewController: centerTabBarController, leftMenuViewController: UIViewController())
    add(self.slideMenuController)
  }

  var viewControllers: [TabControllerWithLeftMenu]? {
    set { setViewControllers(newValue, animated: false) }
    get { return centerTabBarController.viewControllers as! [TabControllerWithLeftMenu]? }
  }

  var selectedIndex: Int {
    set { centerTabBarController.selectedIndex = newValue }
    get { return centerTabBarController.selectedIndex }
  }

  func setViewControllers(_ viewControllers: [TabControllerWithLeftMenu]?, animated: Bool) {
    centerTabBarController.setViewControllers(viewControllers, animated: animated)
    let newLeftViewController = viewControllers?[safe: selectedIndex]?.leftMenuController()
    if
      let newLeftViewController = newLeftViewController,
      slideMenuController.leftViewController != newLeftViewController {
      slideMenuController.changeLeftViewController(newLeftViewController, closeLeft: true)
    }
  }

  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    let controller = viewController as! TabControllerWithLeftMenu
    if controller.avoidsSelection() {
      controller.onSelectionAvoided()
      return false
    }
    return true
  }

  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    let controller = viewController as! TabControllerWithLeftMenu
    slideMenuController.changeLeftViewController(controller.leftMenuController(), closeLeft: true)
  }

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

@nonobjc extension UIViewController {
  func add(_ child: UIViewController, frame: CGRect? = nil) {
    addChild(child)
    frame != nil ? child.view.frame = frame! : nil
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }
}

extension Collection {
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
