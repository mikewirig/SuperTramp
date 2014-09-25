//
//  VideosController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 9/18/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit


let reuseIdentifier = "VidCell"
var images = [UIImage]()
var titles = [String]()
var dates = [String]()
var durs = [String]()
var favorites = [String]()
var videos = [AnyObject]()


class VideosController: UICollectionViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //PFRequest pulls all video objects
        var query = PFQuery(className:"Video")
        query.orderByDescending("releaseDate")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) videos.")
                videos += [objects]
                // Do something with the found objects
                
                for object in objects {
                    NSLog("%@", object.objectId)
                    let titleArray =  object["title"]as String
                    let durArray = object["duration"]as String
                    println(titleArray)
                }
                
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }
        
      
        
        
        
        images = [UIImage (named: "Skate1"), UIImage (named: "50 foot Rope.jpg"), UIImage (named: "Worlds best Basketball.jpg"), UIImage (named: "Human Catapult.jpg"), UIImage (named: "Zorb Soccer.jpg")]
        titles = ["Skateboarding in 5001 Balloons!", "50 Foot Rope Swing Into Lake!", "World's Best Freestyle Dunks!", "Human Water Catapult!", "Zorb Soccer With Champion!"]
        dates = ["1 day", "14 days", "22 days", "1 month", "2 months"]
        durs = ["2:02", "1:55", "2:48", "3:02", "2:40"]
        dates += ["3 days ago"]
        self.view.backgroundColor = UIColor .grayColor()
        

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return images.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> VidCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as VidCell
    
        // Configure the cell
        
        cell.titleLabel.text = titles[indexPath.row]
        cell.releaseDateLabel.text = dates[indexPath.row]
        cell.durationLabel.text = durs[indexPath.row]
        cell.thumbnailImageView.image = images[indexPath.row]
        
        return cell
        
      

    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
     let url = NSURL (fileURLWithPath: "https://www.youtube.com/watch?v=B8imoIn6NUE&list=UUwgURKfUA7e0Z7_qE3TvBFQ")
    println(url)
    println("cell \(indexPath.row)")
     
    }
    
    @IBAction func favoriteVideo(sender: AnyObject) {
        println("favorited")
    }
    
    @IBAction func shareVideo(sender: AnyObject) {
        println("Shared")
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView!, shouldHighlightItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView!, shouldSelectItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView!, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, canPerformAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, performAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) {
    
    }
    */

}
