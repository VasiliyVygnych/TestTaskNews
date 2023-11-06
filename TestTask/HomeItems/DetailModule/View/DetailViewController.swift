//
//  DetailViewController.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
//MARK: - navigationBar
    private var navBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var navigationTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18,
                                 weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private var navigationImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.tintColor = .black
        return image
     }()
//MARK: - body view
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22,
                                 weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20,
                                 weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        view.addSubview(navBarView)
        navBarView.addSubview(navigationImage)
        navBarView.addSubview(navigationTitle)
        navigationItem.titleView = navBarView
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        setupeConstraint()
        setupeButton()
    }
//MARK: - setupeButton
    func setupeButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(back))
         backButton.tintColor = .black
         navigationItem.leftBarButtonItem = backButton
    }
    @objc func back() {
        presenter?.backToView()
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            navBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: 40),
            navBarView.widthAnchor.constraint(equalToConstant: 350),
            
            navigationImage.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: 20),
            navigationImage.widthAnchor.constraint(equalToConstant: 30),
            navigationImage.heightAnchor.constraint(equalToConstant: 30),
            
            navigationTitle.leadingAnchor.constraint(equalTo: navigationImage.trailingAnchor, constant: 10),
            navigationTitle.widthAnchor.constraint(equalToConstant: 300),
            navigationTitle.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 400),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
}
//MARK: - extension setData
extension DetailViewController: DetailViewProtocol {
    func setData(data: ResultItem) {
        navigationTitle.text = data.data.author?.name
        guard let image = data.data.author?.avatar.data.uuid else { return }
        let generateImage = "https://leonardo.osnova.io/\(image)"
        guard let url = URL(string: generateImage) else { return }
        navigationImage.sd_setImage(with: url,
                                 placeholderImage: UIImage(systemName: "person.fill"))
        titleLabel.text = data.data.title
        descriptionLabel.text = data.data.author?.prevEntry?.description
    }
}
