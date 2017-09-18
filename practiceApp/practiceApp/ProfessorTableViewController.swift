//
//  ProfessorTableViewController.swift
//  practiceApp
//
//  Created by Korman Chen on 9/16/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit

class ProfessorTableViewController: UITableViewController {

    //Mark: Properties
    var professors = [Professor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Load sample data
        loadSampleProfessors()
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
        
        return professors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProfessorTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProfessorTableViewCell else
        {
            fatalError("The deequeued cell is not an instance of ProfessorTableViewCell")
        }
        
        let professor = professors[indexPath.row]

        cell.professorNameLabel.text = professor.name
        cell.professorImageView.image = professor.photo
        cell.professorRatingControl.rating = professor.rating
        

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
    
    //Mark: Actions
    @IBAction func unwindToProfessorList(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? ProfessorViewController, let Professor = sourceViewController.ccsfProf {
            
            let newIndexPath = IndexPath(row: professors.count, section: 0)
            professors.append(Professor)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    //Mark: Private Functions
    private func loadSampleProfessors()
    {
        let photo1 = UIImage(named: "KitKat")
        let photo2 = UIImage(named: "Dog")
        
        guard let prof1 = Professor(name: "KitKat", photo: photo1, rating: 4) else
        {
            fatalError("Unable to instantiate professor")
        }
        
        guard let prof2 = Professor(name: "Dog", photo: photo2, rating: 5) else
        {
            fatalError("Unable to instantiate professor")
        }
        
        professors += [prof1, prof2]
    }
}
