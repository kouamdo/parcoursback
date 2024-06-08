package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "tickets")
public class TicketsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "codecourt")
    private String codecourt;

    @OneToMany(mappedBy = "ticketsEntity" , fetch = FetchType.LAZY , cascade = {CascadeType.ALL})
    @Mapping("ticketsfilesattentes")
    private List<TicketsFilesAttentesEntity> ticketsFilesAttentesEntities;
}
