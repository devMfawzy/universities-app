//
//  ListingItemCell.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import UIKit

final class ListingItemCell: UITableViewCell {
    private let vStack = UIStackView()
    private let titleLabel = UILabel()
    private let subtitle = UILabel()
    
    static var identifier: String {
        String(describing: self)
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: ListingItem) {
        titleLabel.text = item.name
        subtitle.text = item.state
        subtitle.isHidden = item.state == nil
    }
    
    private func setupView() {
        accessoryType = .disclosureIndicator
        vStack.axis = .vertical
        vStack.spacing = 8
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        subtitle.font = .preferredFont(forTextStyle: .subheadline)
        [titleLabel, subtitle].forEach { $0.numberOfLines = 0 }
        [titleLabel, subtitle].forEach {
            vStack.addArrangedSubview($0)
        }
        contentView.addSubview(vStack)
    }
    
    private func setupConstrains() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
