//
//  ViewController.swift
//  Contact List
//
//  Created by Vinoth Vino on 09/12/17.
//  Copyright © 2017 Vinoth Vino. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showContacts(_ sender: Any) {
        
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        present(contactPicker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        
        contacts.forEach { contact in
            for data in contact.phoneNumbers {
                let phoneNumber = data.value
                print("Your phone number is \(phoneNumber)")
                numberLabel.text = phoneNumber.stringValue
            }
        }
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        
        print("Cancelled the contact picker view controller")
    }
}

