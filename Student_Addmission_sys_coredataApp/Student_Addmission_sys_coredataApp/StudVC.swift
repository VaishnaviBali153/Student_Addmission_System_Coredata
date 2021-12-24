//
//  StudVC.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudVC: UIViewController {
    
    private let bgimage: UIImageView = {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "bg2")
        return bgimage
    }()

    private let profileButton:UIButton = {
        let button = UIButton()
        button.setTitle("MY PROFILE", for: .normal)
        button.addTarget(self, action: #selector(viewstud), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    @objc private func viewstud(){
        
        let vc = ViewStudVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let checknoteButton:UIButton = {
        let button = UIButton()
        button.setTitle("CHECK NOTICE BOARD", for: .normal)
        button.addTarget(self, action: #selector(viewnote), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    @objc private func viewnote(){
        
        let vc = ViewNoteVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    private let chpassButton:UIButton = {
        let button = UIButton()
        button.setTitle("CHANGE PASSWORD", for: .normal)
        button.addTarget(self, action: #selector(chpass), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    @objc private func chpass(){
        
        let vc = ChPassVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgimage)
        view.addSubview(profileButton)
        view.addSubview(checknoteButton)
        view.addSubview(chpassButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 700)
        profileButton.frame = CGRect(x: 20, y: 200, width: view.width - 40, height: 40)
        checknoteButton .frame = CGRect(x: 20, y: profileButton.bottom + 20, width: view.width - 40, height: 40)
        chpassButton.frame = CGRect(x: 20, y: checknoteButton.bottom + 20, width: view.width - 40, height: 40)
    }
}
