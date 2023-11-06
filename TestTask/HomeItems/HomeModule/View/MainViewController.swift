//
//  MainViewController.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class MainViewController: UITableViewController {
    
    var presenter: MainPresenterProtocol?
    private let cell = "Cell"
    
    var items: [ResultItem]? {
        didSet {
            tableView.reloadData()
        }
    }
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }
// MARK: - setupTableView
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .clear
        tableView.isUserInteractionEnabled = true
        tableView.rowHeight = 446
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TableViewController.self,
                           forCellReuseIdentifier: cell)
    }
// MARK: - tableView numberOfRowsInSection
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
// MARK: - tableView willDisplay
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        var itemsCount = items?.count ?? -1
        let total = 100
        if indexPath.row == itemsCount - 1 {
            if itemsCount < total {
                var index = itemsCount
                itemsCount = index + 12
                while index < itemsCount {
                    index = index + 1
                }
                presenter?.addData()
                self.tableView.insertRows(at: [indexPath],
                                          with: .fade)
            }
        }
    }
// MARK: - tableView cellForRowAt
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell,
                                                       for: indexPath) as? TableViewController,
                let viewModel = items?[indexPath.row] else {
            return UITableViewCell()
        }
            cell.configure(data: viewModel)
            cell.presenter = presenter
            cell.imagePreview.tag = indexPath.row
            cell.imagePreview.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                          action: #selector(imageTapped)))
        return cell
    }
    @objc private func imageTapped(recognizer: UITapGestureRecognizer) {
        if let image = recognizer.view as? UIImageView {
            if let cell = image.superview?.superview  as? UITableViewCell {
                guard let indexPath = self.tableView.indexPath(for: cell) else {return}
                guard let model = items?[indexPath.row] else { return }
                presenter?.didSelectImage(data: model)
            }
        }
    }
// MARK: - tableView didSelectRowAt
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        guard let model = items?[indexPath.row] else { return }
        presenter?.didSelectRowAt(data: model)
    }
}
// MARK: - extension setData
extension MainViewController: MainViewProtocol {
    func setData(data: [ResultItem]?) {
        guard let test = data else { return }
        self.items = test
    }
    func setNewData(data: [ResultItem]?) {
        guard let test = data else { return }
        self.items?.append(contentsOf: test)
    }
}

// MARK: - extension TransitioningDelegate
extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        PresentViewController(transitionMode: .present,
                              duration: 0.5,
                              startingAnimation: tableView.center)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        PresentViewController(transitionMode: .dismiss,
                              duration: 0.5,
                              startingAnimation: tableView.center)
    }
}
