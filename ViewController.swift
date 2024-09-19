import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var taskTextField: UITextField!

    let taskManager = TaskManager()
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }

    @IBAction func addTask(_ sender: Any) {
        if let task = taskTextField.text, !task.isEmpty {
            taskManager.addTask(task)
            tasks = taskManager.tasks as! [String]
            taskTableView.reloadData()
            taskTextField.text = ""
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskManager.removeTaskAtIndex(indexPath.row)
        tasks = taskManager.tasks as! [String]
        tableView.reloadData()
    }
}
