package cmr.notep.dao;

import lombok.Getter;
import lombok.Setter;
import org.dozer.Mapping;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "filesattentes")
public class FilesAttentesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "datecreation")
    private Date dateCreation;

    @Column(name = "etat")
    private Boolean etat ;

    @OneToMany(mappedBy = "filesAttentesEntity" , fetch = FetchType.LAZY , cascade = {CascadeType.ALL})
    @Mapping("ticketsfilesattentes")
    private List<TicketsFilesAttentesEntity> ticketsFilesAttentesEntities;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "services_id" , referencedColumnName = "id")
    @Mapping("service")
    private ServicesEntity servicesEntity;
}
