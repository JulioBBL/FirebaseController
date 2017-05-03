//
//  TestViewController.swift
//  FirebaseTest
//
//  Created by Julio Brazil on 02/05/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import CoreLocation

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = FirebaseController.instance
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonWasClicked(_ sender: Any) {
        let firebase = FirebaseController.instance
        let user = Usuario(tia: "31583784", nome: "Julio Brazil", email: "31583784@mackenzista.com.br", dataNascimento: "14/10/1995", foto: "www.google.com", currentLocation: CLLocation())
        firebase.saveUser(user)
    }
    
    @IBAction func otherButtonWasClicked(_ sender: Any) {
        let firebase = FirebaseController.instance
        let users = firebase.getUser(withId: "31583784")
        print(users.nome)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
