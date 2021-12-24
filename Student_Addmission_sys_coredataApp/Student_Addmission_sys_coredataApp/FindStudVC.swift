//
//  FindStudVC.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class FindStudVC: UIViewController {
    
    private let label :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Eneter the Division"
        label.textAlignment = .left
        label.font = font
        label.textColor = .black
        //label.backgroundColor = .black
        
        return label
    }()

    private let finddiv : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "SEARCH DIVISION"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 20
        return textView
    }()
    
    private let searchButton:UIButton = {
        let button = UIButton()
        button.setTitle("SEARCH", for: .normal)
       // button.addTarget(self, action: #selector(search), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    
//    @objc private func search() {
//
//        print("click")
//
//        studArray = CoreDataHandler.shared.fetchbydiv()
//
//    }
    
    private var studArray = [Student]()
    
    private let studTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(finddiv)
        view.addSubview(searchButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        finddiv.frame = CGRect(x: 40, y: label.bottom + 20, width: view.width - 80, height: 40)
        searchButton.frame = CGRect(x: 40, y: finddiv.bottom + 20, width: view.width - 80, height: 40)
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "notice", for: indexPath)
//        let note = noticeArray[indexPath.row]
//        cell.textLabel?.text = "\(note.title!)\t | \(note.div!)\t |\t \(note.desc!)"
//        //cell.textLabel?.text = "\(emp.name!) \t | \t \(emp.age) \t | \t \(emp.phone!)"
//        return cell
//    }


}
