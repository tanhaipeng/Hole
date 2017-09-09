//
//  ViewController.swift
//  Todo
//
//  Created by tanhaipeng on 2017/9/9.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit

// 临时数据存储
var todos:[TodoModel] = []
var filters:[TodoModel] = []

func dateFromString(dateStr:String) -> Date?{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: dateStr)
}


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [
        TodoModel(id:"1",image:"children_s",title:"去游乐场",date:dateFromString(dateStr: "2017-09-09")!),
        TodoModel(id:"1",image:"plane_s",title:"去机场",date:dateFromString(dateStr: "2017-07-09")!),
        TodoModel(id:"1",image:"shop_s",title:"去购物",date:dateFromString(dateStr: "2017-08-09")!),
        TodoModel(id:"1",image:"tel_s",title:"打电话",date:dateFromString(dateStr: "2017-06-09")!)]
    
        navigationItem.leftBarButtonItem = editButtonItem
        
        var offset = tableView.contentOffset
        offset.y += (searchDisplayController?.searchBar.frame.size.height)!
        tableView.contentOffset = offset
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == searchDisplayController?.searchResultsTableView{
            return filters.count
        }else{
            return todos.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TodoCell") as! UITableViewCell
        
        var todo:TodoModel
        if tableView == searchDisplayController?.searchResultsTableView{
            todo = filters[indexPath.row]
        }else{
            todo = todos[indexPath.row]
        }
        
        var image = cell.viewWithTag(100) as! UIImageView
        var title = cell.viewWithTag(101) as! UILabel
        var date = cell.viewWithTag(102) as! UILabel
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        let local = NSLocale.current
        let format = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd", options: 0, locale: local)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        date.text = dateFormatter.string(from: todo.date)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            // deletfrom array
            todos.remove(at: indexPath.row)
            //self.tableView.reloadData()
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // edit model
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        tableView.reloadData()
    }
    
    // view之间通信
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="edittodo"{
            var vc = segue.destination as! DetailViewController
            var indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath{
                vc.todoOld = todos[index.row]
            }
        }
        
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool{
        return isEditing
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
    
    
    
    public func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool{
        filters = todos.filter(){
            if let results = $0.title.range(of:searchString!){
                return true
            }
            else{
                return false
            }
        }
        print(filters)
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

