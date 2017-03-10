import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func setNotification(_ sender: UIButton) {

        let seconds = Int(segment.titleForSegment(at: segment.selectedSegmentIndex)!)!

        // ------------------------------------
        // 通知の発行: タイマーを指定して発行
        // ------------------------------------

        // content
        let content = UNMutableNotificationContent()
        content.title = "It's time."
        content.subtitle = "\(seconds) seconds elapsed!"
        content.body = "I told you now because you had set \(seconds) seconds before."
        content.sound = UNNotificationSound.default()

        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(seconds),
                                                        repeats: false)

        // request includes content & trigger
        let request = UNNotificationRequest(identifier: "TIMER\(seconds)",
                                            content: content,
                                            trigger: trigger)

        // schedule notification by adding request to notification center
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
