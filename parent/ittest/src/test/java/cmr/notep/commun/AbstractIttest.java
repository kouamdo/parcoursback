package cmr.notep.commun;

import cmr.notep.api.IAttributsApi;
import cmr.notep.api.IDocumentsApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;

@ActiveProfiles("ittest")
public abstract class AbstractIttest {

  @Autowired
  protected IDocumentsApi documentService;

  @Autowired
  protected IAttributsApi attributService ;
}
