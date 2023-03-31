//
//  GetRequestPage.swift
//  3Lesson4mounth
//
//  Created by Каира on 3.04.2023.
//

import UIKit

class GetRequestPage: UIViewController {
    var data: [Product] = []
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Some News"
        setupTableViewConfigure()
        setupViewsConstraints()

        // Do any additional setup after loading the view.
    }
    private func setupTableViewConfigure(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    private func setupViewsConstraints(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
 }
extension  GetRequestPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        let value = data[indexPath.row]
        cell?.configure(with: value)
        
        return cell!
    
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestFullPage()
        vc.item = data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
