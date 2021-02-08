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
        if dataTextFieldCollection[2].text?.contains("@") == false {
            asteriskLabelCollection[2].textColor = .red
        }else {
            asteriskLabelCollection[2].textColor = .green
        }
        if dataTextFieldCollection[6].text != dataTextFieldCollection[5].text {
            asteriskLabelCollection[6].textColor = .red
        }else {
            asteriskLabelCollection[6].textColor = .green
        }
        
        for i in 0 ... dataTextFieldCollection.count - 1 {
            if i != 2 && i != 6 {
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
        newPlayer.name = dataTextFieldCollection[0].text
        newPlayer.lastName = dataTextFieldCollection[1].text
        newPlayer.email = dataTextFieldCollection[2].text
        newPlayer.age = dataTextFieldCollection[3].text 
        newPlayer.login = dataTextFieldCollection[4].text
        newPlayer.parol = dataTextFieldCollection[5].text
        newPlayer.phoneNumber = dataTextFieldCollection[6].text
        allPlayers?.append(newPlayer)
        try? context.save()
        performSegue(withIdentifier: "pressCodeIdent", sender: nil)
    }
    
    
    
}
