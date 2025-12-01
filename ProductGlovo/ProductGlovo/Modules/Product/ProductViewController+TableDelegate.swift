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
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        cell.configured(with: viewModel.products[indexPath.row])
        return cell
    }
}
