//
//  ContentView.swift
//  PopupProgressView
//
//  Created by Jakub Slawecki on 06/08/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import SwiftUI

struct TextfieldAlert: View {
    @State var password = ""
    
    func alertWithTextfieldView() {
        
        let alert = UIAlertController(
            title: "Login",
            message: "Enter your password.",
            preferredStyle: .alert)
        
        alert.addTextField { (pass) in
            pass.isSecureTextEntry = true
            pass.placeholder = "Password"
        }
      
        let loginButton = UIAlertAction(title: "Login", style: .default) { (_) in
            self.password = alert.textFields![0].text!
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
            // Cancel actions..
            
        }
        
        alert.addAction(cancelButton)
        alert.addAction(loginButton)
     
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            // Try to login with password
        })
    }
    
    var body: some View {
        VStack {
            Button(
                action: {
                    self.alertWithTextfieldView()
            }) {
                Text("Alert with textfield")
            }
            
            Text(password)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldAlert()
    }
}
