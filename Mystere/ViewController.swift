//
        /**
        * @author Created by Virgile Broillet 2254878 on 14/11/2025
        * @file ViewController.swift
        * @brief
        *
        * @note Computer Science and Communication Student — University Lumiere Lyon 2
        *
        * @copyright Copyright © 2025 Virgile Broillet 2254878.
        * All rights reserved for studying or personal use.
        */


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var consigne: UILabel!
    @IBOutlet weak var testNombre: UITextField!
    @IBOutlet weak var message: UILabel!
    var mystere : Int=0
    var compteur : Int = 0 // le compteur d'essais
    @IBOutlet weak var ok: UIButton!
    
    @IBOutlet weak var rejouer: UIButton!
    
    @IBAction func boutonRejouer(_ sender: Any) {
        initialiseVue()
    }
    
    func initialiseVue() {
        mystere = Int.random(in: 1...1000)
        // passage du clavier en clavier numérique
        testNombre.keyboardType = .numberPad
        print ("Le nombre à deviner est \(mystere)")
        rejouer.isHidden = true
        // efface le message
        message.text=""
        compteur = 1 // Compteur d'essai réinitialisé
        ok.isEnabled = true // réactiver le bouton OK
    }
    
    @IBAction func clic(_ sender: UIButton) {
        print ("Le bouton a été cliqué")
        let nombre:Int = Int(testNombre.text!) ?? 0
        print("L'utilisateur a saisi la valeur \(nombre)")
        if nombre < mystere {
            message.text = "\(nombre) : trop petit !"
        } else if nombre > mystere {
            message.text = "\(nombre) : trop grand !"
        } else {
            message.text = "Bravo, c'était bien \(nombre) qu'il fallait deviner. Vous avez gagné en \(compteur) essais"
            // fait apparaitre le boutton Rejouer
            rejouer.isHidden = false
            consigne.text = "" // on efface la consigne
            sender.isEnabled = false // le bouton OK est desactivé
        }
        // efface la saisie du champ pour le prochain essai
        testNombre.text = ""
        compteur += 1 // incrémentation du compteur
        consigne.text = "Entrez l'essai numéro \(compteur) :"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialiseVue()
    }


}

