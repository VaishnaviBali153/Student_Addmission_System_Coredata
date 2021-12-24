//
//  ViewController.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let bgimage: UIImageView = {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "bg1")
        return bgimage
    }()
    
    private let label :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "LOGIN"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    private let username : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Username"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 20
        return textView
    }()
    
    private let password : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Password"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 20
        return textView
    }()
    
    private let submitButton:UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc private func login(){
        if(username.text == "Admin" && password.text == "123"){
            print("hello")
            let vc = AdminViewVC()
            navigationController?.pushViewController(vc, animated: true)
            //self.present(vc, animated: true, completion: nil)
            
        }else{
            
            let uname = Int(username.text!)!
            let upass = password.text!
            let temp = CoreDataHandler.shared.checkLogin(username: uname, password: upass)
            print("Temp\(temp)")
            
            if(temp == [Student]())
            {
                let alert = UIAlertController(title: "Alert", message: "Invalid User", preferredStyle : UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                UserDefaults.standard.setValue(uname, forKey: "uname")
                let nav = StudVC()
                navigationController?.pushViewController(nav, animated: true)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgimage)
        view.addSubview(label)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(submitButton)
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 700)
       label.frame = CGRect(x: 20, y: 200, width: view.width - 40, height: 40)
        username.frame = CGRect(x: 20, y: label.bottom + 20, width: view.width - 40, height: 40)
        password.frame = CGRect(x: 20, y: username.bottom + 20, width: view.width - 40, height: 40)
        submitButton.frame = CGRect(x: 20, y: password.bottom + 20, width: view.width - 40, height: 40)
    }
    
}

