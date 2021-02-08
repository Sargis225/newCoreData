//
//  CrewViewController.swift
//  newCoreData
//
//  Created by Saq on 2/4/21.
//

import UIKit
import CoreData
class PlayerPageViewController: UIViewController {

    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    let request:NSFetchRequest<Player> = NSFetchRequest<Player>(entityName: "Player")
    var allPlayers:[Player]?
    var context:NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellAppDelegate()
        ageLabel.text = allPlayers?[0].age
        firstNameLabel.text = allPlayers?[0].name
        lastNameLabel.text = allPlayers?[0].lastName
        loginLabel.text = allPlayers?[0].login 
    
        // Do any additional setup after loading the view.
    }
    func cellAppDelegate() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            self.context = context
            allPlayers = try? context.fetch(request)
        } else {
            fatalError("can not create context")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
