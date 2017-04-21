//
//  CommentCellTableViewCell.swift
//  Podcast
//
//  Created by Mark Bryan on 4/12/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

protocol CommentsTableViewCellDelegate {
    func commentCellDidPressLikeButton(cell: CommentsTableViewCell)
    func commentCellDidPressRepliesButton(cell: CommentsTableViewCell)
}

class CommentsTableViewCell: UITableViewCell {
    let minimumHeight: CGFloat = 200
    let imageViewSize: CGSize = CGSize(width: 30, height: 30)
    let marginSpacing: CGFloat = 18
    let padding: CGFloat = 12
    let leftInset: CGFloat = 60
    let topInset: CGFloat = 33
    let bottomSpacing: CGFloat = 12
    let likeButtonInset: CGFloat = 150
    
    var commenterImageView: UIImageView!
    var commenterNameLabel: UILabel!
    var timeLabel: UILabel!
    var commentLabel: UILabel!
    var createdDateLabel: UILabel!
    var likeButton: UIButton!
    var repliesButton: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.colorFromCode(0xfcfcfe)
        frame.size.height = minimumHeight
        
        commenterImageView = UIImageView(frame: CGRect(origin: CGPoint.init(x: marginSpacing, y: marginSpacing), size: imageViewSize))
        commenterImageView.layer.cornerRadius = imageViewSize.height/2
        commenterImageView.clipsToBounds = true
        addSubview(commenterImageView)
        
        commenterNameLabel = UILabel(frame: CGRect(x: commenterImageView.frame.maxX + padding, y: marginSpacing, width: 0, height: 0))
        commenterNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        addSubview(commenterNameLabel)
        
        timeLabel = UILabel(frame: .zero)
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = UIColor.colorFromCode(0x32968f)
        addSubview(timeLabel)
        
        commentLabel = UILabel(frame: CGRect(x: leftInset, y: topInset, width: frame.size.width - leftInset - marginSpacing, height: 0))
        commentLabel.font = UIFont.systemFont(ofSize: 14)
        commentLabel.textColor = UIColor.colorFromCode(0x494949)
        commentLabel.lineBreakMode = .byWordWrapping
        commentLabel.numberOfLines = 0

        addSubview(commentLabel)
        
        createdDateLabel = UILabel(frame: CGRect(x: leftInset, y: 0, width: 0, height: 0))
        createdDateLabel.font = UIFont.systemFont(ofSize: 12)
        createdDateLabel.textColor = UIColor.colorFromCode(0x64676c)
        addSubview(createdDateLabel)
        
        likeButton = UIButton(frame: CGRect(x: likeButtonInset, y: 0, width: 0, height: 0))
        likeButton.titleLabel?.text = "Like"
        likeButton.sizeToFit()
        addSubview(likeButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupForComment(comment: Comment) {
        commenterImageView.image = #imageLiteral(resourceName: "sample_profile_pic")
        
        commenterNameLabel.text = comment.creator
        commenterNameLabel.sizeToFit()
        
        timeLabel.text = "@ \(comment.time)"
        timeLabel.sizeToFit()
        timeLabel.frame.origin = CGPoint(x: commenterNameLabel.frame.maxX + 2, y: marginSpacing)
        
        commentLabel.text = comment.text
        commentLabel.sizeToFit()
        
        createdDateLabel.text = comment.creationDate
        createdDateLabel.sizeToFit()
        createdDateLabel.frame.origin.y = commentLabel.frame.maxY + 3
        
        likeButton.frame.origin.y = createdDateLabel.frame.origin.y
        
        frame.size.height = createdDateLabel.frame.maxY + bottomSpacing
    }
    
    override func prepareForReuse() {
        // TODO
    }

}
