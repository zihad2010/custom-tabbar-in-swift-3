//
//  CustomTabbarView.swift
//  Custom Tabbar
//
//  Created by Steve JobsOne on 5/17/17.
//  Copyright © 2017 Steve JobsOne. All rights reserved.
//

import UIKit

class CustomTabbarView: UIView {
    
    //public variable.............
    
    public var unselectedimageArray = [String]()
    public var selectedImageArray = [String]()
    public var tabbarTitleArray = [String]()
    
    public var tabbarFontName:String?
    
    public var tabbarFrontSize:CGFloat?
    public var tabbarHeight:CGFloat?
    public var tabbarUperLineHeight:CGFloat?
    public var topSpaceButtonImageView:CGFloat?
    public var titleSpaceFromButonImage:CGFloat?
    
    public var backGroundViewColor:UIColor?
    public var unSelectedTabbarUperLineColor:UIColor?
    public var selectedTabbarViewColor:UIColor?
    public var selectedTabbarUperLineColor:UIColor?
    
    public var seletedTabbarTitleColor:UIColor?
    public var unSeletedTabbarTitleColor:UIColor?
    
    //private variable.............
    
    private var currentSelectedIndex:Int? = 0
    private let screenWidth:CGFloat = UIScreen.main.bounds.size.width
    private let backGroundImageView = UIImageView()
    private let imageViewforUnSelectedtabuperView = UIImageView()
    private let imageViewforSelected = UIImageView()
    
    private var imageViewforSelectedtabuperView:UIImageView?
    private var imageViewforSelectedBackground:UIImageView?
    private var imageViewforSelectedBlur:UIImageView?
    private var buttonTitleLabel:UILabel?
    
    override init(frame: CGRect) {
        
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    public func customTabbar(withTabbar:UITabBar) {
        
        setlLayoutForbackGroundImageView(withTabbar: withTabbar)
        setlLayoutimageViewforUnSelectedtabuperView()
        
        for i in 0..<unselectedimageArray.count {
            
            let img:UIImage = UIImage(named: unselectedimageArray[i])!
            let imgHeight:CGFloat = img.size.height
            
            tabbarItemImageView(WithimageName: unselectedimageArray[i], buttonTag: i, xPosition: CGFloat(screenWidth / CGFloat(unselectedimageArray.count)) * CGFloat(i), width: (screenWidth / CGFloat(unselectedimageArray.count)), height: imgHeight)
            
            tabbarItemTitle(titleName: tabbarTitleArray[i], xPosition:CGFloat(screenWidth / CGFloat(unselectedimageArray.count)) * CGFloat(i), yPosition: titleSpaceFromButonImage! + imgHeight , width: (screenWidth / CGFloat(unselectedimageArray.count)), height: 21)
            
            setRightIndexPositionSeletedView(index: currentSelectedIndex!)
        }
    }
    
    func setRightIndexPositionSeletedView(index:Int) {
        
        currentSelectedIndex = index
        selectedIndexSetUperView(xPosition: CGFloat(screenWidth / CGFloat(unselectedimageArray.count)),screenWidth: screenWidth, index: currentSelectedIndex!)
        selectedIndexSetBackgroundBlurView(xPosition: CGFloat(screenWidth / CGFloat(unselectedimageArray.count)),screenWidth: screenWidth, index: currentSelectedIndex!)
        selectedIndexSetBlurView(xPosition: CGFloat(screenWidth / CGFloat(unselectedimageArray.count)),screenWidth: screenWidth, index: currentSelectedIndex!)
        selectedIndexSetBlurlabel(xPosition: CGFloat(screenWidth / CGFloat(unselectedimageArray.count)),screenWidth: screenWidth, index: currentSelectedIndex!)
        
    }
    
    private func selectedIndexSetUperView(xPosition:CGFloat,screenWidth:CGFloat,index:Int){
        
        
        imageViewforSelectedtabuperView?.isHidden = true
        imageViewforSelectedtabuperView = UIImageView()
        
        imageViewforSelectedtabuperView?.translatesAutoresizingMaskIntoConstraints = false
        imageViewforSelectedtabuperView?.backgroundColor = selectedTabbarUperLineColor
        backGroundImageView.addSubview(imageViewforSelectedtabuperView!)
        
        imageViewforSelectedtabuperView?.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: xPosition * CGFloat(currentSelectedIndex!)).isActive = true
        imageViewforSelectedtabuperView?.topAnchor.constraint(equalTo: backGroundImageView.topAnchor, constant: 0).isActive = true
        imageViewforSelectedtabuperView?.widthAnchor.constraint(equalToConstant: screenWidth/CGFloat(unselectedimageArray.count)).isActive = true
        imageViewforSelectedtabuperView?.heightAnchor.constraint(equalToConstant: tabbarUperLineHeight!).isActive = true
        
    }
    
    private func selectedIndexSetBackgroundBlurView(xPosition:CGFloat,screenWidth:CGFloat,index:Int){
        
        imageViewforSelectedBackground?.isHidden = true
        
        imageViewforSelectedBackground = UIImageView()
        imageViewforSelectedBackground?.translatesAutoresizingMaskIntoConstraints = false
        imageViewforSelectedBackground?.backgroundColor = selectedTabbarViewColor
        backGroundImageView.addSubview(imageViewforSelectedBackground!)
        
        imageViewforSelectedBackground?.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: xPosition * CGFloat(currentSelectedIndex!)).isActive = true
        imageViewforSelectedBackground?.topAnchor.constraint(equalTo: backGroundImageView.topAnchor, constant: tabbarUperLineHeight!).isActive = true
        imageViewforSelectedBackground?.widthAnchor.constraint(equalToConstant: screenWidth/CGFloat(unselectedimageArray.count)).isActive = true
        imageViewforSelectedBackground?.heightAnchor.constraint(equalToConstant: tabbarHeight!).isActive = true
        
    }
    
    private func selectedIndexSetBlurView(xPosition:CGFloat,screenWidth:CGFloat,index:Int){
        
        let img:UIImage = UIImage(named: selectedImageArray[index])!
        let imgHeight:CGFloat = img.size.height
        
        imageViewforSelectedBlur?.isHidden = true
        imageViewforSelectedBlur = UIImageView()
        imageViewforSelectedBlur?.translatesAutoresizingMaskIntoConstraints = false
        imageViewforSelectedBlur?.backgroundColor = selectedTabbarViewColor
        imageViewforSelectedBlur?.image = UIImage(named: selectedImageArray[index])!
        
        imageViewforSelectedBlur?.contentMode = UIViewContentMode.scaleAspectFit
        backGroundImageView.addSubview(imageViewforSelectedBlur!)
        
        imageViewforSelectedBlur?.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: xPosition * CGFloat(currentSelectedIndex!)).isActive = true
        imageViewforSelectedBlur?.topAnchor.constraint(equalTo: backGroundImageView.topAnchor, constant: topSpaceButtonImageView!).isActive = true
        imageViewforSelectedBlur?.widthAnchor.constraint(equalToConstant: screenWidth/CGFloat(unselectedimageArray.count)).isActive = true
        imageViewforSelectedBlur?.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
        
    }
    
    private func selectedIndexSetBlurlabel(xPosition:CGFloat,screenWidth:CGFloat,index:Int){
        
        let img:UIImage = UIImage(named: unselectedimageArray[index])!
        let imgHeight:CGFloat = img.size.height
        
        let font = UIFont (name:tabbarFontName!, size:tabbarFrontSize!)
        
        buttonTitleLabel?.isHidden = true
        buttonTitleLabel = UILabel()
        
        buttonTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        buttonTitleLabel?.text = tabbarTitleArray[index]
        buttonTitleLabel?.textColor = seletedTabbarTitleColor
        buttonTitleLabel?.textAlignment = .center
        buttonTitleLabel?.font =  font
        backGroundImageView.addSubview(buttonTitleLabel!)
        
        buttonTitleLabel?.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: xPosition * CGFloat(currentSelectedIndex!)).isActive = true
        buttonTitleLabel?.topAnchor.constraint(equalTo: backGroundImageView.topAnchor, constant:titleSpaceFromButonImage! + imgHeight ).isActive = true
        buttonTitleLabel?.widthAnchor.constraint(equalToConstant: screenWidth/CGFloat(unselectedimageArray.count)).isActive = true
        buttonTitleLabel?.heightAnchor.constraint(equalToConstant: 21).isActive = true
    
    }
    
    private func tabbarItemImageView(WithimageName:String,buttonTag:Int,xPosition:CGFloat,width:CGFloat,height:CGFloat) {
        
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: unselectedimageArray[buttonTag])!
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        backGroundImageView.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: xPosition).isActive = true
        imageView.topAnchor.constraint(equalTo: backGroundImageView.topAnchor, constant:topSpaceButtonImageView!).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    private func tabbarItemTitle(titleName:String,xPosition:CGFloat,yPosition:CGFloat,width:CGFloat,height:CGFloat) {
        
        let font = UIFont (name: tabbarFontName!, size: tabbarFrontSize!)
        
        let buttonTitleLabel = UILabel()
        
        buttonTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonTitleLabel.text = titleName
        buttonTitleLabel.textColor = unSeletedTabbarTitleColor
        buttonTitleLabel.textAlignment = .center
        buttonTitleLabel.font =  font
        
        backGroundImageView.addSubview(buttonTitleLabel)
        
        buttonTitleLabel.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: xPosition).isActive = true
        buttonTitleLabel.topAnchor.constraint(equalTo: backGroundImageView.topAnchor, constant:yPosition).isActive = true
        buttonTitleLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        buttonTitleLabel.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    private func setlLayoutForbackGroundImageView(withTabbar:UITabBar) {
        
        backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.backgroundColor = backGroundViewColor!
        withTabbar.addSubview(backGroundImageView)
        backGroundImageView.leadingAnchor.constraint(equalTo: withTabbar.leadingAnchor).isActive = true
        backGroundImageView.topAnchor.constraint(equalTo: withTabbar.topAnchor).isActive = true
        backGroundImageView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        backGroundImageView.heightAnchor.constraint(equalToConstant: tabbarHeight!).isActive = true
        
    }
    
    private func setlLayoutimageViewforUnSelectedtabuperView() {
        
        imageViewforUnSelectedtabuperView.translatesAutoresizingMaskIntoConstraints = false
        imageViewforUnSelectedtabuperView.backgroundColor = unSelectedTabbarUperLineColor!
        backGroundImageView.addSubview(imageViewforUnSelectedtabuperView)
        imageViewforUnSelectedtabuperView.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor).isActive = true
        imageViewforUnSelectedtabuperView.topAnchor.constraint(equalTo: backGroundImageView.topAnchor).isActive = true
        imageViewforUnSelectedtabuperView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        imageViewforUnSelectedtabuperView.heightAnchor.constraint(equalToConstant: tabbarUperLineHeight!).isActive = true
        
    }
}
