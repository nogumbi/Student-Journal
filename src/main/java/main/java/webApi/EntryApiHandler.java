package main.java.webApi;

import io.javalin.http.Context;
import io.javalin.http.HttpCode;

public class EntryApiHandler {
    public static final EntryDB db = new TestDatabase(); 

    public static void getAllEntries(Context context){
        context.json(db.all());
    }

    public static void getOne(Context context){
        Integer id = context.pathParamAsClass("id", Integer.class).get();
        Entry entry = db.get(id);
        context.json(entry);
    }

    public static void createEntry(Context context){
        Entry entry = context.bodyAsClass(Entry.class);
        Entry newEntry = db.add(entry);
        context.header("Location", "/entries/" + entry.getId());
        context.status(HttpCode.CREATED);
        context.json(newEntry);
    }
}
