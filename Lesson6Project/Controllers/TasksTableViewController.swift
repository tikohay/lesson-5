//
//  TasksTableViewController.swift
//  Lesson6Project
//
//  Created by Karahanyan Levon on 01.07.2021.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    var folder = Folder(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - Setup view
    
    private func setupView() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonTapped))
        
        self.navigationItem.rightBarButtonItem = addButton
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func setupAlertController(completion: @escaping (String) -> (Void)) {
        let alert = UIAlertController(title: "task name", message: "add task", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "add", style: .default) { _ in
            completion(alert.textFields?.first?.text ?? "")
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        alert.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folder.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toVC = TasksTableViewController()
        toVC.folder = folder.tasks[indexPath.row]
        
        navigationController?.pushViewController(toVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = folder.tasks[indexPath.row].name
        
        return cell
    }
    
    @objc func addTaskButtonTapped() {
        setupAlertController { text in
            self.folder.tasks.append(Folder(name: text))
            self.tableView.reloadData()
        }
    }
}
