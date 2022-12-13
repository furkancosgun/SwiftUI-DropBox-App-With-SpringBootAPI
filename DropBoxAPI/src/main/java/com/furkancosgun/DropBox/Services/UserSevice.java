package com.furkancosgun.DropBox.Services;


import com.furkancosgun.DropBox.Entites.User;
import com.furkancosgun.DropBox.Repositories.UserRepositories;
import com.furkancosgun.DropBox.Request.UserRequest;
import com.furkancosgun.DropBox.Response.UserResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserSevice  {
    @Autowired
    private UserRepositories userRepositories;

    public UserResponse registerUser(UserRequest user){
        return userToUserResponseLogin(userRepositories.save(userCreateReqToUser(user)));
    }

    public UserResponse loginUser(UserRequest user){
        return userToUserResponseLogin(userRepositories.findByEmailAndPassword(user.getEmail(),user.getPassword()));
    }
/*
    public User getUserByIdAndEmail(UserResponse userResponse){
        return userRepositories.findByIdAndEmail(userResponse.getId(),userResponse.getEmail());
    }
*/
    public User getUserInfo(long id){
        return userRepositories.findById(id).orElse(null);
    }

    private User userCreateReqToUser(UserRequest user){
        return User.builder().email(user.getEmail()).password(user.getPassword()).build();
    }
    private UserResponse userToUserResponseLogin(User user){
        return UserResponse.builder().id(user.getId()).Email(user.getEmail()).build();
    }
    
    
}
