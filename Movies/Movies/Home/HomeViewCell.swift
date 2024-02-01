//
//  HomeViewCell.swift
//  Movies
//
//  Created by Nikolai Maksimov on 01.02.2024.
//

import UIKit

final class HomeViewCell: UICollectionViewCell {
    
    static let identifier = "HomeViewCell"
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .cyan
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        posterImageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
