import com.intuit.karate.gatling.PreDef.karateFeature
import io.gatling.core.Predef._
import io.gatling.core.scenario.Simulation

import scala.concurrent.duration._
import scala.language.postfixOps

class LoadTestingGetDetails extends Simulation {
  val GetDetails = scenario("Get").exec(karateFeature("classpath:features/1_firstGet.feature"))



  setUp(
    GetDetails.inject(rampUsers(100) during ( 3 seconds))

  )


}
