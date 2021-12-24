import UIKit

class NewNoticeVC: UIViewController {

    var notice:Notice?
    
    private let titleTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "TITLE"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let division : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "FY", at: 0, animated: true)
        sc.insertSegment(withTitle: "SY", at: 1, animated: true)
        sc.insertSegment(withTitle: "TY", at: 2, animated: true)
        sc.selectedSegmentIndex = 3
        //sc.backgroundColor = .
        sc.tintColor = .black
        sc.layer.cornerRadius = 20
        return sc
    }()
        private let descTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "DESCRIPTION"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.addTarget(self, action: #selector(saveNoteData), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleTextField)
        view.addSubview(division)
        view.addSubview(descTextField)
        view.addSubview(saveButton)

        if let note = notice {
            titleTextField.text = note.title
            division.setTitle(note.div, forSegmentAt: division.selectedSegmentIndex)
            descTextField.text  = note.desc
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        division.frame = CGRect(x: 40, y: titleTextField.bottom + 20, width: view.width - 80, height: 40)
        descTextField.frame = CGRect(x: 40, y: division.bottom + 20, width: view.width - 80, height: 40)
        saveButton.frame = CGRect(x: 40, y: descTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    
    @objc private func saveNoteData() {
        
        let title = titleTextField.text!
        let div = division.titleForSegment(at: division.selectedSegmentIndex)!
        let desc = descTextField.text!
        
        if let note = notice {
            
            // UPDATE
            CoreDataHandler.shared.updateNote(title: title, div: div, desc: desc){
                print("updated data") 
            }
        } else {
            // INSERT
            CoreDataHandler.shared.insertNote(title: title, div: div, desc: desc){
                print("inserted data")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
