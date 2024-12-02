//
//  StringListTableViewController.swift
//  Slider
//
//  Created by Dinesh Kumar on 02/12/24.
//

import UIKit

class StringListTableViewController: UITableViewController {

  private var list = [String]()
  private var onSelection: ((String)-> Void)?

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  init(list: [String], onSelection: ((String)-> Void)? = nil) {
    super.init(nibName: nil, bundle: nil)
    self.list = list
    self.onSelection = onSelection
    clearsSelectionOnViewWillAppear = false
  }

  override func viewDidLoad() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    print("\(self): viewDidLoad")
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onSelection?(list[indexPath.row])
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
    cell.textLabel!.text = list[indexPath.row]
    return cell
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
    print("StringListTableViewController: Deinit")
  }
}


class SingleLabelViewController: UIViewController {
  private var label: UILabel!
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  init() {
    super.init(nibName: nil, bundle: nil)
    self.label = UILabel(frame: view.bounds)
    view.backgroundColor = UIColor.white
    label.text = title
    label.textAlignment = .center
    label.autoresizingMask = [.flexibleHeight, UIView.AutoresizingMask.flexibleWidth]
    view.addSubview(self.label)

    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barBtnOpenLeftMenu))
  }

  @objc
  private func barBtnOpenLeftMenu(_: UIBarButtonItem) {
    openLeft()
  }

  override var title: String? {
    didSet { label.text = title }
  }

}
