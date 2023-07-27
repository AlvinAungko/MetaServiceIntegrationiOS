//
//  ViewController.swift
//  iOSSharingFBLink
//
//  Created by Aung Ko Ko on 27/07/2023.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit

class ViewController: UIViewController {
    let photo = SharePhoto(image: UIImage(named: "Sample")!, isUserGenerated: true)
    let content = SharePhotoContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.photos = [photo]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let dialog = ShareDialog(viewController: self, content: content, delegate: self)
        do { try dialog.validate() } catch {
            debugPrint(error.localizedDescription)
        }

        dialog.show()
    }
}

extension ViewController: SharingDelegate {
    func sharer(_ sharer: FBSDKShareKit.Sharing, didCompleteWithResults results: [String : Any]) {
        debugPrint(results)
    }
    
    func sharer(_ sharer: FBSDKShareKit.Sharing, didFailWithError error: Error) {
        debugPrint(error.localizedDescription)
    }
    
    func sharerDidCancel(_ sharer: FBSDKShareKit.Sharing) {
        
    }
    
}

