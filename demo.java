public class demo
{
    public static void main(String[] args) {
        System.out.println("我今年" + 20 + "岁");
        System.out.println("HelloWorld");
        System.out.println("这是我的第一个程序");
        try {
            System.in.read();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}