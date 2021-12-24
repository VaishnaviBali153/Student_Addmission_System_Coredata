import UIKit

class NewStudentVC: UIViewController {
    
    var student:Student?
    
    private let spidTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "SPID"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "FULL NAME"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()
    
//    private let divTextField:UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "DIVISION"
//        textField.textAlignment = .center
//        textField.borderStyle = .roundedRect
//        textField.backgroundColor = .gray
//        textField.autocorrectionType = .no
//        return textField
//    }()
    
    private let division : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "FY", at: 0, animated: true)
        sc.insertSegment(withTitle: "SY", at: 1, animated: true)
        sc.insertSegment(withTitle: "TY", at: 2, animated: true)
        sc.selectedSegmentIndex = 3
        //sc.backgroundColor = .gray
        sc.tintColor = .black
        sc.layer.cornerRadius = 10
        return sc
    }()
    
    private let phoneTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "PHONE NUMBER"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let passTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "PASSWORD"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        return textField
    }()

    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.addTarget(self, action: #selector(saveStudData), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
         view.addSubview(spidTextField)
         view.addSubview(nameTextField)
         view.addSubview(division)
         view.addSubview(phoneTextField)
         view.addSubview(passTextField)
         view.addSubview(saveButton)
        
        if let stud = student {
            spidTextField.text = String(stud.spid)
            nameTextField.text = stud.name
            //division.setTitle(stud.div, forSegmentAt: division.selectedSegmentIndex)
            phoneTextField.text = stud.phone
            passTextField.text = stud.pass
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        spidTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        nameTextField.frame = CGRect(x: 40, y: spidTextField.bottom + 20, width: view.width - 80, height: 40)
        division.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
        phoneTextField.frame = CGRect(x: 40, y: division.bottom + 20, width: view.width - 80, height: 40)
        passTextField.frame = CGRect(x: 40, y: phoneTextField.bottom + 20, width: view.width - 80, height: 40)
        saveButton.frame = CGRect(x: 40, y: passTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func saveStudData() {
        
        let spid = Int(spidTextField.text!)!
        let name = nameTextField.text!
        let div = division.titleForSegment(at: division.selectedSegmentIndex)!
        let phone = phoneTextField.text!
        let pass = passTextField.text!
        
        if let stud = student {

            // UPDATE
            CoreDataHandler.shared.update(stud: stud, spid: spid, name: name, div: div, phone: phone, pass: pass){
             print("updated data")
            }
        } else {
      // INSERT
            CoreDataHandler.shared.insert(spid: spid, name: name, div: div, phone: phone, pass: pass){
            print("inserted data")
            }
        }
    }
}
