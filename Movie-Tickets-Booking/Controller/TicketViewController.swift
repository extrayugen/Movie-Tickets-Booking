import Foundation
import UIKit


class TicketViewController: UIViewController
{

    @IBOutlet weak var ticketTableView: UITableView!
    
    var selectedMovie: MovieInfo?
    
    var movie: [MovieInfo] = [
        MovieInfo(title: "서울의 봄", time: "10:00", people: 0, price: 7000, movieImage: UIImage.movie01),
        MovieInfo(title: "서울의 봄", time: "12:00", people: 0, price: 7000, movieImage: UIImage.movie01),
        MovieInfo(title: "서울의 봄", time: "14:00", people: 0, price: 7000, movieImage: UIImage.movie01),
        MovieInfo(title: "노량", time: "10:00", people: 0, price: 7000, movieImage: UIImage.movie02),
        MovieInfo(title: "노량", time: "12:00", people: 0, price: 7000, movieImage: UIImage.movie02),
        MovieInfo(title: "노량", time: "14:00", people: 0, price: 7000, movieImage: UIImage.movie02),
        MovieInfo(title: "짱구는 못말려 극장판", time: "10:00", people: 0, price: 7000, movieImage: UIImage.movie03),
        MovieInfo(title: "짱구는 못말려 극장판", time: "12:00", people: 0, price: 7000, movieImage: UIImage.movie03),
        MovieInfo(title: "짱구는 못말려 극장판", time: "14:00", people: 0, price: 7000, movieImage: UIImage.movie03)
        
    ]
    
    
    // MARK: - Ticket View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ticketTableView.delegate = self
        ticketTableView.dataSource = self
    }
    
    
    @IBAction func timeButtonTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        
        //사용자가 선택한 영화정보 업데이트
        selectedMovie = movie[tag - 1]
        
        switch selectedMovie {
        case let  movieInfo?:
            print("영화제목: \(movieInfo.title), 예매시간: \(movieInfo.time), 인원수: \(movieInfo.people), 가격: \(movieInfo.price)")
        case nil:
            print("No movie selected.")
        }
        
    }
    
}

extension TicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //cell.textLabel?.text = movie[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }

    
}
