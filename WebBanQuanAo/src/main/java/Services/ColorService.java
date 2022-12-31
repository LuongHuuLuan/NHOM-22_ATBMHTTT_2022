package Services;

import dao.ColorDao;
import model.Color;

public class ColorService {
    public static Color getColor(String code) {
        return ColorDao.findOneByCode(code);
    }
}
