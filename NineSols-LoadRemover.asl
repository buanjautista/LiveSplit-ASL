state("NineSols") {}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
	vars.Helper.GameName = "NineSols";
	vars.Helper.LoadSceneManager = true;
	vars.Helper.AlertLoadless();

	settings.Add("mainmenu_reset", false, "Reset on Main Menu");
  settings.Add("fileselect_start", false, "Start on Save File Selection");
}

init
{
   vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
   {
       vars.Helper["loading"] = mono["ApplicationCore",1].Make<bool>("_instance","loadingScreen",0x78); 
       vars.Helper["gamestart"] = mono["ApplicationCore",1].Make<bool>("_instance","IsPlayFromTitleScreen"); 
       return true;
   });
}

start {
  if (settings["fileselect_start"] 
    && (vars.Helper["gamestart"].Current != vars.Helper["gamestart"].Old)
  ) { 
    return vars.Helper["gamestart"].Current; 
  }
  else {
      if ((old.SceneIndex != current.SceneIndex) && (current.SceneIndex == 7))
      {
        return true;
      }
  }
}

isLoading
{
  return (vars.Helper["loading"].Current || (current.SceneIndex == 0) || (current.SceneIndex == 72));
}

update
{
  current.SceneIndex = vars.Helper.Scenes.Active.Index;
}

reset 
{
  if (settings["mainmenu_reset"] && (old.SceneIndex != current.SceneIndex) && current.SceneIndex == 1 && old.SceneIndex == 0) { return true; }
}

/*
Scenes:
0 - Blank / Load
1 - "TitleScreenMenu" - Title Screen
72 - "ClearTransition"
7 - "A0_S6_Intro_Video" - Intro Video
5 - "A0_S4_tutorial" - Intro Tutorial
 */