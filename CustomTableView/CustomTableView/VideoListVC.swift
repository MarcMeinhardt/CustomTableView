//
//  VideoListVC.swift
//  CustomTableView
//
//  Created by Marc Meinhardt on 17.01.20.
//  Copyright © 2020 Marc Meinhardt. All rights reserved.
//

import UIKit

class VideoListVC: UIViewController {

    var tableView = UITableView()
    var videos: [Video] = []

    // Creates a system to avoid the use of strings in the entirety of the code
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sean's Videos"
        videos = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        // set delegates
        // set row height
        // register cells
        // set constraints
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    // Configure how many cells are shown
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // Configure what cells are shown
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cast as VideoCell to have access to the function of VideoCell
        // dequeueReusableCell is used to configure cells just before they appear on the devices screen
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}


// Generating dummy data. Where this data gets created is likely to be different in a real app. Likely from a network call
extension VideoListVC {
    
    func fetchData() -> [Video] {
        let video1  = Video(image: Images.noStoryboard, title: "No Storyboard")
        let video2  = Video(image: Images.softSkills, title: "5 Soft Skill For Developers")
        let video3  = Video(image: Images.xcode, title: "What's New in Xcode 11")
        let video4  = Video(image: Images.patreon, title: "Patreon Revamp")
        let video5  = Video(image: Images.raise, title: "How I Got a Raise")
        let video6  = Video(image: Images.shake, title: "Shake Gesture")
        let video7  = Video(image: Images.salaries, title: "2019 State of Salaries")
        let video8  = Video(image: Images.wireless, title: "How To Build Your App Wirelessly")
        let video9  = Video(image: Images.swiftNews, title: "Swift News 70")
        let video10 = Video(image: Images.ninety, title: "The 90/90 Rule")
        
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
}
