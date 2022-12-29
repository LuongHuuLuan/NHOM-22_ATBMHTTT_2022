package Services;

import dao.AccountDao;
import dao.RoleDao;
import dao.StatusDao;
import model.Account;
import model.Role;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

public class RegisterService {
    public static int checkRegister(Account newAccount) {
        try {
            if (!checkEmailExist(newAccount.getEmail())) {
                if (!checkUserNameExist(newAccount.getUsername())) {
                    String validateToken = UUID.randomUUID().toString();
                    newAccount.setValidateToken(validateToken);
                    newAccount.setRole(RoleDao.findOneByName("USER"));
                    newAccount.setStatus(StatusDao.findOneByCode("UNVALIDATE"));
                    long id = AccountDao.add(newAccount);
                    String link = "http://localhost:8080/WebBanQuanAo/confirm?id=" + id + "&token=" + validateToken;
                    SendMailService.sendMail(newAccount.getEmail(), "Xac thuc dang ky", link);
                    return 0;
                } else {
                    return 3;
                }
            } else {
                return 2;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }
    }

    public static boolean checkUserNameExist(String userName) {
        Account account = AccountDao.findOneByUserName(userName);
        boolean result = true;
        if (account == null) {
            result = false;
        } else {
            if (account.getStatus().getCode().equalsIgnoreCase("UNVALIDATE")) {
                Timestamp createDate = account.getCreatedDate();
                //Kiểm tra thời gian đăng ký có quá thời gian hiện tại trừ đi 24 tiếng hay không nếu có là sai ngc lại là đúng
                boolean checkExpires = createDate.after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)));
                if (!checkExpires) {
                    AccountDao.delete(account.getId());
                    result = false;
                }
            }
        }
        return result;
    }

    public static boolean checkEmailExist(String email) {
        Account account = AccountDao.findOneByEmail(email);
        boolean result = true;
        if (account == null) {
            result = false;
        } else {
            if (account.getStatus().getCode().equalsIgnoreCase("UNVALIDATE")) {
                Timestamp createDate = account.getCreatedDate();
                //Kiểm tra thời gian đăng ký có quá thời gian hiện tại trừ đi 24 tiếng hay không
                boolean checkExpires = createDate.after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)));
                if (!checkExpires) {
                    AccountDao.delete(account.getId());
                    result = false;
                }
            }
        }
        return result;
    }

    public static boolean confirmRegister(long id, String token) {
        Account account = AccountDao.findOneByIdAndValidateToken(id, token);
        if (account == null) return false;
        if (account.getStatus().getCode().equalsIgnoreCase("UNVALIDATE")) {
            boolean checkExpires = account.getCreatedDate().after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)));
            if (!checkExpires) {
                return false;
            } else {
                account.setStatus(StatusDao.findOneByCode("ACTIVE"));
                return AccountDao.update(account, false);
            }
        } else {
            return false;
        }
    }

}
