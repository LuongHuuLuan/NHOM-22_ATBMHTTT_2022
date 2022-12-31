package Services;

import dao.StatusDao;
import model.Status;

import java.util.List;

public class StatusService {
    public static Status getStatus(long id) {
        return StatusDao.findOneById(id);
    }

    public static Status getStatusByName(String name) {
        return StatusDao.findOneByName(name);
    }

    public static List<Status> getAllStatusWithStatusGroup(String statusGroup) {
        return StatusDao.findByStatusGroup(statusGroup);
    }
}
