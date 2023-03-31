//
//  GetRequestFullPage.swift
//  3Lesson4mounth
//
//  Created by Каира on 3.04.2023.
//

import UIKit

class GetRequestFullPage: UIViewController {
    
    var item: Product? = nil
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        
        return image
    }()
    lazy var title1: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14, weight: .bold)
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    lazy var descr1: UILabel = {
        let descr = UILabel()
        descr.font = .systemFont(ofSize: 14)
        descr.numberOfLines = 0
        descr.textAlignment = .justified
        return descr
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       setupConstraints()
        setupData()
        // Do any additional setup after loading the view.
    }
    private func setupData() {
        title1.text = item?.title
        descr1.text = item?.description
        let url = URL(string: (item?.thumbnail)!)
        image.kf.setImage(with: url)
    }
    func setupConstraints () {
        view.addSubview(title1)
        title1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        view.addSubview(descr1)
        descr1.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(descr1.snp.bottom).offset(30)
            make.center.equalToSuperview()
            make.width.height.equalTo(250)
            
        }
    }
}
