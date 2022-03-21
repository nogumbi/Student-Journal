package main.java.webApi;

import java.util.List;

public interface EntryDB {
    Entry get(Integer id);

    List<Entry> all();

    Entry add(Entry entry);
}