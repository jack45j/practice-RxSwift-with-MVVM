//
//  DetailTableViewCell.swift
//  RxSwift Pracice MVVM List
//
//  Created by 林翌埕 on 2019/3/14.
//  Copyright © 2019 Benson Lin. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CardsTableViewCell: UITableViewCell {
    
    var cardView: CardView!
    
    private(set) var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        /// Prevent multiple subscribe caused by reuse cell.
        disposeBag = DisposeBag()
    }
    
    override func layoutSubviews() {
        cardView.snp.makeConstraints { (constraint) in
            constraint.left.equalTo(16)
            constraint.top.equalTo(6)
            constraint.height.equalTo(222)
            constraint.right.equalTo(-16)
        }
    }
    
    func configure(viewModel: PostViewModel) {
        if cardView == nil {
            cardView = CardView()
            cardView.cardHeaderView.titleLabel.text = viewModel.title
            cardView.cardHeaderView.dateTitleLabel.text = viewModel.timestamp
            cardView.cardBodyView.postTitleLabel.text = viewModel.title
            cardView.cardBodyView.postBodyLabel.text = viewModel.body
            
            self.addSubview(cardView)
        }
    }
    
    func updateComment(commentViewModels: [CommentViewModel]) {
        cardView.cardFooterView.commentButton.setTitle("\(commentViewModels.count)", for: .normal)
    }
}
