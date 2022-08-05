import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    public Karate runtest1() {
        return Karate.run("features/1_firstGet").relativeTo(getClass());

        // return Karate.run("classpath:features/1_firstGet.feature");
    }

    @Karate.Test
    public Karate runtest2() {
        runtest1();
        return Karate.run("features/2_background").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runtest3() {
        return Karate.run("features/FakerTest").relativeTo(getClass());

    }
    @Karate.Test
    public Karate runtest() {
        return Karate.run("features/3_post").relativeTo(getClass());

    }
}
