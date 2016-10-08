package sample.tomcat.jsp;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class Vote implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false)
    private String party;

    private String email;

    private String ip;

    public Vote(String party, String email, String ip) {
        this.party = party;
        this.email = email;
        this.ip = ip;
    }

}
