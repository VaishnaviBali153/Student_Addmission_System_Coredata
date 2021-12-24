//
//  AdminViewVC.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AdminViewVC: UIViewController {
    
    private let bgimage: UIImageView = {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "bg2")
        return bgimage
    }()
    
    private let studButton:UIButton = {
        let button = UIButton()
        button.setTitle("STUDENT", for: .normal)
        button.addTarget(self, action: #selector(addstudent), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc private func addstudent(){
    
        let vc = StudentListVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let noticeButton:UIButton = {
        let button = UIButton()
        button.setTitle("NOTICE", for: .normal)
        button.addTarget(self, action: #selector(addnotice), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc private func addnotice(){
        
        let vc = NoticeVc()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let searchButton:UIButton = {
        let button = UIButton()
        button.setTitle("FIND STUDENT", for: .normal)
        button.addTarget(self, action: #selector(findstud), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc private func findstud(){
        
        let vc = FindStudVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let logoutButton:UIButton = {
        let button = UIButton()
        button.setTitle("LOG OUT", for: .normal)
        button.addTarget(self, action: #selector(logout), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc private func logout(){
        
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        view.addSubview(bgimage)
        view.addSubview(studButton)
        view.addSubview(noticeButton)
        view.addSubview(searchButton)
        view.addSubview(logoutButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
          bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 700)
          studButton.frame = CGRect(x: 20, y: 200, width: view.width - 40, height: 40)
          noticeButton.frame = CGRect(x: 20, y: studButton.bottom + 20, width: view.width - 40, height: 40)
         searchButton.frame = CGRect(x: 20, y: noticeButton.bottom + 20, width: view.width - 40, height: 40)
          logoutButton.frame = CGRect(x: 20, y: searchButton.bottom + 20, width: view.width - 40, height: 40)
    }
}
