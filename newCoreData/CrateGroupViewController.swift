//
//  CrateGroupViewController.swift
//  newCoreData
//
//  Created by Saq on 2/8/21.
//

import UIKit
import CoreData
class CrateGroupViewController: UIViewController {

    
    @IBOutlet var crewNameTextField: UITextField!
    @IBOutlet var playersCountTextField: UITextField!
    @IBOutlet var privateOrPublickSwitch: UISwitch!
    let request:NSFetchRequest<Crew> = NSFetchRequest<Crew>(entityName: "Crew")
    let requestPlayer:NSFetchRequest<Player> = NSFetchRequest<Player>(entityName: "Player")
    var allGroup:[Crew]?
    var context:NSManagedObjectContext!
    var switchOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellAppDelegate()
    }
    
    func cellAppDelegate() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            self.context = context
            allGroup = try? context.fetch(request)
        } else {
            fatalError("can not create context")
        }
    }
    
    @IBAction func addGroupButtonPressed(_ sender: UIButton) {
        let newGroup = Crew(context: context)
        newGroup.playersCount = Int16(playersCountTextField.text ?? "") ?? 0
        if privateOrPublickSwitch.isOn == true {
            switchOn = true
        }else {
            switchOn = false
        }
        newGroup.privateOrPublic = switchOn
    }
    

   

}
