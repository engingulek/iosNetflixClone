//
//  HeroHeaderUIView.swift
//  NetflixClone
//
//  Created by engin gülek on 4.09.2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    
    
    private let dowloandsButton : UIButton = {
       let button = UIButton()
        button.setTitle("Dowloands", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
        
    
    private let playButton : UIButton = {
        let button = UIButton()
        button.setTitle("Play",for: .normal )
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    
    private let heroImageView : UIImageView = {
      let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds =  true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(dowloandsButton)
        applyConstraints()
        
    }
    
    private func applyConstraints(){
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let dowloandsButtonConstraints = [
            dowloandsButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -90),
            dowloandsButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            dowloandsButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(dowloandsButtonConstraints)

        
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
