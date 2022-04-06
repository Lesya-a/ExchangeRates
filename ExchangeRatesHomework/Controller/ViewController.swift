import Alamofire
import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let mainTableView: UITableView = UITableView()
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var info: [ExchangeRatesInfo] = [] {
        didSet {
            mainTableView.reloadData()
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        addSubviews()
        setupTableView()
        addConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataAPI()
    }
    
    // MARK: - API
    private func dataAPI() {
        showActivityIndicator()
        APIManager.instance.getAllExchanges { data in
            self.info = data
            self.hideActivityIndicator()
        }
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(mainTableView)
    }
    
    private func configNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha: 1.0)]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.title = "Exchange Rates"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        mainTableView.separatorStyle = .none
        mainTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        mainTableView.backgroundColor = .clear
        mainTableView.tableHeaderView?.backgroundColor = .white
    }
    
    private func addConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - Helpers
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    private func showActivityIndicator() {
        view.isUserInteractionEnabled = false
        let viewController = tabBarController ?? navigationController ?? self
        activityIndicator.frame = CGRect(x: 0, y: 0, width: viewController.view.frame.width, height: viewController.view.frame.height)
        viewController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    private func hideActivityIndicator(){
        view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.set(info[indexPath.row].name ?? "None", info[indexPath.row].description)
            return cell
        }
        return UITableViewCell()
    }
}

