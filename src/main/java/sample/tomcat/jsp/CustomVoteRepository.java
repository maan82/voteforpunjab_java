package sample.tomcat.jsp;

import java.util.List;

public interface CustomVoteRepository {
    List<VoteStat> getStat();
}
