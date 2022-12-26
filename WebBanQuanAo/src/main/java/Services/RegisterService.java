package Services;

import beans.Account;
import beans.Register;
import dao.AccountDao;
import dao.RegisterDao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

public class RegisterService {
    public static int addRegister(Register register) {
        String token = "";
        boolean emailIsExist = false;
        boolean userNameIsExist = false;
        // kiểm tra username tồn tại
        if (AccountDao.findOneByUserName(register.getUserName()) == null) {
            Register regis = RegisterDao.findOneByUsernameAndStatus(register.getUserName(), RegisterDao.RegisterState.WAITING.getValue());
            if (regis != null) {
                Timestamp registerDate = regis.getDateRegister();
//              Kiểm tra thời gian đăng ký có quá thời gian hiện tại trừ đi 24 tiếng hay không
                if (!registerDate.after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)))) {
                    emailIsExist = true;
                }
            }
        }
        // kiểm tra email tồn tại
        if (AccountDao.findOneByEmail(register.getEmail()) == null) {
            Register regis = RegisterDao.findOneByEmailAndStatus(register.getEmail(), RegisterDao.RegisterState.WAITING.getValue());
            if (regis != null) {
                Timestamp registerDate = regis.getDateRegister();
//              Kiểm tra thời gian đăng ký có quá thời gian hiện tại trừ đi 24 tiếng hay không
                if (!registerDate.after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)))) {
                    emailIsExist = true;
                }
            }
        }

        int result = 0;
        // neu email va username chua duoc dang ky thi se cho dang ky
        if (!emailIsExist && !userNameIsExist) {
            token = String.valueOf(UUID.randomUUID());
            register.setVerifyCode(token);
            int id = RegisterDao.add(register);
            if (id == -1) {
                result = 1;
                // Da xay ra loi trong qua trinh dang ky vui long thu lai sau
                return result;
            }
            String link = "http://localhost:8080/WebBanQuanAo/confirm?id=" + id + "&token=" + token;
            SendMailService.sendMail(register.getEmail(), "Xac thuc dang ky", link);
        } else {
            if (emailIsExist) {
//                message = "Email da duoc dang ky vui long nhap email khac";
                result = 2;
                return result;
            } else {
//                message = "Ten tai khoan da ton tai nhap ten khac";
                result = 3;
                return result;
            }
        }
        return result;
    }

    public static Register getRegister(int id) {
        return RegisterDao.findOneById(id);
    }

    public static boolean updateStateRegister(int id, String token) {
        Register register = RegisterDao.findOneById(id);
        if (register.getVerifyCode().equals(token)) {
            register.setStatus(RegisterDao.RegisterState.SUCCESS.getValue());
            return RegisterDao.update(register, false);
        }
        return false;
    }

}
