//
//  TabControllers.swift
//  Slider
//
//  Created by Dinesh Kumar on 02/12/24.
//

import UIKit

private let set_a: [String] = [
  "mail", "head", "body", "frameset", "script", "noscript", "style", "meta", "link", "title", "frame",
  "noframes", "section", "nav", "aside", "hgroup", "header", "footer", "p", "h1", "h2", "h3", "h4", "h5", "h6",
  "ul", "ol", "pre", "div"
]
private let set_b: [String] = [
  "cal", "base", "font", "tt", "i", "b", "u", "big", "small", "em", "strong", "dfn", "code", "samp", "kbd"
]
private let set_c: [String] = [
  "site", "link", "base", "frame"
]

class MailTabViewNavigationController: UINavigationController, TabControllerWithLeftMenu {

  private var leftMenu: StringListTableViewController!
  private var root: SingleLabelViewController!

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  init(account: MailAccount) {
    super.init(nibName: nil, bundle: nil)
    title = "Mail"
    self.root = SingleLabelViewController()
    self.leftMenu = StringListTableViewController(list: set_a) { [weak self] selection in
      self?.root.title = selection
      self?.closeLeft()
    }
    self.viewControllers = [root]
  }

  func leftMenuController() -> UIViewController { return leftMenu }
  func avoidsSelection() -> Bool { return false }
  func onSelectionAvoided() {}

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemBackground
    print("\(self): viewDidLoad")
  }
  override func willMove(toParent parent: UIViewController?) {
    super.willMove(toParent: parent)
    print("\(self): willMove")
  }
  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)
    print("\(self): didMove")
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(self): viewWillAppear")
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(self): viewWillDisappear")
  }
  deinit {
    print("MailTabViewNavigationController: Deinit")
  }
}

class SearchPlaceNavigationViewController: UINavigationController, TabControllerWithLeftMenu {

  private var leftMenu: UIViewController!

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  init(account: MailAccount) {
    super.init(nibName: nil, bundle: nil)
    title = "Search"
    self.leftMenu = UIViewController()
  }

  func leftMenuController() -> UIViewController { return leftMenu }
  func avoidsSelection() -> Bool { return true }

  func onSelectionAvoided() {
    self.parent?.present(StringListTableViewController(list: set_a), animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemBackground
    print("\(self): viewDidLoad")
  }
  override func willMove(toParent parent: UIViewController?) {
    super.willMove(toParent: parent)
    print("\(self): willMove")
  }
  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)
    print("\(self): didMove")
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(self): viewWillAppear")
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(self): viewWillDisappear")
  }
  deinit {
    print("SearchPlaceNavigationViewController: Deinit")
  }
}

class CalendarTabViewNavigationController: UINavigationController, TabControllerWithLeftMenu {

  private var leftMenu: StringListTableViewController!
  private var root: SingleLabelViewController!

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  init(account: MailAccount) {
    super.init(nibName: nil, bundle: nil)
    title = "Cal"
    self.root = SingleLabelViewController()
    self.leftMenu = StringListTableViewController(list: set_b) { [weak self] selection in
      self?.root.title = selection
      self?.closeLeft()
    }
    self.viewControllers = [root]
  }

  func leftMenuController() -> UIViewController { return leftMenu }
  func avoidsSelection() -> Bool { return false }
  func onSelectionAvoided() {}

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemBackground
    print("\(self): viewDidLoad")
  }
  override func willMove(toParent parent: UIViewController?) {
    super.willMove(toParent: parent)
    print("\(self): willMove")
  }
  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)
    print("\(self): didMove")
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(self): viewWillAppear")
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(self): viewWillDisappear")
  }
  deinit {
    print("CalendarTabViewNavigationController: Deinit")
  }
}

class SiteTabViewNavigationController: UINavigationController, TabControllerWithLeftMenu {

  private var leftMenu: StringListTableViewController!
  private var root: SingleLabelViewController!

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  init(account: GenericAccount) {
    super.init(nibName: nil, bundle: nil)
    title = "Site"
    self.root = SingleLabelViewController()
    self.leftMenu = StringListTableViewController(list: set_c) { [weak self] selection in
      self?.root.title = selection
      self?.closeLeft()
    }
    self.viewControllers = [root]
  }

  func leftMenuController() -> UIViewController { return leftMenu }
  func avoidsSelection() -> Bool { return false }
  func onSelectionAvoided() {}

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemBackground
    print("\(self): viewDidLoad")
  }
  override func willMove(toParent parent: UIViewController?) {
    super.willMove(toParent: parent)
    print("\(self): willMove")
  }
  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)
    print("\(self): didMove")
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(self): viewWillAppear")
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(self): viewWillDisappear")
  }
  deinit {
    print("SiteTabViewNavigationController: Deinit")
  }
}
