//
//  ProductsViewController.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 21/11/25.
//

import Foundation
import UIKit
import Combine

class ProductsViewController: UIViewController {

    internal var viewModel: ProductsViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        return table
    }()
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
        bindViewModel()
        loadProducts()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func loadProducts() {
        Task {
            await viewModel.loadProducts()
        }
    }
    
    func bindViewModel() {
        viewModel.$products
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData() }
            .store(in: &cancellables)
    }
}
