//
//  ListController.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit
import Combine

class ListController: UIViewController, ListViewModelInjected {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIView!
    
    private var items = [RocketViewItem]()
    private var isLoading = false
    
    private var disposables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listViewModel.get()
    }
}

// MARK: - Binding
extension ListController {
    private func configureBinding() {
        listViewModel.$items
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                guard let weakSelf = self else { return }
                weakSelf.items = value
                weakSelf.uodateView()
            }
            .store(in: &disposables)
        
        listViewModel.$refreshItems
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                guard let weakSelf = self else { return }
                weakSelf.tableView.reloadRows(at: value, with: .fade)
            }
            .store(in: &disposables)
        
        listViewModel.$isLoading
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                guard let weakSelf = self else { return }
                weakSelf.isLoading = value
                weakSelf.uodateView()
            }
            .store(in: &disposables)
    }
}

// MARK: - UI
extension ListController {
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func uodateView() {
        indicatorView.isHidden = !isLoading
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ListController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        
        cell.configure(item)

        if cell.accessoryView == nil {
            let indicator = UIActivityIndicatorView(style: .medium)
            cell.accessoryView = indicator
        }
        let indicator = cell.accessoryView as! UIActivityIndicatorView
        
        switch (item.state) {
        case .failed:
            indicator.stopAnimating()
            print("Failed to load")
        case .new:
            indicator.startAnimating()
            if !tableView.isDragging && !tableView.isDecelerating {
                listViewModel.startOperations(for: item, at: indexPath)
            }
        case .downloaded:
            indicator.stopAnimating()
            cell.accessoryView = nil
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listViewModel.showDetail(items[indexPath.row])
    }
}

// MARK: - ScrollView Delegate Methods
extension ListController {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        listViewModel.suspendAllOperations()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            loadImagesForOnscreenCells()
            listViewModel.resumeAllOperations()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        loadImagesForOnscreenCells()
        listViewModel.resumeAllOperations()
    }
}

// MARK: - Image Download Methods
extension ListController {
    func loadImagesForOnscreenCells() {
        if let paths = tableView.indexPathsForVisibleRows {
            listViewModel.loadImagesForOnscreenCells(paths)
        }
    }
}
