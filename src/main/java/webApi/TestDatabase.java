package main.java.webApi;

import java.util.Map;

public class TestDatabase implements EntryDB {
    private Map<Integer, Entry> entries;

    public TestDatabase() {
        entries = new HashMap<>();

        this.add(Entry.createEntry("Project called Student Journal", "I worked on the front end side of the project I started, there are bugs that I have been working on and hopefully today I will be able to fix them"));
        this.add(Entry.createEntry("Video for WeShare", "I worked on the video for SETA portfolio, I cannot seem to upload the video but hopefully by Tuesday I will be able to submit my entire portfolio"));
        this.add(Entry.createEntry("Google Code Jam", "I joined google code jam for women that takes place on the 26th March, I want to be part of the top 150"));
    }

    @Override
    public Entry get(Integer id) {
        return entry.get(id);
    }

    @Override
    public List<Entry> all() {
        return new ArrayList<>(entries.values());
    }

    @Override
    public Entry add(Entry entry) {
        Integer index = entry.size() + 1;
        entry.setId(index);
        entries.put(index, entry);
        return entry;
    }

}
