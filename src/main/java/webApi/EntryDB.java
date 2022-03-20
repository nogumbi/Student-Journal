package main.java.webApi;

public interface EntryDB {
    Entry get(Integer id);

    List<Entry> all();

    Entry add(Entry entry);
}