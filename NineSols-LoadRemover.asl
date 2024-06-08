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
  ) 
  { 
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
  if (old.SceneIndex != current.SceneIndex && current.SceneIndex == 1 && old.SceneIndex == 0 && settings["mainmenu_reset"]) { return true; }
}

/*
Scenes:
0 - Blank / Load
1 - Title Screen
72 - Clear Transition
7 - Intro Video
5 - Intro Tutorial
 */