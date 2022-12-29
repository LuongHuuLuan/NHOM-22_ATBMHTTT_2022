package Services;

import model.Account;
import dao.AccountDao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class AccountServices {
    private static List<Account> accounts = new ArrayList<Account>();

    // new
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

    public static boolean addNewAccount(Account account) {
        return AccountDao.add(account) != -1;
    }

    public static boolean update(Account account, boolean isHash) {
        return AccountDao.update(account, isHash);
    }

}
