//
//  DetailsView.swift
//
//
//  Created by Mohamed Fawzy on 25/06/2024.
//

import UIKit

final class DetailsView: UIViewController {
    private let presenter: DetailsPresenterProtocol
    private let nameLabel = UILabel()
    private let vStack = UIStackView()
    private let stateLabel = UILabel()
    private let countryNameLabel = UILabel()
    private let countryCodeLabel = UILabel()
    private let webPageLabel = UILabel()
    
    init(presenter: DetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifesycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrains()
        presenter.viewDidLoad(view: self)
    }

    // MARK: Setup views
    private func setupView() {
        view.backgroundColor = .systemBackground
        // Setup refresh button
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.rightBarButtonItem = refreshButton
        // label constrains
        view.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        stateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        let hStack = UIStackView(arrangedSubviews: [countryNameLabel, countryCodeLabel])
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.addArrangedSubview(stateLabel)
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(webPageLabel)
        view.addSubview(vStack)
    }
    
    private func setupConstrains() {
        // label constrains
        [nameLabel, vStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            vStack.topAnchor.constraint(greaterThanOrEqualTo: nameLabel.bottomAnchor, constant: 12),
            vStack.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
        ])
    }
    
    // MARK: - Target Actions
    @objc private func refresh() {
        presenter.didTapRefreshButton()
    }
}

extension DetailsView: DetailsViewProtocl {
    func show(item: ListingItemDetail) {
        nameLabel.text = item.name
        stateLabel.text = item.state
        stateLabel.isHidden = item.state == nil
        countryNameLabel.text = item.country
        countryCodeLabel.text = item.code
        webPageLabel.text = item.webPages.first
    }
}
