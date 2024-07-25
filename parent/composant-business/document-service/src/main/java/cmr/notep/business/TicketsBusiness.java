package cmr.notep.business;

import cmr.notep.dao.DaoAccessorService;
import cmr.notep.dao.TicketsEntity;
import cmr.notep.modele.Tickets;
import cmr.notep.repository.TicketsRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cmr.notep.config.DocumentConfig.dozerMapperBean;

@Component
@Slf4j
@Transactional
public class TicketsBusiness {

    private final DaoAccessorService daoAccessorService;

    public TicketsBusiness(DaoAccessorService daoAccessorService) {
        this.daoAccessorService = daoAccessorService;
    }

    public Tickets avoirTicket(String id) {
        return dozerMapperBean.map(
                this.daoAccessorService.getRepository(TicketsRepository.class)
                        .findById(id)
                        .orElseThrow(()->new RuntimeException("Categorie inexistante")), Tickets.class);
    }

    public List<Tickets> avoirToutTickets() {
        return daoAccessorService.getRepository(TicketsRepository.class).findAll()
                .stream().map(ticket ->dozerMapperBean.map(ticket, Tickets.class))
                .collect(Collectors.toList());
    }

    public void supprimerTicket(Tickets Tickets)
    {
        daoAccessorService.getRepository(TicketsRepository.class)
                .deleteById(Tickets.getId().toString());
    }

    public Tickets posterTicket(Tickets Tickets) {
        return dozerMapperBean.map( this.daoAccessorService.getRepository(TicketsRepository.class)
                .save(dozerMapperBean.map(Tickets, TicketsEntity.class)), Tickets.class);
    }
    
}
