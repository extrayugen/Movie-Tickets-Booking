import Foundation
import UIKit


class TicketViewController: UIViewController, UITableViewDataSource
{

    @IBOutlet weak var ticketTableView: UITableView!
    
    var selectedMovie: MovieInfo?
    
    // MARK: - Ticket View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "영화 내역"
        
        ticketTableView.delegate = self
        ticketTableView.dataSource = self
    }
    
    
    @IBAction func timeButtonTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        
        //사용자가 선택한 영화정보 업데이트
        selectedMovie = movie[tag - 1]
        
        switch selectedMovie {
        case let  movieInfo?:
            print("영화제목: \(movieInfo.title), 예매시간: \(movieInfo.time01), 인원수: \(movieInfo.people), 가격: \(movieInfo.price)")
        case nil:
            print("No movie selected.")
        }
        
    }
    
}

extension TicketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movie[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.iconImageView.image = UIImage(named: movie.movieImage)
        cell.title.text = movie.title

        //cell.timeButton01.text = movie.time01
        //cell.timeButton02.text = movie.time02
        //cell.timeButton03.text = movie.time03
        
        cell.indentationWidth = 150
        //cell.textLabel?.text = movie[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
