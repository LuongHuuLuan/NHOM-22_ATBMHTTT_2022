package Services;

import model.Account;
import dao.AccountDao;

import java.util.Random;

public class ForgotPasswordService {
    public static boolean verifyForgotPassword(String email) {
        Account account = AccountDao.findOneByEmail(email);
        if (account != null) {
            SendMailService.sendMail(account.getEmail(), "Mat khau moi cua ban", "Mat khau moi cua ban la: \r\n" + getNewPassword());
        } else {
            return false;
        }
        return false;
    }

    public static String getNewPassword() {
        String result = "";
        Random rd = new Random();

        for (int i = 0; i < 4; i++) {
            result += rd.nextInt(10);
        }

        char[] alpha = new char[91 - 65];
        for (int i = 0; i < alpha.length; i++) {
            alpha[i] = (char) (65 + i);
        }

        result += alpha[rd.nextInt(91 - 65)];
        result = result.toLowerCase();
        result += alpha[rd.nextInt(91 - 65)];

        return result;
    }
}
