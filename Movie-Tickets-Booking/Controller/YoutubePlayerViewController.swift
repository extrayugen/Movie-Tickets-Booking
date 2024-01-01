import UIKit
import YouTubeiOSPlayerHelper

class YoutubePlayerViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var introduction: UILabel!
    @IBOutlet weak var playerView: YTPlayerView!
    
    var videoID: String?
    var introductionText: String?
    var loadingIndicator: UIActivityIndicatorView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로딩 인디케이터 설정
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = playerView.center
        playerView.addSubview(indicator)
        loadingIndicator = indicator
        loadingIndicator?.startAnimating()
        
        playerView.backgroundColor = .black
        playerView.delegate = self
        
        introduction.text = introductionText
        
        guard let videoID = videoID else {
            print("videoID is nil")
            return
        }
        
        // YouTube 플레이어에 비디오 ID를 로드합니다.
        playerView.load(withVideoId: videoID)
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        // 비디오 로딩 준비가 완료되면 이전 화면에서 전달받은 인디케이터를 숨깁니다.
        loadingIndicator?.stopAnimating()
        loadingIndicator?.removeFromSuperview()
        
        // 비디오 재생을 시작합니다.
        playerView.playVideo()
    }
}
