package Services;

import dao.SizeDao;
import model.Size;

public class SizeService {
    public static Size getSize(String code) {
        return SizeDao.findOneByCode(code);
    }
}
