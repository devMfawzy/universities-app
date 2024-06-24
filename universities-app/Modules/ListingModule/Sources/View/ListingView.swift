//
//  File.swift
//  
//
//  Created by Mohamed Fawzy on 24/06/2024.
//

import Foundation

final class ListingView: UIViewController {
    private let presenter: ListingPresenterProtocol
    
    //MARK: - Subviews
    private let tableView = UITableView(frame: .zero)
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private lazy var failureView =  FailureView(buttonTitle: "Retry") { [weak self] in        self?.presenter.didTapRetryButton()
    }
    
    init(presenter: ListingPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrains()
        presenter.viewDidLoad(view: self)
    }
    
    // MARK: Setup views
    private func setupView() {
        title = presenter.listingViewTitle
        // Setup table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListingItemCell.self, forCellReuseIdentifier: ListingItemCell.identifier)
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        activityIndicator.color = .systemBlue
        [tableView, activityIndicator, failureView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstrains() {
        [tableView, activityIndicator, failureView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            failureView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            failureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            failureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

extension ListingView: ListingViewProtocol {
    func reloadListings() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func startLoadig() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }
    
    func stopLoadig() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    func showFailureMessage(_ message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.failureView.show(message: message)
        }
    }
    
    func hideFailureMessage() {
        DispatchQueue.main.async { [weak self] in
            self?.failureView.hideView()
        }
    }
}

//MARK: - Data Source

extension ListingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListingItemCell.identifier) as? ListingItemCell else {
            return UITableViewCell()
        }
        guard let item = presenter.listingItem(at: indexPath) else { return cell }
        cell.configure(item: item)
        return cell
    }
}

//MARK: - Delegate

extension ListingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
