//
//  StudentListVC.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentListVC: UIViewController {
    
    private var studArray = [Student]()
    
    private let studTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studArray = CoreDataHandler.shared.fetch()
        studTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "STUDENT"
        view.addSubview(studTableView)
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewStudent))
        navigationItem.setRightBarButton(addItem, animated: true)
        setupTableView()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        studTableView.frame = view.bounds
    }
    
    @objc private func addNewStudent() {
        let vc = NewStudentVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension StudentListVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        studTableView.register(UITableViewCell.self, forCellReuseIdentifier: "stud")
        studTableView.delegate = self
        studTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stud", for: indexPath)
        let stud = studArray[indexPath.row]
        cell.textLabel?.text = "\(stud.spid) | \(stud.name!) | \(stud.div!) | \(stud.phone!) | \(stud.pass!)"
        //cell.textLabel?.text = "\(emp.name!) \t | \t \(emp.age) \t | \t \(emp.phone!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NewStudentVC()
        vc.student = studArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let stud = studArray[indexPath.row]
        CoreDataHandler.shared.delete(stud: stud){
            self.studArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

