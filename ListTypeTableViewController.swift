//
//  ListTypeTableViewController.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/27/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//
// ok ok
import UIKit

class ListTypeTableViewController: UITableViewController {
    
    var listType = [ListTypeModel]()
    var urlString = ""
    var dataToSendViaListButton = Int()
    var dataToSend = Int()
    
    @IBOutlet var listTypeView: UITableView!

    
    @IBAction func listButton(_ sender: UIButton) {
        dataToSendViaListButton = sender.tag
    }
    @IBAction func maps(_ sender: UIButton) {
        dataToSend = sender.tag
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        listTypeView.delegate = self
        listTypeView.dataSource = self
        let element1 = ListTypeModel(name: "Restaurant", value: 0)
        listType.append(element1)
        let element2 = ListTypeModel(name: "Hopital", value: 1)
        listType.append(element2)
        let element3 = ListTypeModel(name: "School", value: 2)
        listType.append(element3)
        let element4 = ListTypeModel(name: "Hotel", value: 3)
        listType.append(element4)
        let element5 = ListTypeModel(name: "Museum", value: 4)
        listType.append(element5)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listType.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfListType", for: indexPath) as! ListTypeTableViewCell
        cell.list.tag = indexPath.row
        cell.maps.tag = indexPath.row
        let nameTypeCell = listType[indexPath.row]
        cell.setDataForCellType(name: nameTypeCell.nameType)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "connectToListDetail"){
            let secondViewController = segue.destination as! ListDetailTableViewController
            secondViewController.dataFromListType = self.dataToSendViaListButton
        }
        if (segue.identifier == "showMapsNear"){
            let nextViewController = segue.destination as! MapsNearbyViewController
            nextViewController.dataRecevie = self.dataToSend
            
        }
        
       
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

}
