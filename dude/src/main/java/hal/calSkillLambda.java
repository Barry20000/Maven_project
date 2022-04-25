package hal;

import com.amazon.ask.SkillStreamHandler;

/**
 * Adapts the {@link calSkill} for running within a Lambad environment.
 */
public class calSkillLambda extends SkillStreamHandler {
    public calSkillLambda() {
        super(new calSkill().getSkill());
    }
}
