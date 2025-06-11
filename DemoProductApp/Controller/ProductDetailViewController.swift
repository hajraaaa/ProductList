//
//  ProductDetailViewController.swift
//  DemoProductApp
//
//  Created by Hajra Masood on 11/06/2025.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var product: WelcomeElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = product?.title ?? "Product Detail"
        setupUI()
    }
    
    private func setupUI() {
            guard let product = product else { return }
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Description: \(product.description)"
            label.numberOfLines = 0

            view.addSubview(label)

            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
}
