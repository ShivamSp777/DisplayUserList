
import UIKit

class UserTableViewCell: UITableViewCell {
    
 // MARK: - IBOutlets properties 
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(data: UserData) {
        self.profileImage.image = UIImage(named: data.avatar ?? "")
        self.idLabel.text = "ID: \(data.id)"
        self.emailLabel.text = "Email: \(data.email ?? "")"
        self.firstNameLabel.text = "First Name: \(data.first_name ?? "")"
        self.lastNameLabel.text = "Last Name: \(data.last_name ?? "" )"
        self.profileImage.setImage(
            from: data.avatar ?? "",
            placeholder: UIImage(named: "avatarImage")
        )
    }
    
}
