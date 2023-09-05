//
//  FirstView.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 8/27/23.
//

import SwiftUI
import FirebaseAuth

public class UID {
    static var curr_User_ID = ""
}


public class AppViewModel: ObservableObject{

    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    public func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct FirstView: View{
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View{
        NavigationView{
            if viewModel.signedIn{
                ContentView()
            }else{
                LoginView()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
            let auth = Auth.auth()
            if viewModel.signedIn{
                UID.curr_User_ID = auth.currentUser!.uid
            }
        }
    }
}

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View{
        VStack{
            Text("Sign In").padding()
            Spacer()
            TextField("Email Address", text: $email).padding()
                .background(Color(.secondarySystemBackground))
                .disableAutocorrection(true)
                .autocapitalization(.none)
            SecureField("Password", text: $password).padding()
                .background(Color(.secondarySystemBackground))
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            Button(action:{
                
                guard !email.isEmpty, !password.isEmpty else{
                    return
                }
                
                viewModel.signIn(email: email, password: password)
            }, label:{
                Text("Sign In")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            })
            
            NavigationLink("Create Account", destination: SignUpView()).padding()
            
            Spacer()
        }
        .padding()
    }
}

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View{
        VStack{
            Text("Create Account").padding()
            Spacer()
            TextField("Email Address", text: $email).padding()
                .background(Color(.secondarySystemBackground))
                .disableAutocorrection(true)
                .autocapitalization(.none)
            SecureField("Password", text: $password).padding()
                .background(Color(.secondarySystemBackground))
                .disableAutocorrection(true)
                .autocapitalization(.none)

            
            Button(action:{
                
                guard !email.isEmpty, !password.isEmpty else{
                    return
                }
                
                viewModel.signUp(email: email, password: password)

            }, label:{
                Text("Create Account")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            })
            
            Spacer()
        }
        .padding()
    }
}
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView().environmentObject(AppViewModel())
    }
}
