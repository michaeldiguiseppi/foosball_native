//
//  GameViewController.swift
//  Foosball
//
//  Created by Michael DiGuiseppi on 2/15/18.
//  Copyright © 2018 Michael DiGuiseppi. All rights reserved.
//

import UIKit
import os.log

class GameViewController: UIViewController {
    
    
    
    //MARK: Properties
    
    @IBOutlet weak var p1_name: UITextField!
    @IBOutlet weak var p2_name: UITextField!
    @IBOutlet weak var p1_score: UITextField!
    @IBOutlet weak var p2_score: UITextField!
    @IBOutlet weak var p1_winner: UISwitch!
    @IBOutlet weak var p2_winner: UISwitch!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    /*
     This value is either passed by `GameTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new game.
     */
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        p1_winner.setOn(false, animated: false)
        p2_winner.setOn(false, animated: false)
        // Enable the save button only if the text field has valid names/scores
        updateSaveButtonState()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    // this method lets you configure a view controller before it is presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let p1_name_field = p1_name.text ?? ""
        let p2_name_field = p2_name.text ?? ""
        let p1_score_field:Int = Int(p1_score.text!) ?? 0
        let p2_score_field:Int = Int(p2_score.text!) ?? 0
        let p1_winner_field = p1_winner.isOn
        let p2_winner_field = p2_winner.isOn
        
        game = Game(p1_name: p1_name_field, p1_score: p1_score_field, p2_name: p2_name_field, p2_score: p2_score_field, p1_winner: p1_winner_field, p2_winner: p2_winner_field)
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
//    func textFieldDidChange(_ textField: UITextField) {
//        os_log("done editing", log: OSLog.default, type: .debug)
//        updateSaveButtonState()
//    }
    
    //MARK: Actions
    
    @IBAction func p1_wins(_ sender: UISwitch) {
        if p1_winner.isOn {
            updateSaveButtonState()
            p2_winner.setOn(false, animated: true)
        } else {
            updateSaveButtonState()
            p2_winner.setOn(true, animated: true)
        }
    }
    
    @IBAction func p2_wins(_ sender: UISwitch) {
        if p2_winner.isOn {
            updateSaveButtonState()
            p1_winner.setOn(false, animated: true)
        } else {
            updateSaveButtonState()
            p1_winner.setOn(true, animated: true)
        }
    }
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the save button if the text field is empty
        let p1_name_field = p1_name.text ?? ""
        let p2_name_field = p2_name.text ?? ""
        let p1_score_field = p1_score.text ?? "0"
        let p2_score_field = p2_score.text ?? "0"
        let p1_winner_field = p1_winner.isOn
        let p2_winner_field = p2_winner.isOn
       
        saveButton.isEnabled = !p1_name_field.isEmpty && !p2_name_field.isEmpty && !p1_score_field.isEmpty && !p2_score_field.isEmpty && (!p1_winner_field || !p2_winner_field)
    }

}

