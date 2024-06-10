state("NineSols") {}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
	vars.Helper.GameName = "NineSols";
	vars.Helper.LoadSceneManager = true;
	vars.Helper.AlertLoadless();

  vars.CompletedSplits = new HashSet<string>();
  vars.skills = new Dictionary<string, string>
  {
    { "Mystic Nymph", "skills_HackDroneAbility" },
    { "Tai Chi Counter", "skills_ParryJumpKickAbility" },
    { "Azure Bow", "skills_ArrowAbility" },
    { "Charged Strike", "skills_ChargedAttackAbility" },
    { "Air Dash", "skills_RollDodgeInAirUpgrade" },
    { "Unbounded Counter", "skills_ParryCounterAbility" },
    { "Double Jump", "skills_AirJumpAbility" },
    { "Super Mutant Buster", "skills_KillZombieFooAbility" }
  };

	settings.Add("mainmenu_reset", false, "Reset on Main Menu");
  settings.Add("fileselect_start", false, "Start on existing Save");
  settings.SetToolTip("fileselect_start", "For starting timer when selecting any existing save. Don't use with new save file creation.");
  settings.Add("main_skills", false, "Main Skills");
  foreach (var skill in vars.skills) { 
    settings.Add(skill.Value, false, skill.Key, "main_skills"); 
  }
}

init
{
  current.SceneIndex = 0;
   vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
   {

      var AppCore = mono["ApplicationCore",1];
      var GameCore = mono["GameCore",1];
       vars.Helper["loadingscreen"] = AppCore.Make<bool>("_instance","loadingScreen",0x78); // When loading screen is active
       vars.Helper["levelloading"] = GameCore.Make<bool>("_instance","gameLevel",0x1b8);  // When level is finishing the load

       vars.Helper["savefilestart"] = AppCore.Make<bool>("_instance","IsPlayFromTitleScreen"); 
      //  vars.Helper["gamestartmode2"] = mono["StartMenuLogic",1].Make<int>("_instance","ChooseModePanel"); 
      //  vars.Helper["gamestartmode2"] = mono["StartMenuLogic",1].Make<int>("_instance","confirmStartGameButton",0x00,0x20); 

      /* Skills */ 
       vars.Helper["skills_HackDroneAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xf8,0x17a); 
       vars.Helper["skills_ParryJumpKickAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xa8,0x17a); 
       vars.Helper["skills_ArrowAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x110,0x17a); 
       vars.Helper["skills_ChargedAttackAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xe8,0x17a); 
       vars.Helper["skills_RollDodgeInAirUpgrade"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xc0,0x17a); 
       vars.Helper["skills_ParryCounterAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x100,0x17a); 
       vars.Helper["skills_AirJumpAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x108,0x17a); 
       vars.Helper["skills_KillZombieFooAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x118,0x17a); 
       
       /* Boss States */ 
      //  vars.Helper["bossFlag"] = mono["BossLogic",1].Make<bool>("BossFightEndFlag"); 
       return true;
   });
}

start {
  if (settings["fileselect_start"] 
    && (vars.Helper["savefilestart"].Current != vars.Helper["savefilestart"].Old)
  ) { 
    return vars.Helper["savefilestart"].Current; 
  }
  else {
      /* Start timer when intro cutscene begins */ 
      if ((old.SceneIndex != current.SceneIndex) && (current.SceneIndex == 7))
      { 
        return true;
      }
  }
}

onStart {
  vars.CompletedSplits.Clear();
}

isLoading
{
  return (vars.Helper["loadingscreen"].Current || (!vars.Helper["levelloading"].Current) || (current.SceneIndex == 0) || (current.SceneIndex == 72) || (current.SceneIndex == 7));
}

update
{
  current.SceneIndex = vars.Helper.Scenes.Active.Index;
}

reset 
{
  if (settings["mainmenu_reset"] && (old.SceneIndex != current.SceneIndex) && current.SceneIndex == 1) { return true; }
}


split {
  /* To-do: Add a check for when you exit the map where you obtain the skill, instead of splitting there  */ 
    foreach (var skill in vars.skills) {
      if (settings[skill.Value] && vars.Helper[skill.Value].Current != vars.Helper[skill.Value].Old) {
        print("splitting for: " + skill);
        return true && vars.CompletedSplits.Add(skill.Value);
      }
    }
}
/*
Scenes:
0 - Blank / Load
1 - "TitleScreenMenu" - Title Screen
72 - "ClearTransition"
7 - "A0_S6_Intro_Video" - Intro Video
5 - "A0_S4_tutorial" - Intro Tutorial
 */