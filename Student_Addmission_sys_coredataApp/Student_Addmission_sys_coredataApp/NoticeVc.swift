//
//  NoticeVc.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NoticeVc: UIViewController {
    
     private let noticetableview = UITableView()
    
    private var noticeArray = [Notice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOTICE"
        view.addSubview(noticetableview)

        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddNewNotice))
        navigationItem.setRightBarButton(addItem, animated: true)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noticeArray = CoreDataHandler.shared.fetchNote()
        noticetableview.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noticetableview.frame = view.bounds
    }
    
    @objc private func AddNewNotice() {
        let vc = NewNoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NoticeVc: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        noticetableview.register(UITableViewCell.self, forCellReuseIdentifier: "notice")
        noticetableview.delegate = self
        noticetableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notice", for: indexPath)
        let note = noticeArray[indexPath.row]
        cell.textLabel?.text = "\(note.title!)\t | \(note.div!)\t |\t \(note.desc!)"
        //cell.textLabel?.text = "\(emp.name!) \t | \t \(emp.age) \t | \t \(emp.phone!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NewNoticeVC()
        vc.notice = noticeArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      
        let note = noticeArray[indexPath.row]
        CoreDataHandler.shared.deleteNote(note:note){
            self.noticeArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


