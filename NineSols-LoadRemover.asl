state("NineSols") {}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.GameName = "NineSols";
  vars.Helper.LoadSceneManager = true;
  vars.Helper.AlertLoadless();

  vars.CompletedSplits = new HashSet<string>();
  vars.abilities = new Dictionary<string, string> { { "Mystic Nymph", "skills_HackDroneAbility" }, { "Tai Chi Counter", "skills_ParryJumpKickAbility" }, { "Azure Bow", "skills_ArrowAbility" }, { "Charged Strike", "skills_ChargedAttackAbility" }, { "Air Dash", "skills_RollDodgeInAirUpgrade" }, { "Unbounded Counter", "skills_ParryCounterAbility" }, { "Double Jump", "skills_AirJumpAbility" }, { "Super Mutant Buster", "skills_KillZombieFooAbility" } };

  // god i wish there was an easier way of doing this 
  vars.abilityrooms = new Dictionary<string, string> { { "Tai Chi Counter Room", "room_Taichi" }, { "Charged Strike Room", "room_Charged" }, { "Air Dash", "room_Airdash" }, { "Unbounded Counter Room", "room_Unbounded" }, { "Double Jump Room", "room_DoubleJump" } };
  vars.vrmemory = new Dictionary<string, string> { { "Kuafu Seal", "room_KuafuVR" }, { "Goumang Seal", "room_GoumangVR" }, { "Yanlao Seal", "room_YanlaoVR" }, { "Jiequan Seal", "room_JiequanVR" }, { "Fake Lady Ethereal Seal", "room_fakeFudie" }, { "After Lady Ethereal fight", "room_Butterfly" }, { "Ji Seal", "room_JiVR" }, { "Fuxi Seal", "room_FuxiVR" }, { "Nuwa Seal", "room_NuwaVR" }, { "Eigong Soulscape", "room_EigongSoulscape" } };

  vars.roomIndexes = new Dictionary<string,int> { { "room_KuafuVR", 66 }, { "room_GoumangVR", 67 }, { "room_YanlaoVR", 68 }, { "room_JiequanVR", 69 }, { "room_fakeFudie", 70 }, { "room_Butterfly", 52 },{ "room_JiVR", 89 }, { "room_FuxiVR", 90 }, { "room_NuwaVR", 91 }, { "room_EigongSoulscape", 103 }, { "room_Taichi", 58 }, { "room_Charged", 59 }, { "room_Airdash", 60 }, { "room_Unbounded", 61 }, { "room_DoubleJump", 63 }, { "baichang_kill", 9 }, { "jiaoduan_kill", 11 },{ "xingtian_kill", 27 }, { "kanghui_kill", 37 }, { "huanxian_kill", 49 }, { "tianshou_kill", 64 }, { "eigong_kill", 104 }, { "trueeigong_kill", 113 } };
  vars.roomNames = new Dictionary<string,string> { { "room_KuafuVR", "VR_Memory_Kuafu" }, { "room_GoumangVR", "VR_Memory_Goumang" }, { "room_YanlaoVR", "VR_Memory_TaoChang" }, { "room_JiequanVR", "VR_Memory_JieChuan" }, { "room_fakeFudie", "VR_Memory_FuDie" }, { "room_Butterfly", "A7_S6_Memory_Butterfly_CutScene" },{ "room_JiVR", "VR_Memory_Jee" }, { "room_FuxiVR", "VR_Memory_伏羲" }, { "room_NuwaVR", "VR_Memory_伏羲&女娲" }, { "room_EigongSoulscape", "VR_Memory_易公" }, { "room_Taichi", "AG_Tutorial_Lear_S2_??JumpKick" }, { "room_Charged", "AG_Tutorial_Lear_S3_??ChargeAttack" }, { "room_Airdash", "AG_Tutorial_Lear_S4_AirDash_????" }, { "room_Unbounded", "AG_Tutorial_Lear_S5_??ChargedParry" }, { "room_DoubleJump", "AG_Tutorial_Lear_S7_DoubleJump_???" }, { "baichang_kill", "A1_S2_ConnectionToElevator_Final" }, { "xingtian_kill", "A4_S3_ControlRoom_Final" }, { "kanghui_kill", "A5_S2_Jail_Remake_Final" }, { "huanxian_kill", "A7_S2_SectionF_MiniBossFight" }, { "jiaoduan_kill", "A2_S2_ReactorRight_Final" }, { "tianshou_kill", "A9_S1_Remake_4wei" }, { "eigong_kill", "A11_S0_Boss_YiGung" }, { "trueeigong_kill", "A11_S0_Boss_YiGung" }};
  
  // Dictionary where we'll insert all game flags we want to track. 
  vars.gameFlags = new Dictionary<string, Tuple<string, string, string>>();
  
  // Boss Kills
  vars.gameFlags.Add("740a8b30-e3cc-4acc-9f5f-da3aaae1df5e_51c211e21fecd9e4c92f41d8d72aa395ScriptableDataBool", Tuple.Create("boss_kill", "Red Tiger Elite: Baichang", "ScriptableDataBool") );
  vars.gameFlags.Add("2798b3a9-1026-4d53-b41c-5489699a19de_c3c3f30fb046d9743aea48eb8f4833bcScriptableDataBool", Tuple.Create("boss_kill", "Celestial Sentinel: Jiaoduan", "ScriptableDataBool") );
  vars.gameFlags.Add("098316c3b4ddf514fbc2dc2806475da2ScriptableDataBool", Tuple.Create("boss_kill", "Xingtian", "ScriptableDataBool") );
  vars.gameFlags.Add("b500f8ebeb10f46a085b9720f5a78affScriptableDataBool", Tuple.Create("boss_kill", "Kanghui", "ScriptableDataBool") );
  vars.gameFlags.Add("bc5ca55c-065c-4ad8-9f18-bbc7ab2e468a_11c84f9bfd4e1445395ec443308d3965ScriptableDataBool", Tuple.Create("boss_kill", "Celestial Enforcer: Huanxian", "ScriptableDataBool") );
  vars.gameFlags.Add("50926aad-0750-4f3b-9318-dc5da45e75f1_4256ef2ec22f942dc9f70607bb00391fScriptableDataBool", Tuple.Create("boss_kill", "The Great Miner: Tianshou", "ScriptableDataBool") );
  vars.gameFlags.Add("e965aab1c014b4273b928b17fbcff379ScriptableDataBool", Tuple.Create("boss_kill", "Eigong", "ScriptableDataBool") );
  
  // Jades
  vars.gameFlags.Add("7e33977082bec4db5ab349143f89c24fJadeData", Tuple.Create("jade_obtain", "Qi Thief Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("b8fd8e42229824b788bc222b837382f2JadeData", Tuple.Create("jade_obtain", "Immovable Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("a0a2cb6d037ee4d80a74fd447a21682eJadeData", Tuple.Create("jade_obtain", "Harness Force Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("36eb7e7b95e91467191b8f24dbbb5a3eJadeData", Tuple.Create("jade_obtain", "Focus Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("1e635338961c24feb93798c36c07f128JadeData", Tuple.Create("jade_obtain", "Swift Descent Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("8417398823dca444b924aa9e49e82385JadeData", Tuple.Create("jade_obtain", "Medical Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("316728bf6fa814c8085a4ce094c6cabbJadeData", Tuple.Create("jade_obtain", "Quick Dose Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("28837290da6d24917ad6c99213d99d3dJadeData", Tuple.Create("jade_obtain", "Steely Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("1e983ace0eb874a3a883c5f1f50e2926JadeData", Tuple.Create("jade_obtain", "Stasis Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("45a17198c6bff4c42989f3e2d9cb583bJadeData", Tuple.Create("jade_obtain", "Mob Quell Jade - Yin", "GameFlagDescriptable") );
  vars.gameFlags.Add("8ff52186b5d2849f6930bd5bf5d86b8aJadeData", Tuple.Create("jade_obtain", "Mob Quell Jade - Yang", "GameFlagDescriptable") );
  vars.gameFlags.Add("fce2186e0ae684bde9548905d5ed5533JadeData", Tuple.Create("jade_obtain", "Bearing Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("ef792d1867d1a4a9c8ec6cd721ee5cb3JadeData", Tuple.Create("jade_obtain", "Divine Hand Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("ff5f58b8404514c11b7ec4166b294349JadeData", Tuple.Create("jade_obtain", "Iron Skin Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("562375e7a68ec42b28f3bdd5f45d7b72JadeData", Tuple.Create("jade_obtain", "Pauper Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("b4c7da472cfba425ba5d0b0309dc4f17JadeData", Tuple.Create("jade_obtain", "Swift Blade Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("3411e0d523aec41f9be4e24ff81b6293JadeData", Tuple.Create("jade_obtain", "Last Stand Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("e6f162e19282346db96145ee80b5ccc1JadeData", Tuple.Create("jade_obtain", "Recovery Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("3ddbef7a7a579497b82fe3712177c089JadeData", Tuple.Create("jade_obtain", "Breather Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("3c8fd0425b80a405a8fb9623094fcafcJadeData", Tuple.Create("jade_obtain", "Hedgehog Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("dbda764ac569f4d6b871fb6c82f11adeJadeData", Tuple.Create("jade_obtain", "Ricochet Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("987349e8a21844d28a86853bb0e5de09JadeData", Tuple.Create("jade_obtain", "Revival Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("468a3373787c2443794e57f101b5f794JadeData", Tuple.Create("jade_obtain", "Soul Reaper Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("1796f5882076b4c7c859bc4b0747d8bbJadeData", Tuple.Create("jade_obtain", "Health Thief Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("dfa6bbf26dfef4032a5287a7d9b27881JadeData", Tuple.Create("jade_obtain", "Qi Blade Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("111a1eb49b6d0476488eba696f991e19JadeData", Tuple.Create("jade_obtain", "Qi Swipe Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("589b90f2463944b95aeb6821385b3be6JadeData", Tuple.Create("jade_obtain", "Reciprocation Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("cfcd9f0d330344e628e7d8742955c172JadeData", Tuple.Create("jade_obtain", "Cultivation Jade", "GameFlagDescriptable") );
  vars.gameFlags.Add("88263fdff21bc8b4da3977c47ab02f03JadeData", Tuple.Create("jade_obtain", "Avarice Jade", "GameFlagDescriptable") );
  
  // Artifacts
  vars.gameFlags.Add("c06500f5667730141aee0f2f2e470ad0ItemData", Tuple.Create("artifact_obtain", "Fusang Amulet", "GameFlagDescriptable") );
  vars.gameFlags.Add("e143133559a42004ba225b6273ccf6d9ItemData", Tuple.Create("artifact_obtain", "Multi-tool Kit", "GameFlagDescriptable") );
  vars.gameFlags.Add("8f81aaa43927b41448a502145949a2b0ItemData", Tuple.Create("artifact_obtain", "Tiandao Academy Periodical", "GameFlagDescriptable") );
  vars.gameFlags.Add("833cf6d005f2a4b7cab231aecb5f23aeItemData", Tuple.Create("artifact_obtain", "Kunlun Immortal Portrait", "GameFlagDescriptable") );
  vars.gameFlags.Add("35dd82067571f4a4099df6a4fdbf7322ItemData", Tuple.Create("artifact_obtain", "Qiankun Board", "GameFlagDescriptable") );
  vars.gameFlags.Add("f688c32090bd9a447b2caa202e5d2537ItemData", Tuple.Create("artifact_obtain", "Ancient Sheet Music", "GameFlagDescriptable") );
  vars.gameFlags.Add("8d0f6ac6661d7ca4ab6c9a38b59e8044ItemData", Tuple.Create("artifact_obtain", "Unknown Seed", "GameFlagDescriptable") );
  vars.gameFlags.Add("0a5ecab971d381a4dad39e8bf488874dItemData", Tuple.Create("artifact_obtain", "Virtual Reality Device", "GameFlagDescriptable") );
  vars.gameFlags.Add("b9574a152b739c147a0ecc84a26bbb51ItemData", Tuple.Create("artifact_obtain", "Antique Vinyl Record", "GameFlagDescriptable") );
  vars.gameFlags.Add("cd77f022f99dce04ebc1af78be7b9b50ItemData", Tuple.Create("artifact_obtain", "Ready-to-Eat Rations", "GameFlagDescriptable") );
  vars.gameFlags.Add("e481e2d53769c64469b962d736eea9c3ItemData", Tuple.Create("artifact_obtain", "Sword of Jie", "GameFlagDescriptable") );
  vars.gameFlags.Add("f64e42e463e6c47da8eefe978273b154ItemData", Tuple.Create("artifact_obtain", "Red Guifang Clay", "GameFlagDescriptable") );
  vars.gameFlags.Add("281fc49002e760e47af668e87f3cbf82ItemData", Tuple.Create("artifact_obtain", "The Four Treasures of the Study", "GameFlagDescriptable") );
  vars.gameFlags.Add("f9035fc8724f2224f9b4e1949459eda4ItemData", Tuple.Create("artifact_obtain", "Penglai Recipe Collection", "GameFlagDescriptable") );
  vars.gameFlags.Add("b76de9e39b92a3642aaea5ef8280265fItemData", Tuple.Create("artifact_obtain", "Damaged Fusang Amulet", "GameFlagDescriptable") );
  vars.gameFlags.Add("0c76757489a7fa542b4351efc4731a49ItemData", Tuple.Create("artifact_obtain", "The Legend of the Porky Heroes", "GameFlagDescriptable") );
  vars.gameFlags.Add("c50645a6658fe4b429ea575c35c28ba3ItemData", Tuple.Create("artifact_obtain", "Portrait of Yi", "GameFlagDescriptable") );
  
  //Poisons
  vars.gameFlags.Add("c753eb7cbd4ae7048a0dcc715b23e6f0ItemData", Tuple.Create("poison_obtain", "Medicinal Citrine", "GameFlagDescriptable") );
  vars.gameFlags.Add("c40e455c58fa8e444aa5c8657de9143eItemData", Tuple.Create("poison_obtain", "Golden Yinglong Egg", "GameFlagDescriptable") );
  vars.gameFlags.Add("96d11b4a9a625ab488ca42e489787eeaItemData", Tuple.Create("poison_obtain", "Molted Tianma Hide", "GameFlagDescriptable") );
  vars.gameFlags.Add("e0c92cd8e9370e74c97d5ae797cabce6ItemData", Tuple.Create("poison_obtain", "Residual Hair", "GameFlagDescriptable") );
  vars.gameFlags.Add("66a914e6e380d464e94f6c56734179c4ItemData", Tuple.Create("poison_obtain", "Oriander", "GameFlagDescriptable") );
  vars.gameFlags.Add("2d7ce5740746b504d8ad8caebc1e4686ItemData", Tuple.Create("poison_obtain", "Turtle Scorpion", "GameFlagDescriptable") );
  vars.gameFlags.Add("ed5ec481e3a08344fa779713d791e8b7ItemData", Tuple.Create("poison_obtain", "Plantago Frog", "GameFlagDescriptable") );
  vars.gameFlags.Add("2a761d75584603d418c3a63762ce215cItemData", Tuple.Create("poison_obtain", "Porcine Gem", "GameFlagDescriptable") );
  vars.gameFlags.Add("4db95fe8859303b498f08e2290f5b6b9ItemData", Tuple.Create("poison_obtain", "Ball of Flavor", "GameFlagDescriptable") );
  vars.gameFlags.Add("cef71c68e23677d4aae949c4999dae2bItemData", Tuple.Create("poison_obtain", "Dragon's Whip", "GameFlagDescriptable") );
  vars.gameFlags.Add("3623910f44ed1d04fab5face0b376359ItemData", Tuple.Create("poison_obtain", "Necroceps", "GameFlagDescriptable") );
  vars.gameFlags.Add("3cb140e76363b774292297d90bc76d0eItemData", Tuple.Create("poison_obtain", "Guiseng", "GameFlagDescriptable") );
  vars.gameFlags.Add("4bb79b0a891845542848960ddfd0a03cItemData", Tuple.Create("poison_obtain", "Thunder Centipede", "GameFlagDescriptable") );
  vars.gameFlags.Add("00b0232c825990a45a3aad8212dff74eItemData", Tuple.Create("poison_obtain", "Wall-climbing Gecko", "GameFlagDescriptable") );
  vars.gameFlags.Add("2203778119e9b0540a493e3d4981d5e2ItemData", Tuple.Create("poison_obtain", "Gutwrench Fruit", "GameFlagDescriptable") );
  
  settings.Add("mainmenu_reset", false, "Reset on Main Menu");
  settings.Add("fileselect_start", false, "Start on existing Save");
  settings.SetToolTip("fileselect_start", "For starting timer when selecting any existing save. Don't use with new save file creation.");

  settings.Add("ability_obtain", false, "Split on obtaining ability");
  foreach (var ability in vars.abilities) { 
    settings.Add(ability.Value, false, ability.Key, "ability_obtain"); 
  }
  settings.Add("ability_exit", false, "Split on exiting Ability tutorial maps");
  foreach (var abilityroom in vars.abilityrooms) { 
    settings.Add(abilityroom.Value, false, abilityroom.Key, "ability_exit"); 
  }

  settings.Add("seal_obtain", false, "Split on exiting a Sol's Soulscape room");
  foreach (var vrmemory in vars.vrmemory) { 
    settings.Add(vrmemory.Value, false, vrmemory.Key, "seal_obtain"); 
  }
  
  // Add settings groupings for flags
  settings.Add("boss_kill", false, "Split on Boss Kill (experimental)");
  settings.Add("jade_obtain", false, "Split on obtaining a jade (experimental)");
  settings.Add("artifact_obtain", false, "Split on obtaining an artifact (experimental)");
  settings.Add("poison_obtain", false, "Split on obtaining a poison (experimental)");
  
  // Add individual flag settings
  foreach (var flagEntry in vars.gameFlags) {
    settings.Add(flagEntry.Key, false, flagEntry.Value.Item2, flagEntry.Value.Item1);
  }
}

init
{
  current.SceneIndex = 0;
  current.Scene = "";
   vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
   {
      var AppCore = mono["ApplicationCore",1];
      var GameCore = mono["GameCore",1];
      var SaveManager = mono["SaveManager",1];

      vars.Helper["loadingscreen"] = AppCore.Make<bool>("_instance","loadingScreen",0x78); // When loading screen is active
      vars.Helper["levelloading"] = GameCore.Make<bool>("_instance","gameLevel",0x1b8);  // When level is finishing the load
      vars.Helper["gamestate"] = GameCore.Make<int>("_instance","_currentCoreState"); //wow there was an actual loading state
      // vars.Helper["seamlessload"] = GameCore.Make<bool>("_instance","_currentSeamlessConnectionPoint",0x48); 

      vars.Helper["savefilestart"] = AppCore.Make<bool>("_instance","IsPlayFromTitleScreen"); 

      vars.Helper["gamestartmode2"] = mono["StartMenuLogic",1].Make<int>("_instance","gameModeFlag"); 

      /* Skills */ 
      vars.Helper["skills_HackDroneAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xf8,0x17a); 
      vars.Helper["skills_ParryJumpKickAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xa8,0x17a); 
      vars.Helper["skills_ArrowAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x110,0x17a); 
      vars.Helper["skills_ChargedAttackAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xe8,0x17a); 
      vars.Helper["skills_RollDodgeInAirUpgrade"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0xc0,0x17a); 
      vars.Helper["skills_ParryCounterAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x100,0x17a); 
      vars.Helper["skills_AirJumpAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x108,0x17a); 
      vars.Helper["skills_KillZombieFooAbility"] = GameCore.Make<bool>("_instance","playerAbilityCollection",0x118,0x17a); 
       
       /* Flags */
      var AllFlags  = vars.Helper.ReadList<IntPtr>(SaveManager.Static + SaveManager["_instance"], SaveManager["allFlags"], 0x18);
      if(AllFlags.Count == 0) {
         return false;
      }

      vars.FoundFlags = new HashSet<string>();
      foreach(IntPtr FlagPtr in AllFlags) {
         //GameFlagBase._finalSaveID
         string finalSaveID = vars.Helper.ReadString(256, ReadStringType.AutoDetect, FlagPtr + 0x20, 0x14);
         
         if(vars.gameFlags.ContainsKey(finalSaveID)) {
            string className = vars.gameFlags[finalSaveID].Item3;
            if(className == "GameFlagDescriptable") {
               //GameFlagDescriptable.Acquired
               IntPtr acquiredFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x48);
               
               //GameFlagDescriptable.Acquired._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(acquiredFieldPtr + 0x3a);
               
               vars.FoundFlags.Add(finalSaveID);
            }
            else if (className == "ScriptableDataBool") {
               //ScriptableDataBool.field
               IntPtr fieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x38);
                  
               //ScriptableDataBool.field._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(fieldPtr + 0x3a);
                  
               vars.FoundFlags.Add(finalSaveID);
            }
         }
      }
      
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
  /* (vars.Helper["gamestate"] == 2) is changing scenes, in case needed to rewrite this */ 
  return (vars.Helper["loadingscreen"].Current 
  || (!vars.Helper["levelloading"].Current) 
  || (vars.Helper["gamestate"].Current == 0)  
  || (vars.Helper["gamestate"].Current == 2) 
  || (current.SceneIndex == 0)
  || (current.SceneIndex == 72) 
  || (current.SceneIndex == 7));
}

update
{
  current.SceneIndex = vars.Helper.Scenes.Active.Index;
  current.Scene = vars.Helper.Scenes.Active.Name;

  //  if (old.Scene != current.Scene) { vars.Log("Scene changed: " + old.Scene + ": " +  old.SceneIndex + "-> " + current.Scene + ": " + current.SceneIndex); }   
}

reset 
{
  if (settings["mainmenu_reset"] && (old.SceneIndex != current.SceneIndex) && current.SceneIndex == 1) { return true; }
}


split {
    if (old.SceneIndex != current.SceneIndex) {
      foreach (var abilityroom in vars.abilityrooms) {
      /* Split on exiting ability rooms*/
        if (vars.roomIndexes[abilityroom.Value] == old.SceneIndex || vars.roomNames[abilityroom.Value] == old.Scene) {
          print("splitting for: " + abilityroom);
          if(settings[abilityroom.Value])
          {
            return vars.CompletedSplits.Add(abilityroom.Value);
          }
        }
      }
      /* Split on exiting VR memory rooms*/
      foreach (var vrmemory in vars.vrmemory) {
          if (vars.roomIndexes[vrmemory.Value] == old.SceneIndex || vars.roomNames[vrmemory.Value] == old.Scene)
          {
            print("splitting for: " + vrmemory);
            if(settings[vrmemory.Value])
            {
              return vars.CompletedSplits.Add(vrmemory.Value);
            }
          }
      }
    }

    /* Split on Ability obtain (on the first triggers) */ 
    foreach (var ability in vars.abilities) {
      if (vars.Helper[ability.Value].Current != vars.Helper[ability.Value].Old) {
        print("splitting for: " + ability);
        if(settings[ability.Value])
        {
          return vars.CompletedSplits.Add(ability.Value);
        }
      }
    }
    
    /* Split on Game Flag being set */
    foreach (var saveFlagID in vars.FoundFlags) {
      if (vars.Helper[saveFlagID].Current != vars.Helper[saveFlagID].Old) {
        print("splitting for flag: " + saveFlagID);
        if(settings[saveFlagID]) {
          return vars.CompletedSplits.Add(saveFlagID);
        }
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

51 - Lady E fight
52 - Post Lady E butterfly cutscene
58 - TaiChi Kick
59 - Charge Attack
60 - Air Dash
61 - Unbound Counter
62 - 
63 - Double Jump
66 - Kuafu Memory
67 - Goumang Memory
68 - Yanlao Memory
69 - Jiequan Memory
70 - Lady E Memory
89 - Ji Memory
90 - Fuxi Memory
91 - Nuwa Memory
103 - Eigong Soulscape
104 - Eigong Fight
113 - True Eigong Fight question mark
 */