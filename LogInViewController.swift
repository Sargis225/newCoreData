//
//  LogInViewController.swift
//  newCoreData
//
//  Created by Saq on 2/4/21.
//

import UIKit
import CoreData

class LogInViewController: UIViewController {

    @IBOutlet var asteriskLabelCollection: [UILabel]!
    @IBOutlet var phoneNumberAsteriksLabel: UILabel!
    @IBOutlet var dataTextFieldCollection: [UITextField]!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    var firstNameIndex = 0
    var lastNameIndex = 1
    var emailIndex = 2
    var ageIndex = 3
    var logIndex = 4
    var paswordIndex = 5
    var confirmPasIndex = 6
    var phoneNumbIndex = 7
    
    let request:NSFetchRequest<Player> = NSFetchRequest<Player>(entityName: "Player")
    var allPlayers:[Player]?
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        cellAppDelegate()
    }
    
    func configureButton() {
        registerButton.layer.cornerRadius = 20
    }
    
    
    func cellAppDelegate() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            self.context = context
            allPlayers = try? context.fetch(request)
        } else {
            fatalError("can not create context")
        }
    }
    
    
    
    
    @IBAction func dataTextFieldsChanged(_ sender: UITextField) {
        if dataTextFieldCollection[emailIndex].text?.contains("@") == false {
            asteriskLabelCollection[emailIndex].textColor = .red
        }else {
            asteriskLabelCollection[emailIndex].textColor = .green
        }
        if dataTextFieldCollection[confirmPasIndex].text != dataTextFieldCollection[paswordIndex].text {
            asteriskLabelCollection[confirmPasIndex].textColor = .red
        }else {
            asteriskLabelCollection[confirmPasIndex].textColor = .green
        }
        
        for i in 0 ... dataTextFieldCollection.count - 1 {
            if i != emailIndex && i != confirmPasIndex {
                if (dataTextFieldCollection[i].text?.count ?? 0) > 3 {
                    asteriskLabelCollection[i].textColor = .green
                }
            }
        }
    }
    
    @IBAction func phoneNumberTextFieldChanged(_ sender: UITextField) {
        guard (sender.text?.count ?? 0) == 8  else  {return}
        phoneNumberAsteriksLabel.textColor = .green
    }
    
    @IBAction func regiterButtonPressed(_ sender: UIButton) {
        for i in 0...asteriskLabelCollection.count - 1 {
            if asteriskLabelCollection[i].textColor == .green{
            }
            else {
                return
            }
        }
        let newPlayer = Player(context: context)
        newPlayer.name = dataTextFieldCollection[firstNameIndex].text
        newPlayer.lastName = dataTextFieldCollection[lastNameIndex].text
        newPlayer.email = dataTextFieldCollection[emailIndex].text
        newPlayer.age = dataTextFieldCollection[ageIndex].text
        newPlayer.login = dataTextFieldCollection[logIndex].text
        newPlayer.parol = dataTextFieldCollection[paswordIndex].text
        newPlayer.phoneNumber = dataTextFieldCollection[phoneNumbIndex].text
        allPlayers?.append(newPlayer)
        try? context.save()
        performSegue(withIdentifier: "pressCodeIdent", sender: nil)
    }
    
    
    
}
