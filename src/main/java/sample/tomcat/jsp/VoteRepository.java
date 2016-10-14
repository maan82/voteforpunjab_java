package sample.tomcat.jsp;

import org.springframework.data.domain.*;
import org.springframework.data.repository.*;

public interface VoteRepository extends CrudRepository<Vote, Long>{
}
