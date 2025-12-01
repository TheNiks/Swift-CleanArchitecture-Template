//
//  ProductViewController+TableDelegate.swift
//  ProductGlovo
//
//  Created by Nikunj Modi on 21/11/25.
//

import Foundation
import UIKit

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.products[indexPath.row].title
        return cell
    }
}
