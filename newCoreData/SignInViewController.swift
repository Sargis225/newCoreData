//
//  SignInViewController.swift
//  newCoreData
//
//  Created by Saq on 2/4/21.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var paswordTextField: UITextField!
    
    let request:NSFetchRequest<Player> = NSFetchRequest<Player>(entityName: "Player")
    var allPlayers:[Player]?
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellAppDelegate()
        
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
    
    
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        for i in allPlayers! {
            if ((i.login?.contains("\(loginTextField.text ?? "")")) != nil) && ((i.parol?.contains(paswordTextField.text ?? "")) != nil) {
            }
            else {
                print("stugeq parol@ kam loginy")
            }
        }
        performSegue(withIdentifier: "profilIdent", sender: nil)

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
