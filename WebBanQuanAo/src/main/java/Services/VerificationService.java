package Services;

import dao.SignDao;
import dao.VerificationDao;
import model.Account;
import model.Sign;
import model.Verification;

public class VerificationService {
    public static long add(Verification verification) {
        return VerificationDao.add(verification);
    }
}
