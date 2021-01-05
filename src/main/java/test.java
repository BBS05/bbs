import redis.clients.jedis.Jedis;

public class test {
    public static void main(String[] args) {
        Jedis jedis = new Jedis("localhost");
        //jedis就是指向redis数据库的链接
        jedis.set("foo","bar");
        System.out.println(jedis.get("foo"));
    }
}
