package hal;

import com.amazon.ask.builder.SkillBuilder;
import hal.handlers.exception.CatchAllExceptionHandler;
import hal.handlers.exception.UnhandledSkillExceptionHandler;
import com.amazon.ask.interaction.definition.SkillModel;
import com.amazon.ask.mvc.MvcSkillApplication;
import com.amazon.ask.mvc.SkillModule;

import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Entry point for a Lambda Skill, defines the MVC controllers and {@link SkillModel}
 */
public class calSkill extends MvcSkillApplication {
    @Override
    protected Map<Locale, String> getInvocationNames() {
        return Collections.singletonMap(Locale.forLanguageTag("en-US"), "bnad");
    }

    @Override
    protected SkillBuilder getSkillBuilder() {
        return super.getSkillBuilder()
            .addExceptionHandler(new UnhandledSkillExceptionHandler())
            .addExceptionHandler(new CatchAllExceptionHandler());

    }

    @Override
    protected List<SkillModule> getModules() {
        return Collections.singletonList(new calModule());
    }
}