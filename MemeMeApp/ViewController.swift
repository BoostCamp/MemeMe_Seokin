//
//  ViewController.swift
//  MemeMeApp
//
//  Created by 서석인 on 1/19/17.
//  Copyright © 2017 boost. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    
    @IBOutlet weak var topLabel: UITextField!
    @IBOutlet weak var bottomLabel: UITextField!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.topLabel.delegate = self
        self.bottomLabel.delegate = self
        
        
        let memeTextAttributes: [String: Any] = [
            NSStrokeColorAttributeName: UIColor.black,
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 60)!,
            NSStrokeWidthAttributeName: -5.0    // 음수여야 Fill이 채워진다
        ]
        
        topLabel.defaultTextAttributes = memeTextAttributes
        bottomLabel.defaultTextAttributes = memeTextAttributes
        
        topLabel.textAlignment = .center
        bottomLabel.textAlignment = .center
        
        shareButton.isEnabled = false
        saveButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    func keyboardWillShow(_ notification: Notification){
        if bottomLabel.isFirstResponder {
            view.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }
    
    func keyboardWillHide(_ notification: Notification){
        if bottomLabel.isFirstResponder {
            view.frame.origin.y = 0
        }
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func subscribeToKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func pickAnImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imagePickerView.image = image
            shareButton.isEnabled = true
            saveButton.isEnabled = true
       }
       dismiss(animated: true, completion: nil)
    }
    
    func generateMemedImage()->UIImage{
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return memedImage
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        let memedImage = generateMemedImage()
        let activityVC = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)

    }
    
    @IBAction func save(){
        let memedImage = generateMemedImage()
        let mcount = (UIApplication.shared.delegate as! AppDelegate).memeCount
        let meme = Meme(id: mcount! + 1, name: topLabel.text!, topText: topLabel.text!, bottomText: bottomLabel.text!, originalImage: imagePickerView.image!, memedImage: memedImage, isFavorite: false)
        (UIApplication.shared.delegate as! AppDelegate).memeCount! += 1
        
        UIImageWriteToSavedPhotosAlbum(memedImage, self, nil, nil)
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
        let alert = UIAlertController(title: "저장 성공", message: "Meme이 저장되었습니다", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func cameraLoad(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            // UIImagePickerController 인스턴스를 생성하고 camera를 객체의 델리게이트로 설정
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        else {
            let alert = UIAlertController(title: "카메라 경고", message: "사용가능한 카메라가 없습니다.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
         
        }
    }
    
}

