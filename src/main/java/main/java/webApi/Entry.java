package main.java.webApi;

public class Entry{
    private Integer id;
    private String title;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public static Entry createEntry(String title, String description){
        Entry entry = new Entry();
        entry.title = title;
        entry.description = description;
        return entry;
    }
}