package Services;

import dao.CartDao;
import model.Account;
import dao.AccountDao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class AccountServices {

    // new
    public static List<Account> getAll() {
        return AccountDao.findAll();
    }

    public static Account getUser(long id) {
        return AccountDao.findOneById(id);
    }

    public static Account getAccount(String userName, String passWord, boolean isHash) {
        return AccountDao.findOneByUserNameAndPassword(userName, passWord, isHash);
    }

    public static String isExistUserName(String username) {
        return AccountDao.findOneByUserName(username) == null ? "" : "Tài khoản đã tồn tại!";
    }

    public static Account reLogin(String reLoginToken) {
        Account account = AccountDao.findOneByReLoginToken(reLoginToken);
        account.setReLoginToken(UUID.randomUUID().toString());
        AccountDao.update(account, false);
        return account;
    }

    public static long addNewAccount(Account account) {
        return AccountDao.add(account);
    }

    public static boolean update(Account account, boolean isHash) {
        return AccountDao.update(account, isHash);
    }
    public static boolean deleteAccount(long id) {
        return AccountDao.delete(id);
    }

}
