//
//  ViewStudVC.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewStudVC: UIViewController {
    
    var stud = [Student]()

    private let spid :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        //label.text = "SPID"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    private let name :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
       // label.text = "FULL NAME"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    private let div :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        //label.text = "DIVISION"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    private let  phone :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        //label.text = "PHONE NO"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    private let pass :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        //label.text = "PASSWORD"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let spidd : Int = UserDefaults.standard.integer(forKey: "uname")
        stud = CoreDataHandler.shared.fetchprofile(spid: spidd)
        
        spid.text = String(stud[0].spid)
        name.text = stud[1].name
        div.text = stud[2].div
        phone.text = stud[3].phone
        pass.text = stud[4].pass


        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spid)
        view.addSubview(name)
        view.addSubview(div)
        view.addSubview(phone)
        view.addSubview(pass)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        spid.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        name.frame = CGRect(x: 40, y: spid.bottom + 20, width: view.width - 80, height: 40)
        div.frame = CGRect(x: 40, y: name.bottom + 20, width: view.width - 80, height: 40)
        phone.frame = CGRect(x: 40, y: div.bottom + 20, width: view.width - 80, height: 40)
        pass.frame = CGRect(x: 40, y: phone.bottom + 20, width: view.width - 80, height: 40)
            }
}
