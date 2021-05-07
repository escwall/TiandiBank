//import com.bank.dao.CardUserDao;
//import com.bank.entity.CardUser;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//
//import java.io.InputStream;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Scanner;
//
//public class MyBatisTest {
//    public static void main(String[] args) throws Exception {
//        InputStream in = Resources.getResourceAsStream("mybatis.xml");
//        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
//        SqlSessionFactory factory = builder.build(in);
//        SqlSession session = factory.openSession();
//        CardUserDao cardUserDao = session.getMapper(CardUserDao.class);
//
//
//        List<CardUser> users = cardUserDao.showAllAccounts();
//        for(CardUser user : users) {
//            System.out.println(user);
//        }
//
//        session.commit();
//        session.close();
//        in.close();
//    }
//}
