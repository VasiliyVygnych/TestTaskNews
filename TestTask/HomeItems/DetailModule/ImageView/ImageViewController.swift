//
//  ImageView.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit
import SDWebImage

class ImageViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    private var imagePreview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
     }()
    private var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "xmark"),
                                  for: .normal)
        button.tintColor = .white
        return button
     }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        view.addSubview(imagePreview)
        view.addSubview(backButton)
        setupeButton()
        setupeConstraint()
    }
//MARK: - setupeButton
    private func setupeButton() {
        backButton.addTarget(self,
                             action: #selector(back),
                             for: .touchUpInside)
    }
    @objc func back() {
        self.dismiss(animated: true)
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            imagePreview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imagePreview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePreview.widthAnchor.constraint(equalToConstant: 430),
            imagePreview.heightAnchor.constraint(equalToConstant: 430)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 80),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
//MARK: - setData
extension ImageViewController: DetailViewProtocol {
    func setData(data: ResultItem) {
        guard let image = data.data.author?.avatar.data.uuid else { return }
        let generateImage = "https://leonardo.osnova.io/\(image)"
        guard let url = URL(string: generateImage) else { return }
        imagePreview.sd_setImage(with: url,
                                 placeholderImage: UIImage(named: "noImage"))
    }
}
