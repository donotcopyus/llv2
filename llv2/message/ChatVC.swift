//
//  ChatVC.swift
//  llv2
//
//  Created by 林蔼欣 on 2018-07-19.
//  Copyright © 2018 Luna Cao. All rights reserved.
//

import UIKit
import MobileCoreServices
import JSQMessagesViewController
import AVKit

class ChatVC: JSQMessagesViewController {
    //UIImagePickerController, UINavigationController, MessageReceivedDelegate

    private var message = [JSQMessage]();
    
    let picker = UIImagePickerController();

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picker.delegate = self;
        MessagesHandler.Instance.delegate = self;
        
        self.senderId = AuthProvider.Instance.userID();
        self.senderDisplayNam = AuthProvider.Instance.userName;
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let bubbleFactory = JSQMessagesBubbleImageFactory();
        let message = self.message[indexPath.item];
        
        return bubbleFactory.outgoingMessagesBubbleImage(with: UIColor.blue);
    }
    
    override func collectionView(_ collectionView: (JSQMessagesCollectionView?), avatarImageDataForItemAt indexPath: IndexPath) -> JSQMessageAvatarImageDataSource? {
        return JSQMessagesAvatarImageFactory.avatarImage(with: UIImage(named: ""), diameter: 30);
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData {
        return message[indexPath.item]
    }
        

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int  {
        return message.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as!
        JSQMessagesCollectionViewCell
        return cell;
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        MessagesHandler.Instance.sendMessage(senderID: senderId, senderName: senderDisplayName, text: text)
        
        finishSendingMessage();
    }
    
    override func didPressAccessoryButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Media Messages", message: "Please selece a media", preferredStyle: actionSheet);
        
        let cancel = UIActionSheetStyle(title: "Cancel", style: .cancel, handler: nil);
    
        let photos = UIActionSheetStyle(title: "Photos", style: .default, handler: { (alert: UIAlertAction) in self.chooseMedia(type: kUTTypeImage);})
        
        let videos = UIActionSheetStyle(title: "Videos", style: .default, handler: { (alert: UIAlertAction) in self.chooseMedia(type: kUTTypeMovie);})
        alert.addAction(photos);
        alert.addAction(videos);
        alert.addAction(cancel);
        present(alert, animated: true, completion: nil);
    }
    
    
    
    private func chooseMedia(type: CFString) {
        picker.mediaTypes = [type as String]
        present(picker, animated: true, completion: nil);
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pic = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let img = JSQPhotoMediaItem(image: pic);
            self.message.append(JSQMessage(senderId: senderId(), displayName: senderDisplayName(), media: img))
        }else if let vidRrl = info[UIImagePickerControllerMediaURL] as? URL {
            let video = JSQVideoMediaItem(fileURL: vidRrl, isReadyToPlay: true);
            message.append(JSQMessage(senderId: senderId(), displayName: senderDisplayName(), media: video));
        }
        self.dismiss(animated: true, completion: nil)
        collectionView?.reloadData();
    }
    
    //视频点击播放功能
    override func collectionView(_ collectionView: JSQMessagesCollectionView, didTapMessageBubbleAt indexPath: IndexPath) {
        let msg = message[indexPath.item];
        
        if msg.isMediaMessage{
            if let mediaItem = msg.media as? JSQVideoMediaItem{
                let player = AVPlayer(url: mediaItem.fileURL!);
                let playerController = AVPlayerViewController();
                playerController.player = player;
                self.present(playerController, animated: true, completion: nil);
            }
        }
    }
    
    //Delegation functions
    
    func messageReceived(senderID: String, senderName: String, text: String) {
        message.append(JSQMessage(senderId: senderID, displayName: senderName, text: text));
        collectionView?.reloadData();
    }





}
