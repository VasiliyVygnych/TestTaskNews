//
//  TableViewController.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewCell {
    
    var presenter: MainPresenterProtocol?

//MARK: - Top block
    private var topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var imageTopView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
     }()
    private var topTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .semibold)
        label.textColor = .black
        return label
    }()
    private var topDateTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .semibold)
        label.textColor = .gray
        return label
    }()
    private var topButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "ellipsis"),
                        for: .normal)
        button.tintColor = .black
        return button
    }()
//MARK: - Center block
     var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10,
                                 weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10,
                                 weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var imagePreview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        return image
     }()
//MARK: - Lower block
    private var lowerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var commentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    private var commentImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "commentButton")
        return image
     }()
    private var commentTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .semibold)
        label.textColor = .gray
        return label
    }()
    private var favoritesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    private var favoritesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "favoritesImage")
        return image
     }()
    private var favoritesTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .semibold)
        label.textColor = .gray
        return label
    }()
    private var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "saveButton"),
                        for: .normal)
        return button
    }()
    private var showButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    private var buttonUp: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.up"),
                        for: .normal)
        button.tintColor = .gray
        return button
     }()
    private var buttonDown: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"),
                        for: .normal)
        button.tintColor = .gray
        return button
     }()
    private var showTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
// MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                     left: 0,
                                                                     bottom: 20,
                                                                     right: 0))
    }
// MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        self.backgroundColor = .lightGray
        setupeView()
        setupeConstraint()
        setupeButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - setupeView
    private func setupeView() {
        contentView.addSubview(topView)
        topView.addSubview(imageTopView)
        topView.addSubview(topTitle)
        topView.addSubview(topDateTitle)
        topView.addSubview(topButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(imagePreview)
        contentView.addSubview(lowerView)
        lowerView.addSubview(commentButton)
        commentButton.addSubview(commentImage)
        commentButton.addSubview(commentTitle)
        lowerView.addSubview(favoritesButton)
        favoritesButton.addSubview(favoritesImage)
        favoritesButton.addSubview(favoritesTitle)
        lowerView.addSubview(saveButton)
        lowerView.addSubview(showButton)
        showButton.addSubview(buttonUp)
        showButton.addSubview(buttonDown)
        showButton.addSubview(showTitle)
    }
// MARK: - configure
    func configure(data: ResultItem) {
        guard let info = data.data.counters else { return }
        guard let image = data.data.author?.avatar.data.uuid else { return }
        let generateImage = "https://leonardo.osnova.io/\(image)"
        guard let url = URL(string: generateImage) else { return }
        topTitle.text = data.data.author?.name
        topDateTitle.text = "1 час"
        titleLabel.text = data.data.title
        descriptionLabel.text = data.data.author?.prevEntry?.description
        imagePreview.sd_setImage(with: url,
                                 placeholderImage: UIImage(named: "noImage"))
        imageTopView.sd_setImage(with: url,
                                 placeholderImage: UIImage(systemName: "person.fill"))
        commentTitle.text = String(info.comments)
        favoritesTitle.text = String(info.favorites)
        showTitle.text = String(info.views)
    }
// MARK: - setupeButton
    private func setupeButton() {
        topButton.addTarget(self,
                             action: #selector(settings),
                             for: .touchUpInside)
        commentButton.addTarget(self,
                                action: #selector(comments),
                                for: .touchUpInside)
        favoritesButton.addTarget(self,
                                action: #selector(share),
                                for: .touchUpInside)
        saveButton.addTarget(self,
                                action: #selector(save),
                                for: .touchUpInside)
        buttonUp.addTarget(self,
                                action: #selector(tapUp),
                                for: .touchUpInside)
        buttonDown.addTarget(self,
                                action: #selector(tapDown),
                                for: .touchUpInside)
    }
    @objc func settings(sender: UIButton) {
        print("settings")
    }
    @objc func comments(sender: UIButton) {
        print("comments")
    }
    @objc func share(sender: UIButton) {
        print("share")
    }
    @objc func save(sender: UIButton) {
        print("save")
    }
    @objc func tapUp(sender: UIButton) {
        print("tapUp")
    }
    @objc func tapDown(sender: UIButton) {
        print("tapDown")
    }
// MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            topView.widthAnchor.constraint(equalToConstant: 430),
            topView.heightAnchor.constraint(equalToConstant: 50),
            
            imageTopView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageTopView.widthAnchor.constraint(equalToConstant: 22),
            imageTopView.heightAnchor.constraint(equalToConstant: 22),
            imageTopView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 35),
            
            topTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            topTitle.leftAnchor.constraint(equalTo: imageTopView.rightAnchor, constant: 10),
            topTitle.widthAnchor.constraint(equalToConstant: 150),
            topTitle.heightAnchor.constraint(equalToConstant: 22),
            
            topDateTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            topDateTitle.leftAnchor.constraint(equalTo: topTitle.rightAnchor, constant: 5),
            topDateTitle.widthAnchor.constraint(equalToConstant: 50),
            topDateTitle.heightAnchor.constraint(equalToConstant: 22),
            
            topButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            topButton.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -35),
            topButton.widthAnchor.constraint(equalToConstant: 22),
            topButton.heightAnchor.constraint(equalToConstant: 22)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 360),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 360),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 52),

            imagePreview.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            imagePreview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagePreview.widthAnchor.constraint(equalToConstant: 430),
            imagePreview.heightAnchor.constraint(equalToConstant: 210),
        ])
        NSLayoutConstraint.activate([
            lowerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lowerView.widthAnchor.constraint(equalToConstant: 430),
            lowerView.heightAnchor.constraint(equalToConstant: 50),
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            commentButton.centerYAnchor.constraint(equalTo: lowerView.centerYAnchor),
            commentButton.leftAnchor.constraint(equalTo: lowerView.leftAnchor, constant: 20),
            commentButton.widthAnchor.constraint(equalToConstant: 60),
            commentButton.heightAnchor.constraint(equalToConstant: 22),

            commentImage.centerYAnchor.constraint(equalTo: commentButton.centerYAnchor),
            commentImage.leftAnchor.constraint(equalTo: commentButton.leftAnchor),
            commentImage.widthAnchor.constraint(equalToConstant: 22),
            commentImage.heightAnchor.constraint(equalToConstant: 22),

            commentTitle.centerYAnchor.constraint(equalTo: commentButton.centerYAnchor),
            commentTitle.leftAnchor.constraint(equalTo: commentImage.rightAnchor, constant: 5),
            commentTitle.widthAnchor.constraint(equalToConstant: 30),
            commentTitle.heightAnchor.constraint(equalToConstant: 22),
        ])
        NSLayoutConstraint.activate([
            favoritesButton.centerYAnchor.constraint(equalTo: lowerView.centerYAnchor),
            favoritesButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 30),
            favoritesButton.widthAnchor.constraint(equalToConstant: 60),
            favoritesButton.heightAnchor.constraint(equalToConstant: 22),

            favoritesImage.centerYAnchor.constraint(equalTo: favoritesButton.centerYAnchor),
            favoritesImage.leftAnchor.constraint(equalTo: favoritesButton.leftAnchor),
            favoritesImage.widthAnchor.constraint(equalToConstant: 22),
            favoritesImage.heightAnchor.constraint(equalToConstant: 22),

            favoritesTitle.centerYAnchor.constraint(equalTo: favoritesButton.centerYAnchor),
            favoritesTitle.leftAnchor.constraint(equalTo: favoritesImage.rightAnchor, constant: 5),
            favoritesTitle.widthAnchor.constraint(equalToConstant: 30),
            favoritesTitle.heightAnchor.constraint(equalToConstant: 22),

            saveButton.centerYAnchor.constraint(equalTo: lowerView.centerYAnchor),
            saveButton.leftAnchor.constraint(equalTo: favoritesButton.rightAnchor, constant: 30),
            saveButton.widthAnchor.constraint(equalToConstant: 22),
            saveButton.heightAnchor.constraint(equalToConstant: 22)
        ])
        NSLayoutConstraint.activate([
            showButton.centerYAnchor.constraint(equalTo: lowerView.centerYAnchor),
            showButton.rightAnchor.constraint(equalTo: lowerView.rightAnchor, constant: -20),
            showButton.widthAnchor.constraint(equalToConstant: 100),
            showButton.heightAnchor.constraint(equalToConstant: 22),

            buttonUp.centerYAnchor.constraint(equalTo: showButton.centerYAnchor),
            buttonUp.leftAnchor.constraint(equalTo: showButton.leftAnchor),
            buttonUp.widthAnchor.constraint(equalToConstant: 22),
            buttonUp.heightAnchor.constraint(equalToConstant: 22),

            showTitle.centerYAnchor.constraint(equalTo: showButton.centerYAnchor),
            showTitle.centerXAnchor.constraint(equalTo: showButton.centerXAnchor),
            showTitle.widthAnchor.constraint(equalToConstant: 60),
            showTitle.heightAnchor.constraint(equalToConstant: 22),
            
            buttonDown.centerYAnchor.constraint(equalTo: showButton.centerYAnchor),
            buttonDown.rightAnchor.constraint(equalTo: showButton.rightAnchor),
            buttonDown.widthAnchor.constraint(equalToConstant: 22),
            buttonDown.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
