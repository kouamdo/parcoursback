package cmr.notep.commun;

import cmr.notep.api.IAttributApi;
import cmr.notep.api.IDocumentApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;

@ActiveProfiles("ittest")
public abstract class AbstractIttest {

  @Autowired
  protected   IDocumentApi documentService;

  @Autowired
  protected IAttributApi attributService ;
}
