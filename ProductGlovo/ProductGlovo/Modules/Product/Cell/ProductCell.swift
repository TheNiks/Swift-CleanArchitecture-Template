//
//  ProductCell.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 01/12/25.
//

import UIKit
import Foundation

final class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.numberOfLines = 2
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let subTitleLabel: UILabel = {
        let subTitle = UILabel()
        subTitle.font = .systemFont(ofSize: 14, weight: .regular)
        subTitle.numberOfLines = 1
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
    func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
        subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configured(with product: Product) {
        titleLabel.text = product.title
        subTitleLabel.text = "Product Id: \(product.id)"
    }
}
