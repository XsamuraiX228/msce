package subfunc;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.RequestBody;

/**
 * SubController
 */
  @RestController
public class SubController {
    @PostMapping("/substract")
  public SubResp substract(@RequestBody SubReq req) {
    return new SubResp(Substract.sub(req.a(), req.b()));
  }
}
