package sample.tomcat.jsp;

public class VoteStat {
    private long count;
    private String party;

    public VoteStat(String party, long count) {
        this.count = count;
        this.party = party;
    }

    public long getCount() {
        return count;
    }

    public String getParty() {
        return party;
    }
}
