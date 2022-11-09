//
//  TaskListViewController.swift
//  CoreDataDemo
//
//  Created by iFARA💻 on 07.11.2022.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    private let cellID = "cell"
    private var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    //MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    private func setupView() {
        view.backgroundColor = .white
        sutupNavigationBar()
    }
    
    private func sutupNavigationBar() {
        title = "Task List"
        
        //Set large title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13.0, *){
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            
            let titleTextAttributes: [NSAttributedString.Key : Any] = [.foregroundColor : UIColor.white]
            navBarAppearance.titleTextAttributes = titleTextAttributes
            navBarAppearance.largeTitleTextAttributes = titleTextAttributes
            
            navBarAppearance.backgroundColor = UIColor(
                red: 21/255,
                green: 101/255,
                blue: 192/255,
                alpha: 194/255
            )
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
        }
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(addNewTask)
            )
        navigationController?.navigationBar.tintColor = .white
        }
        
        @objc private func addNewTask() {
            showAlert(title: "New Fucking Task", message: "What do you want to do?")
//            let newTaskViewController = NewTaskViewController()
//            present(newTaskViewController, animated: true)
        }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let task = alert.textFields?.first?.text, !task.isEmpty else {
                print("The text field is empty")
                return
            }
            self.tasks.append(task)
            let cellIndex = IndexPath(row: self.tasks.count - 1, section: 0)
            self.tableView.insertRows(at: [cellIndex], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
    

