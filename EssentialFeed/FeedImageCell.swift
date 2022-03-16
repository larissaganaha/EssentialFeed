import UIKit

class FeedImageCell: UITableViewCell {
    @IBOutlet private(set) var locationContainer2: UIView!
    @IBOutlet private(set) var locationLabel2: UILabel!
    @IBOutlet private(set) var feedImageView2: UIImageView!
    @IBOutlet private(set) var descriptionLabel2: UILabel!
    @IBOutlet private(set) var feedImageContainer2: UIView!

    public let locationContainer = UIView()
    public let locationLabel = UILabel()
    public let descriptionLabel = UILabel()
    public let feedImageContainer = UIView()
    public let feedImageView = UIImageView()
    public let feedImageRetryButton = UIButton()

    override func awakeFromNib() {
        super.awakeFromNib()
        feedImageView.alpha = 0
        feedImageContainer.startShimmering()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        feedImageView.alpha = 0
        feedImageContainer.stopShimmering()
    }

    func fadeIn(_ image: UIImage?) {
        feedImageView.image = image

        UIView.animate(
            withDuration: 0.3,
            delay: 0.3,
            options: [],
            animations: {
                self.feedImageView.alpha = 1
            },
            completion: { completed in
                if completed {
                    self.feedImageContainer.stopShimmering()
                }
            }
        )
    }
}
