//
//  ViewNoteVC.swift
//  Student_Addmission_sys_coredataApp
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewNoteVC: UIViewController {
    
    private var noticeArray = [Notice]()
    
    private let NoticeTable = UITableView()
    
    
    let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleadd))
    
    @objc func handleadd()
    {
        print("hanldeadd")
        let vc = NoticeVc()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noticeArray = CoreDataHandler.shared.noticefetchbydiv(div: "TY")
        NoticeTable.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOTICE"
         view.addSubview(NoticeTable)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NoticeTable.frame = view.bounds
    }
}

extension ViewNoteVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        NoticeTable.register(UITableViewCell.self, forCellReuseIdentifier: "notice")
        NoticeTable.delegate = self
        NoticeTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notice", for: indexPath)
        let nt = noticeArray[indexPath.row]
        cell.textLabel?.text = "\(nt.title!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NoticeDetailVC()
        vc.notice = noticeArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

