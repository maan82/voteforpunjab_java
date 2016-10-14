package sample.tomcat.jsp;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class DefaultVoteRepository implements CustomVoteRepository {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<VoteStat> getStat() {
        final Query query = em.createNativeQuery("select party, count(*) as count from vote group by party");
        final List resultList = query.getResultList();
        return (List<VoteStat>) resultList.stream().map(r -> new VoteStat(((Object[])r)[0].toString(),  ((BigInteger)((Object[])r)[1]).longValue() )).collect(Collectors.toList());
    }
}
