//
//  ProductTableViewCell.swift
//  DemoProductApp
//
//  Created by Hajra Masood on 27/01/2025.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    let productImageView: UIImageView = {
        let productImage = UIImageView()
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = true
        productImage.translatesAutoresizingMaskIntoConstraints = false
        return productImage
    }()
    let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 10)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 9)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    let ratingLabel: UILabel = {
        let rating = UILabel()
        rating.font = .systemFont(ofSize: 9)
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 70),
            productImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 5),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            ratingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            ratingLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 5),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with product: WelcomeElement) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        ratingLabel.text = "Rating: \(product.rating.rate) (\(product.rating.count))"
        if let url = URL(string: product.image) {
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    DispatchQueue.main.async {
                        self.productImageView.image = UIImage(data: data)
                    }
                } catch {
                    print("Error loading image: \(error)")
                }
            }
        }
    }
}


