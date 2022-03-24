import kong.unirest.HttpResponse;
import kong.unirest.Unirest;
import main.java.webApi.EntryServer;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class EntryServerTest{

    @Test
    @DisplayName("GET /entries")  
    public void connected() {
        EntryServer api = new EntryServer(); 
        api.start(5000); 
        HttpResponse<String> response = Unirest.get("http://localhost:5000/entries/").asString(); 
        assertEquals(200, response.getStatus()); 
        api.stop(); 
    }

    @Test
    @DisplayName("POST /entries")  
    public void shouldPostEntry() {
        EntryServer api = new EntryServer(); 
        api.start(5000); 
        HttpResponse<String> response = Unirest.post("http://localhost:5000/entries") 
                .asString(); 
        assertEquals(500, response.getStatus()); 
        api.stop(); 
    }
}
