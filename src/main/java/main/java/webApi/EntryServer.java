package main.java.webApi;

import io.javalin.Javalin;



public class EntryServer {
    private final Javalin server;

    public EntryServer(){
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });
        this.server.get("/entries", context -> EntryApiHandler.getAllEntries(context));
        this.server.get("/entries{id}", context -> EntryApiHandler.getOne(context));
        this.server.post("/entries", context -> EntryApiHandler.createEntry(context));
    }

    public static void main(String[] args){
        EntryServer server = new EntryServer();
        server.start(5000);
    }

    public void start(int port){
        this.server.start(port);
    }

    public void stop(){
        this.server.stop();
    }
}
