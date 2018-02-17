//
//  GameTableViewController.swift
//  Foosball
//
//  Created by Michael DiGuiseppi on 2/16/18.
//  Copyright © 2018 Michael DiGuiseppi. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var games = [Game]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

       // Load sample games
        loadSampleGames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GameTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GameTableViewCell  else {
                fatalError("The dequeued cell is not an instance of GameTableViewCell.")
        }

        // Configure the cell...
        
        let winnerLogo = UIImage(named: "winner")
        
        let game = games[indexPath.row]
        
        cell.p1_name.text = game.p1_name
        cell.p1_score.text = String(game.p1_score)
        cell.p2_name.text = game.p2_name
        cell.p2_score.text = String(game.p2_score)
        cell.p1_winner.image = game.p1_winner ? winnerLogo : nil
        cell.p2_winner.image = game.p2_winner ? winnerLogo : nil

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: Actions
    @IBAction func unwindToGameList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? GameViewController, let game = sourceViewController.game {
            // add a new game.
            let newIndexPath = IndexPath(row: games.count, section: 0)
            
            games.append(game)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    // MARK: Private Methods
    
    private func loadSampleGames () {
        
//        let winnerLogo = UIImage(named: "winner")
        
        guard let game1 = Game(p1_name: "Mike", p1_score: 10, p2_name: "Alan", p2_score: 5, p1_winner: true, p2_winner: false) else {
            fatalError("Unable to instantiate game1")
        }
        
        guard let game2 = Game(p1_name: "Mike", p1_score: 10, p2_name: "Alan", p2_score: 7, p1_winner: true, p2_winner: false) else {
            fatalError("Unable to instantiate game1")
        }
        
        guard let game3 = Game(p1_name: "Mike", p1_score: 6, p2_name: "Alan", p2_score: 10, p1_winner: false, p2_winner: true) else {
            fatalError("Unable to instantiate game1")
        }
        
        games += [game1, game2, game3]
    }

}
