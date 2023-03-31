//
//  PostRequestPage.swift
//  3Lesson4mounth
//
//  Created by Каира on 3.04.2023.
//

import UIKit

class PostRequestPage: UIViewController {
    private lazy var textField1: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = " Input ID"
        text.layer.cornerRadius = 10
        return text
    }()
    private lazy var textField2: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = " Input Product Title"
        text.layer.cornerRadius  = 10
        return text
    }()
    private lazy var postRequest: UIButton = {
        let post = UIButton(type: .system)
        post.setTitle("POST", for: .normal)
        post.backgroundColor = .systemRed
        post.setTitleColor(.white, for: .normal)
        post.layer.cornerRadius = 10
        post.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return post
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupConstraints(){
        view.addSubview(textField1)
        textField1.borderStyle = .bezel
        textField1.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        view.addSubview(textField2)
        textField2.borderStyle = .bezel
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
       func isTextFieldFiled(textField:  UITextField) -> Bool {
            guard let text = textField.text else { return false }
            
            if  text.isEmpty {
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.black.cgColor
                textField.placeholder = "Need to fill"
                return false
            } else {
                return true
            }
            
            func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
                if !isTextFieldFiled(textField: textField1) &&  !isTextFieldFiled(textField: textField2){
                    return false
                }else if !isTextFieldFiled(textField: textField1){
                    return false
                } else if !isTextFieldFiled(textField: textField2){
                    return false
                } else {
                    return true
                }
            }
        }
    }
    @objc private func postRequest(sender: UIButton) {
        ApiManager.shared.postRequest(id: Int(textField1.text!)!,
                                      title: textField2.text!) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.showAlert(with: "Success", message: "With status code: \(data)")
                }
            case .failure(_):
                break
            }
        }
    }
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        present(alert, animated: true)
    }
   
}

