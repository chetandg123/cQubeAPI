package cqubeApp.cqube_api;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("cqube_api").relativeTo(getClass());
    }    

}
