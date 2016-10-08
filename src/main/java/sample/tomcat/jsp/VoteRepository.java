package sample.tomcat.jsp;

import org.springframework.data.domain.*;
import org.springframework.data.repository.*;

/**
 * Created by ravi on 01/10/2016.
 */
public interface VoteRepository extends CrudRepository<Vote, Long>{
}
