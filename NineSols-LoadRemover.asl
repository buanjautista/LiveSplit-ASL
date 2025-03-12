state("NineSols") {}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
  vars.Helper.GameName = "NineSols";
  vars.Helper.LoadSceneManager = true;
  vars.Helper.AlertLoadless();

  vars.lastCheckedSceneIndexForMOBStart = -1;
  vars.mobFlagExists = false;

  vars.CompletedSplits = new HashSet<string>();
  vars.abilities = new Dictionary<string, string> { { "Mystic Nymph", "skills_HackDroneAbility" }, { "Tai Chi Counter", "skills_ParryJumpKickAbility" }, { "Azure Bow", "skills_ArrowAbility" }, { "Charged Strike", "skills_ChargedAttackAbility" }, { "Air Dash", "skills_RollDodgeInAirUpgrade" }, { "Unbounded Counter", "skills_ParryCounterAbility" }, { "Double Jump", "skills_AirJumpAbility" }, { "Super Mutant Buster", "skills_KillZombieFooAbility" } };
    
  vars.memoriesOfBattleBosses = new Dictionary<string, string> { { "Kuafu", "room_kuafu" }, { "Goumang", "room_goumang" },{ "Yanlao", "room_yanlao" }, { "Jiequan", "room_jiequan" }, { "Lady Ethereal", "room_ladyethereal" }, { "Ji", "room_ji" },{ "Fuxi & Nuwa", "room_fuxi" }, { "Eigong", "room_eigong" } };
  
  vars.roomIndexes = new Dictionary<string,int> { { "room_KuafuVR", 66 }, { "room_GoumangVR", 67 }, { "room_YanlaoVR", 68 }, { "room_JiequanVR", 69 }, { "room_fakeFudie", 70 }, { "room_Butterfly", 52 },{ "room_JiVR", 89 }, { "room_FuxiVR", 90 }, { "room_NuwaVR", 91 }, { "room_EigongSoulscape", 103 }, { "room_Taichi", 58 }, { "room_Charged", 59 }, { "room_Airdash", 60 }, { "room_Unbounded", 61 }, { "room_DoubleJump", 63 }, { "baichang_kill", 9 }, { "jiaoduan_kill", 11 },{ "xingtian_kill", 27 }, { "kanghui_kill", 37 }, { "huanxian_kill", 49 }, { "tianshou_kill", 64 },{ "room_kuafu", 14 }, { "room_goumang", 21 },{ "room_yanlao", 29 }, { "room_jiequan", 41 }, { "room_ladyethereal", 51 }, { "room_ji", 88 },{ "room_fuxi", 97 }, { "room_eigong", 104 }, { "trueeigong_kill", 113 }, { "mob_hub", 116 } };
  vars.roomNames = new Dictionary<string,string> { { "room_KuafuVR", "VR_Memory_Kuafu" }, { "room_GoumangVR", "VR_Memory_Goumang" }, { "room_YanlaoVR", "VR_Memory_TaoChang" }, { "room_JiequanVR", "VR_Memory_JieChuan" }, { "room_fakeFudie", "VR_Memory_FuDie" }, { "room_Butterfly", "A7_S6_Memory_Butterfly_CutScene" },{ "room_JiVR", "VR_Memory_Jee" }, { "room_FuxiVR", "VR_Memory_伏羲" }, { "room_NuwaVR", "VR_Memory_伏羲&女娲" }, { "room_EigongSoulscape", "VR_Memory_易公" }, { "room_Taichi", "AG_Tutorial_Lear_S2_??JumpKick" }, { "room_Charged", "AG_Tutorial_Lear_S3_??ChargeAttack" }, { "room_Airdash", "AG_Tutorial_Lear_S4_AirDash_????" }, { "room_Unbounded", "AG_Tutorial_Lear_S5_??ChargedParry" }, { "room_DoubleJump", "AG_Tutorial_Lear_S7_DoubleJump_???" }, { "baichang_kill", "A1_S2_ConnectionToElevator_Final" }, { "xingtian_kill", "A4_S3_ControlRoom_Final" }, { "kanghui_kill", "A5_S2_Jail_Remake_Final" }, { "huanxian_kill", "A7_S2_SectionF_MiniBossFight" }, { "jiaoduan_kill", "A2_S2_ReactorRight_Final" }, { "tianshou_kill", "A9_S1_Remake_4wei" }, { "eigong_kill", "A11_S0_Boss_YiGung" }, { "trueeigong_kill", "A11_S0_Boss_YiGung" }, { "mob_hub", "VR_Challenge_Hub" }};
  
  // Dictionary where we'll insert all game flags we want to track. 
  vars.gameFlags = new Dictionary<string, Tuple<string, string, string>>();

  // Ability Rooms 
  vars.gameFlags.Add("d7a7775c-dd94-40af-9a65-bcbc73bcef43_9e73acaa5eb0f4a65bd599ed193c852cScriptableDataBool", Tuple.Create("ability_exit", "Tai Chi Kick Room", "ScriptableDataBool") );
  vars.gameFlags.Add("a791e2f5-4cfb-4be0-a8aa-cb4344ce5784_ee992f5c8f50b4b0caa5ef6c27d19d4dScriptableDataBool", Tuple.Create("ability_exit", "Charged Strike Room", "ScriptableDataBool") );
  vars.gameFlags.Add("fcdd31e0-0772-4907-91e9-e27eac5446fe_6c434469f3b6049638220e464708ceafScriptableDataBool", Tuple.Create("ability_exit", "Air Dash Room", "ScriptableDataBool") );
  vars.gameFlags.Add("8e8f9d2c-8420-4056-8bef-256d981ca747_d9471a64dd55c486bbe604ae326ac961ScriptableDataBool", Tuple.Create("ability_exit", "Unbounded Counter Room", "ScriptableDataBool") );
  vars.gameFlags.Add("8be2b95b-1b1c-443f-80d3-f488ecb52145_3cf7cd9b3e2c840af8ec10763a0c7fceScriptableDataBool", Tuple.Create("ability_exit", "Double Jump Room", "ScriptableDataBool") );
  
  // Sols Seals
  vars.gameFlags.Add("3e29d950db438456f856b339b02af177ItemData", Tuple.Create("seal_obtain", "Kuafu Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("687e430938a164d249d0b3befeb786a3ItemData", Tuple.Create("seal_obtain", "Goumang Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("9391d80ddafa5d74eb3aca1449ed63ecItemData", Tuple.Create("seal_obtain", "Yanlao Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("3596ea85d82e7d9419ee710c50c19655ItemData", Tuple.Create("seal_obtain", "Jiequan Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("f54ffa939efda244f9193ffd5379ee99ScriptableDataBool", Tuple.Create("seal_obtain", "Fake Lady Ethereal Seal", "ScriptableDataBool") );
  vars.gameFlags.Add("7d7086dda1d540f4ab32c919d59ea036ItemData", Tuple.Create("seal_obtain", "Lady Ethereal Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("0218216d41d6441d69da23ea385d9452ItemData", Tuple.Create("seal_obtain", "Ji Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("3f04475e7c59f458a850f1725cf8f197ItemData", Tuple.Create("seal_obtain", "Fuxi Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("cea7218ddb8b449008101c3ccdc8b50bItemData", Tuple.Create("seal_obtain", "Nuwa Seal", "GameFlagDescriptable") );
  vars.gameFlags.Add("6146c740-3940-4975-8061-a93726013e17_ab6a52c60b84a4d6fb5a32242f77bad1ScriptableDataBool", Tuple.Create("seal_obtain", "Eigong Soulscape", "ScriptableDataBool") );

  // Boss Kills
  vars.gameFlags.Add("740a8b30-e3cc-4acc-9f5f-da3aaae1df5e_51c211e21fecd9e4c92f41d8d72aa395ScriptableDataBool", Tuple.Create("boss_kill", "Red Tiger Elite: Baichang", "ScriptableDataBool") );
  vars.gameFlags.Add("2798b3a9-1026-4d53-b41c-5489699a19de_c3c3f30fb046d9743aea48eb8f4833bcScriptableDataBool", Tuple.Create("boss_kill", "Celestial Sentinel: Jiaoduan", "ScriptableDataBool") );
  vars.gameFlags.Add("593da1d0fcfe85e45b43c39ccb2c6d19ScriptableDataBool", Tuple.Create("boss_kill", "General: Yingzhao", "ScriptableDataBool") );
  vars.gameFlags.Add("f5b26e3311ce4e84a961dc36a05e19b7ScriptableDataBool", Tuple.Create("boss_kill", "Goumang", "ScriptableDataBool") );
  vars.gameFlags.Add("098316c3b4ddf514fbc2dc2806475da2ScriptableDataBool", Tuple.Create("boss_kill", "Xingtian", "ScriptableDataBool") );
  vars.gameFlags.Add("b500f8ebeb10f46a085b9720f5a78affScriptableDataBool", Tuple.Create("boss_kill", "Kanghui", "ScriptableDataBool") );
  vars.gameFlags.Add("bc5ca55c-065c-4ad8-9f18-bbc7ab2e468a_11c84f9bfd4e1445395ec443308d3965ScriptableDataBool", Tuple.Create("boss_kill", "Celestial Enforcer: Huanxian", "ScriptableDataBool") );
  vars.gameFlags.Add("50926aad-0750-4f3b-9318-dc5da45e75f1_4256ef2ec22f942dc9f70607bb00391fScriptableDataBool", Tuple.Create("boss_kill", "The Great Miner: Tianshou", "ScriptableDataBool") );
  vars.gameFlags.Add("b02ac84c63b804448b50c45c7f19ebb8ScriptableDataBool", Tuple.Create("boss_kill", "Red Tiger Elite: Lieguan", "ScriptableDataBool") );
  vars.gameFlags.Add("eb5c407de5f18ae478f86b4287bcd600ScriptableDataBool", Tuple.Create("boss_kill", "Spirit Keeper: Cixing", "ScriptableDataBool") );
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
  
  // Poisons
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

  // Root Nodes
  vars.gameFlags.Add("3f4604f810c9e9a469f01d352d8035b9TeleportPointData", Tuple.Create("rootnode_unlock", "Galactic Dock", "GameFlagDescriptable") );
  vars.gameFlags.Add("b3cf5264bd5d54b06975638acac58b2aTeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Monitoring)", "GameFlagDescriptable") );
  vars.gameFlags.Add("113385c61a2544446925e7516fea6016TeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Elevator) 1", "GameFlagDescriptable") );
  vars.gameFlags.Add("2ee85cc763a3d413f9b6e18e7e1fee67TeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Elevator) 2", "GameFlagDescriptable") );
  vars.gameFlags.Add("b9e8a5c6d9f6e4812bf9cc30810faadbTeleportPointData", Tuple.Create("rootnode_unlock", "Apeman Facility (Depths)", "GameFlagDescriptable") );
  vars.gameFlags.Add("9bf82941e7038a44980ca867c751e5cbTeleportPointData", Tuple.Create("rootnode_unlock", "Power Reservoir (Central)", "GameFlagDescriptable") );
  vars.gameFlags.Add("610a3a3232701af47b876a660910fccaTeleportPointData", Tuple.Create("rootnode_unlock", "Power Reservoir (East)", "GameFlagDescriptable") );
  vars.gameFlags.Add("a71b5769629d443ef9af5e3a05385c73TeleportPointData", Tuple.Create("rootnode_unlock", "Power Reservoir (West)", "GameFlagDescriptable") );
  vars.gameFlags.Add("b3310817230814fa09f5fa3b12cb6293TeleportPointData", Tuple.Create("rootnode_unlock", "Radiant Pagoda", "GameFlagDescriptable") );
  vars.gameFlags.Add("e5246ef15ff2a41ae884071b014351f4TeleportPointData", Tuple.Create("rootnode_unlock", "Central Transport Hub", "GameFlagDescriptable") );
  vars.gameFlags.Add("07215bbc4dc4247aeb7a980bf4910bf9TeleportPointData", Tuple.Create("rootnode_unlock", "Lake Yaochi Ruins", "GameFlagDescriptable") );
  vars.gameFlags.Add("126a7caa6701e4f0a9059b603a309c3fTeleportPointData", Tuple.Create("rootnode_unlock", "Greenhouse", "GameFlagDescriptable") );
  vars.gameFlags.Add("b242c961367ad6a49889999af22a46d9TeleportPointData", Tuple.Create("rootnode_unlock", "Water & Oxygen Synthesis", "GameFlagDescriptable") );
  vars.gameFlags.Add("1025e9e6b5d9440979328bcc29d89468TeleportPointData", Tuple.Create("rootnode_unlock", "Agrarian Hall", "GameFlagDescriptable") );
  vars.gameFlags.Add("685eb4dc303abbd43a67a07cf0459c64TeleportPointData", Tuple.Create("rootnode_unlock", "Yinglong Canal", "GameFlagDescriptable") );
  vars.gameFlags.Add("afbe61da78699487faccd6f0ae1d9667TeleportPointData", Tuple.Create("rootnode_unlock", "Outer Warehouse", "GameFlagDescriptable") );
  vars.gameFlags.Add("2c8de8a9dfacf4f65a0fa1e60a16f852TeleportPointData", Tuple.Create("rootnode_unlock", "Inner Warehouse", "GameFlagDescriptable") );
  vars.gameFlags.Add("242132789f3c9e94bbabb096bad651a5TeleportPointData", Tuple.Create("rootnode_unlock", "Boundless Repository", "GameFlagDescriptable") );
  vars.gameFlags.Add("c748d8c36b73c464fa38d9b156c0b0bcTeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Great Hall)", "GameFlagDescriptable") );
  vars.gameFlags.Add("28a1908d9e21d4136b8c903e2b92b0afTeleportPointData", Tuple.Create("rootnode_unlock", "Prison", "GameFlagDescriptable") );
  vars.gameFlags.Add("4970d157835c54adbb55bb4f8e245fdfTeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Machine Room)", "GameFlagDescriptable") );
  vars.gameFlags.Add("7a581656cd08345b793d7ad2b14e9943TeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Production Area)", "GameFlagDescriptable") );
  vars.gameFlags.Add("7b8d46b0c0c1845fe893ce18aa67bca3TeleportPointData", Tuple.Create("rootnode_unlock", "Shengwu Hall", "GameFlagDescriptable") );
  vars.gameFlags.Add("f1e11be280022400caf9c8593ead7d43TeleportPointData", Tuple.Create("rootnode_unlock", "Factory (Underground)", "GameFlagDescriptable") );
  vars.gameFlags.Add("3b7b8da692cb64d298142612c02daa4cTeleportPointData", Tuple.Create("rootnode_unlock", "Abandoned Mines", "GameFlagDescriptable") );
  vars.gameFlags.Add("c971454704bfa480880660b06e4af2c7TeleportPointData", Tuple.Create("rootnode_unlock", "Cortex Center", "GameFlagDescriptable") );
  vars.gameFlags.Add("8e915ab1790ef69468d4d49d4f338db2TeleportPointData", Tuple.Create("rootnode_unlock", "Empyrean Dist. (Passages)", "GameFlagDescriptable") );
  vars.gameFlags.Add("1a4e7bc2545139145ba229dac285581bTeleportPointData", Tuple.Create("rootnode_unlock", "Empyrean Dist. (Living Area)", "GameFlagDescriptable") );
  vars.gameFlags.Add("ba5ec4c4a702ba84baec1326a803b2b6TeleportPointData", Tuple.Create("rootnode_unlock", "Empyrean Dist. (Sanctum)", "GameFlagDescriptable") );
  vars.gameFlags.Add("32bafafe1cacf5c49af2f7c9e45fe511TeleportPointData", Tuple.Create("rootnode_unlock", "Sky Tower", "GameFlagDescriptable") );
  vars.gameFlags.Add("4bb93fbefaedb8e47949d1d384220c21TeleportPointData", Tuple.Create("rootnode_unlock", "Grotto of Scriptures (Entry)", "GameFlagDescriptable") );
  vars.gameFlags.Add("1b81567d30abe194d845d3f08beae8fdTeleportPointData", Tuple.Create("rootnode_unlock", "Grotto of Scriptures (East)", "GameFlagDescriptable") );
  vars.gameFlags.Add("fbaf57e3f6bea904ea8c150e5915bcf4TeleportPointData", Tuple.Create("rootnode_unlock", "Grotto of Scriptures (West)", "GameFlagDescriptable") );
  vars.gameFlags.Add("5c30ad493bbdebc40a2370664d46b830TeleportPointData", Tuple.Create("rootnode_unlock", "Tiandao Research Center", "GameFlagDescriptable") );
  vars.gameFlags.Add("473d9c581cd574f62a36519ae3d451ebTeleportPointData", Tuple.Create("rootnode_unlock", "Tianhuo Research Institute", "GameFlagDescriptable") );
  vars.gameFlags.Add("da6613d2c8f7e4eb6ae1b4d0fe7fee93TeleportPointData", Tuple.Create("rootnode_unlock", "New Kunlun Control Hub", "GameFlagDescriptable") );

  // Map Unlock:  Apeman Facility
  vars.gameFlags.Add("8f7933bdb493346fbabe65c6f29c76b6GameLevelMapData", Tuple.Create("map_unlock_apeman", "Apeman Facility (Monitoring)", "GameLevelMapData") );
  vars.gameFlags.Add("7ca1bdfe0f0ba4252b922f03a614cd29GameLevelMapData", Tuple.Create("map_unlock_apeman", "Apeman Facility (Elevator)", "GameLevelMapData") );
  vars.gameFlags.Add("b0ef27248fa9b5449ae2652773568edaGameLevelMapData", Tuple.Create("map_unlock_apeman", "Apeman Facility (Depths)", "GameLevelMapData") );

  // Map Unlock:  New Kunlun Hub
  vars.gameFlags.Add("28cc855e19c274a9b838cfa9a73868feGameLevelMapData", Tuple.Create("map_unlock_hub", "New Kunlun Central Hall", "GameLevelMapData") );
  vars.gameFlags.Add("1d24fc87063235c40b83b837dcab39a5GameLevelMapData", Tuple.Create("map_unlock_hub", "Four Seasons Pavilion", "GameLevelMapData") );
  vars.gameFlags.Add("88a9cc79311d449cebea7eb27e1a1593GameLevelMapData", Tuple.Create("map_unlock_hub", "New Kunlun Control Hub", "GameLevelMapData") );

  // Map Unlock:  Power Reservoir
  vars.gameFlags.Add("4adb7585036fd48a0a2868ea719fb329GameLevelMapData", Tuple.Create("map_unlock_reservoir", "Central Transport Hub", "GameLevelMapData") );
  vars.gameFlags.Add("74a699f7b6c6e44b5bd90db491c2e625GameLevelMapData", Tuple.Create("map_unlock_reservoir", "Power Reservoir (East)", "GameLevelMapData") );
  vars.gameFlags.Add("e587381daf2bd4b7fa349239ef68a3fbGameLevelMapData", Tuple.Create("map_unlock_reservoir", "Power Reservoir (Central)", "GameLevelMapData") );
  vars.gameFlags.Add("421b37992e6364d9fa83de4d85cc037eGameLevelMapData", Tuple.Create("map_unlock_reservoir", "Power Reservoir (West)", "GameLevelMapData") );
  vars.gameFlags.Add("cdeee1168f485e74887d0fe58c43681eGameLevelMapData", Tuple.Create("map_unlock_reservoir", "Radiant Pagoda", "GameLevelMapData") );

  // Map Unlock: Agricultural Zone
  vars.gameFlags.Add("9cc919f329be2405dada15762d5332b4GameLevelMapData", Tuple.Create("map_unlock_agricultural", "Lake Yaochi Ruins", "GameLevelMapData") );
  vars.gameFlags.Add("744ab7b9ed08a405ea3b4cb036ffdcacGameLevelMapData", Tuple.Create("map_unlock_agricultural", "Greenhouse", "GameLevelMapData") );
  vars.gameFlags.Add("6c2a22089e6da4355992a205f3ecdfe2GameLevelMapData", Tuple.Create("map_unlock_agricultural", "Water & Oxygen Synthesis", "GameLevelMapData") );
  vars.gameFlags.Add("0de4247fc506d4d8dbd9af186ed54dbeGameLevelMapData", Tuple.Create("map_unlock_agricultural", "Yinglong Canal", "GameLevelMapData") );
  vars.gameFlags.Add("bc9ddef07c1e646a294e14745f0046f8GameLevelMapData", Tuple.Create("map_unlock_agricultural", "Agrarian Hall", "GameLevelMapData") );

  // Map Unlock: Warehouse Zone
  vars.gameFlags.Add("56bbbc379774e3f47b1be9aaecae0b2aGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Outer Warehouse", "GameLevelMapData") );
  vars.gameFlags.Add("0626b4332cff9a04ea51ae1f645a0d3dGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Inner Warehouse", "GameLevelMapData") );
  vars.gameFlags.Add("7ef7c38a76eabc54384407e924a0b730GameLevelMapData", Tuple.Create("map_unlock_warehouse", "Boundless Repository (Entrance)", "GameLevelMapData") );
  vars.gameFlags.Add("11ff35b24567fa343b857b647ba2668eGameLevelMapData", Tuple.Create("map_unlock_warehouse", "Boundless Repository (Inside)", "GameLevelMapData") );
  vars.gameFlags.Add("1284f6d249c6cd44fb48ca86ec8f6977GameLevelMapData", Tuple.Create("map_unlock_warehouse", "Yangu Hall", "GameLevelMapData") );

  // Map Unlock: Abandoned Mines (Zone)
  vars.gameFlags.Add("23257e47847f7484e823915fe7386576GameLevelMapData", Tuple.Create("map_unlock_mines", "Factory (Underground)", "GameLevelMapData") );
  vars.gameFlags.Add("a69792854844a0d4da78200efd6c3975GameLevelMapData", Tuple.Create("map_unlock_mines", "Abandoned Mines (Location)", "GameLevelMapData") );

  // Map Unlock: Livestock Area
  vars.gameFlags.Add("61d15845d3cb94b548b08824a799151fGameLevelMapData", Tuple.Create("map_unlock_livestock", "Underground Cave", "GameLevelMapData") );
  vars.gameFlags.Add("faf89d9b9b6b1496bba3a6e7c5ab9b87GameLevelMapData", Tuple.Create("map_unlock_livestock", "95th Livestock Pen", "GameLevelMapData") );
  vars.gameFlags.Add("f15bfb246c722428fb4eee0c3b7f82c8GameLevelMapData", Tuple.Create("map_unlock_livestock", "Livestock Harvesting Platform", "GameLevelMapData") );
  vars.gameFlags.Add("26eb02f24e33f4bbb8d6796b4536b7eeGameLevelMapData", Tuple.Create("map_unlock_livestock", "Galactic Dock", "GameLevelMapData") );

  // Map Unlock: Transmutation Zone
  vars.gameFlags.Add("c666721e0b9424246aa81fd37c5fbd2dGameLevelMapData", Tuple.Create("map_unlock_transmutation", "Factory (Great Hall)", "GameLevelMapData") );
  vars.gameFlags.Add("51114c048273a42ce8d8fc76edba10aaGameLevelMapData", Tuple.Create("map_unlock_transmutation", "Prison", "GameLevelMapData") );
  vars.gameFlags.Add("c74093ff6ef0c984d98d82ecabdf6badGameLevelMapData", Tuple.Create("map_unlock_transmutation", "Factory (Machine Room)", "GameLevelMapData") );
  vars.gameFlags.Add("b9bf8897ef19a4daf8803979a9e59cf7GameLevelMapData", Tuple.Create("map_unlock_transmutation", "Factory (Production Area)", "GameLevelMapData") );
  vars.gameFlags.Add("ac5fbcf2517b94389b3f4a41fa1cce06GameLevelMapData", Tuple.Create("map_unlock_transmutation", "Shengwu Hall", "GameLevelMapData") );

  // Map Unlock: Central Core
  vars.gameFlags.Add("592b140bacb5a4079a77c071ac2df07eGameLevelMapData", Tuple.Create("map_unlock_centralcore", "Cortex Center", "GameLevelMapData") );
  vars.gameFlags.Add("4727637957ed4d74ebc6d4697a9df90cGameLevelMapData", Tuple.Create("map_unlock_centralcore", "Lady Ethereal's Soulscape", "GameLevelMapData") );
  vars.gameFlags.Add("f1c9ab9f-0e22-4105-8267-54e4b2a68572_93653f615d5940a409fffdcecb72ec43ScriptableDataBool", Tuple.Create("map_unlock_centralcore", "Lady Ethereal Butterfly Segment", "ScriptableDataBool") );

  // Map Unlock: Empyrean District
  vars.gameFlags.Add("5a29d1bfe51aa470ea7021414fa4e21bGameLevelMapData", Tuple.Create("map_unlock_empyrean", "Sky Tower", "GameLevelMapData") );
  vars.gameFlags.Add("e8a25a5db46b8420ba9d35eb15ae52dfGameLevelMapData", Tuple.Create("map_unlock_empyrean", "Empyrean District (Passages)", "GameLevelMapData") );
  vars.gameFlags.Add("0fe1c121c3ffe40d48ec7a1b3549b764GameLevelMapData", Tuple.Create("map_unlock_empyrean", "Empyrean District (Living Area)", "GameLevelMapData") );
  vars.gameFlags.Add("135eb5244f8364f5d9d2730cdcf1baf6GameLevelMapData", Tuple.Create("map_unlock_empyrean", "Empyrean Dist. (Sanctum)", "GameLevelMapData") );
  vars.gameFlags.Add("e0383e548585949dfb08a78da77da3baGameLevelMapData", Tuple.Create("map_unlock_empyrean", "Nobility Hall", "GameLevelMapData") );

  // Map Unlock: Grotto of Scriptures
  vars.gameFlags.Add("870830f0908bd4a43a4d28423da262e4GameLevelMapData", Tuple.Create("map_unlock_grotto", "Grotto of Scriptures (Entry)", "GameLevelMapData") );
  vars.gameFlags.Add("dd671cd697ba07241ad0b84940dbe3f2GameLevelMapData", Tuple.Create("map_unlock_grotto", "Grotto of Scriptures (East)", "GameLevelMapData") );
  vars.gameFlags.Add("b0927634d15cba840badaaf7e98bd899GameLevelMapData", Tuple.Create("map_unlock_grotto", "Grotto of Scriptures (West)", "GameLevelMapData") );
  vars.gameFlags.Add("18a1f7553ca544723af90380184b3cafGameLevelMapData", Tuple.Create("map_unlock_grotto", "Ancient Stone Pillar", "GameLevelMapData") );

  // Map Unlock: Research Institute
  vars.gameFlags.Add("4b88e20fbe4db4e018bc7c51cfd06317GameLevelMapData", Tuple.Create("map_unlock_institute", "Tiandao Research Center", "GameLevelMapData") );
  vars.gameFlags.Add("004d9523761fd5b47935512baf84bbc3GameLevelMapData", Tuple.Create("map_unlock_institute", "Tianhuo Research Institute", "GameLevelMapData") );

  
  // settings.Add("mainmenu_reset", false, "Reset on Main Menu");
  settings.Add("fileselect_start", false, "Start on existing Save");
  settings.SetToolTip("fileselect_start", "For starting timer when selecting any existing save. Don't use with new save file creation.");
  settings.Add("memories_start", false, "Start on Memories of Battle boss");
  settings.SetToolTip("memories_start", "For starting timer when starting a boss fight in Memories of Battle mode");
  settings.Add("memories_reset", false, "Reset on Memories of Battle retry");
  settings.SetToolTip("memories_reset", "For resetting timer when dying or pressing Retry in Memories of Battle (ILs)");

  settings.Add("ability_obtain", false, "Split on obtaining ability");
  foreach (var ability in vars.abilities) { 
    settings.Add(ability.Value, false, ability.Key, "ability_obtain"); 
  }

  // Add settings groupings for flags
  settings.Add("ability_exit", false, "Split on exiting Ability tutorial maps");
  settings.Add("seal_obtain", false, "Split on exiting a Sol's Soulscape room");
  settings.Add("boss_kill", false, "Split on Boss Kill");
  settings.Add("jade_obtain", false, "Split on obtaining a jade");
  settings.Add("artifact_obtain", false, "Split on obtaining an artifact");
  settings.Add("poison_obtain", false, "Split on obtaining a poison");
  settings.Add("rootnode_unlock", false, "Split on unlocking a root node");
  settings.Add("map_unlock", false, "Split on entering a new area");
  
  // Groupings for map unlock sub-areas
  settings.Add("map_unlock_apeman", false, "Apeman Facility", "map_unlock");
  settings.Add("map_unlock_hub", false, "New Kunlun Hub", "map_unlock");
  settings.Add("map_unlock_reservoir", false, "Power Reservoir", "map_unlock");
  settings.Add("map_unlock_agricultural", false, "Agricultural Zone", "map_unlock");
  settings.Add("map_unlock_warehouse", false, "Warehouse Zone", "map_unlock");
  settings.Add("map_unlock_mines", false, "Abandoned Mines", "map_unlock");
  settings.Add("map_unlock_livestock", false, "Livestock Area", "map_unlock");
  settings.Add("map_unlock_transmutation", false, "Transmutation Zone", "map_unlock");
  settings.Add("map_unlock_centralcore", false, "Central Core", "map_unlock");
  settings.Add("map_unlock_empyrean", false, "Empyrean District", "map_unlock");
  settings.Add("map_unlock_grotto", false, "Grotto of Scriptures", "map_unlock");
  settings.Add("map_unlock_institute", false, "Research Institute", "map_unlock");
  
  // Add individual flag settings
  foreach (var flagEntry in vars.gameFlags) {
    settings.Add(flagEntry.Key, false, flagEntry.Value.Item2, flagEntry.Value.Item1);
  }

  settings.Add("mob_kill", false, "Split on Battle Memories Boss Kill");
  foreach (var boss in vars.memoriesOfBattleBosses) { 
    settings.Add(boss.Value, false, boss.Key, "mob_kill"); 
  }
}

init
{
  current.SceneIndex = 0;
  current.Scene = "";
  current.bossPostureSystem = 0;
  current.bossHPBar = 0;
  current.bossPhase = 0;

  current.JiFix = false;

  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
   {
      var AppCore = mono["ApplicationCore",1];
      var GameCore = mono["GameCore",1];
      var ApplicationUIGroupManager = mono["ApplicationUIGroupManager", 1];
      var SaveManager = mono["SaveManager",1];
      var ConfigManager = mono["ConfigManager", 1];
      var CheatManager = mono["CheatManager", 1];
      var CameraManager = mono["CameraManager",1];
      var MonsterManager = mono["MonsterManager",1];

      vars.Helper["loadingscreen"] = AppCore.Make<bool>("_instance","loadingScreen",0x78); // When loading screen is active
      // vars.Helper["levelloading"] = GameCore.Make<bool>("_instance","gameLevel",0x1b8);  // When level is finishing the load, currently not in use
      vars.Helper["gamestate"] = GameCore.Make<int>("_instance","_currentCoreState"); //wow there was an actual loading state
      vars.Helper["YiHP"] = GameCore.Make<float>("_instance","player",0x470,0x94); 

      vars.Helper["savefilestart"] = AppCore.Make<bool>("_instance","IsPlayFromTitleScreen"); 

      vars.Helper["gamestartmode2"] = mono["StartMenuLogic",1].Make<int>("_instance","gameModeFlag"); 
      
      vars.Helper["blackCoverOpacity"] = ApplicationUIGroupManager.Make<float>("_instance", "blackCover", 0x70 + 0xc); // ApplicationUIGroupManager.blackCover.m_color.a

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
      vars.Helper["SlowMotion"] = mono["TimePauseManager",1].Make<float>("_instance","gamePlayTimeScaleModifier", 0x30); 
      // vars.Helper["PhaseIndex"] = GameCore.Make<int>("_instance","player", 0x4c8,0x418); 

      vars.Helper["bossHPUIList"] = GameCore.MakeList<IntPtr>("_instance", "monsterHpUI", 0x40); 
      
      vars.Helper["cameraHighlightTime"] = CameraManager.Make<float>("_instance", "currentCameraCore", 0xcc); 
      vars.Helper["cameraHighlight"] = CameraManager.Make<bool>("_instance", "currentCameraCore", 0xb0, 0x20); 
       
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
               //GameFlagDescriptable.acquired
               //IntPtr acquiredFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x48);

               //GameFlagDescriptable.unlocked
               IntPtr unlockedFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x40);
               
               //GameFlagDescriptable.unlocked._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(unlockedFieldPtr + 0x3a);
               
               vars.FoundFlags.Add(finalSaveID);
            }
            else if (className == "ScriptableDataBool") {
               //ScriptableDataBool.field
               IntPtr fieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x38);
                  
               //ScriptableDataBool.field._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(fieldPtr + 0x3a);
                  
               vars.FoundFlags.Add(finalSaveID);
            }
            else if (className == "GameLevelMapData") {
               //GameLevelMapData.unlocked
               IntPtr unlockedFieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x68);
                  
               //GameLevelMapData.unlocked._currentValue;
               vars.Helper[finalSaveID] = vars.Helper.Make<bool>(unlockedFieldPtr + 0x3a);
                  
               vars.FoundFlags.Add(finalSaveID);
            }
         }
         
         // Special case: Store the flag that tells us if we're currently in Memories of Battle
         if(finalSaveID == "3173df12f14fc4862bf4588193b8cfc3ScriptableDataBool") { 
               //ScriptableDataBool.field
               IntPtr fieldPtr = vars.Helper.Read<IntPtr>(FlagPtr + 0x38);
                  
               //ScriptableDataBool.field._currentValue;
               vars.Helper["MemoriesOfBattleFlag"] = vars.Helper.Make<bool>(fieldPtr + 0x3a);
               vars.mobFlagExists = true;
         }
      }

      // Closest monster check for Jiequan
      if (vars.mobFlagExists) {
        vars.Helper["closetMonster"] = MonsterManager.Make<IntPtr>("_instance","_closetMonster"); 
        vars.Helper["currentEnemyPosture"] = MonsterManager.Make<float>("_instance","_closetMonster",0x3d0,0x94); 
      }
      
      return true;
   });
}

start {
  if(settings["memories_start"] && vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current) {
    // If the BossHPList is not empty, get the current boss HP on fight start to trigger auto-start for ILs
    if (vars.Helper["bossHPUIList"].Current.Count != vars.Helper["bossHPUIList"].Old.Count 
        && vars.Helper["bossHPUIList"].Current.Count >= vars.Helper["bossHPUIList"].Old.Count) { 

      // Cheap fix for Ji fight auto-start
      if (current.SceneIndex == 0 && current.JiFix == false) {
        current.JiFix = true;
        return false;
      }

      // print("START MOB: " +  vars.Helper["bossHPUIList"].Current.Count + " - " + vars.Helper["bossHPUIList"].Old.Count);
      return true;
    }
    // Jiequan detection fix, start on detecting a change in the closetMonster pointer and if the HP is jiequan's max MoB HP
    if (current.SceneIndex == 41 && vars.Helper["closetMonster"] != null && vars.Helper["closetMonster"].Current != vars.Helper["closetMonster"].Old && vars.Helper["currentEnemyPosture"].Current == 5400) 
    { 
      return true;
      // print("Start Jiequan: " + vars.Helper["currentEnemyPosture"].Current + " " + current.bossPostureSystem);
    }
  }

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
  current.JiFix = false;
}

isLoading
{
  // || (!vars.Helper["levelloading"].Current)  was causing issues, leaving as comment in case we need it again  
  return (vars.Helper["loadingscreen"].Current 
  || (vars.Helper["gamestate"].Current == 0)  
  || (vars.Helper["gamestate"].Current == 2) 
  || (current.SceneIndex == 0)
  || (current.SceneIndex == 72) 
  || (current.SceneIndex == 7)
  || (current.SceneIndex == 1 && vars.Helper["blackCoverOpacity"].Current > 0.99f));
}

update
{
  current.SceneIndex = vars.Helper.Scenes.Active.Index;

  if(old.SceneIndex != current.SceneIndex) { 
    // dirty fix for Ji autostart
    if (current.SceneIndex == 88) { current.JiFix = false;  }
    
    // jiequan HP detection fix reset on scene change
    if (current.SceneIndex == 41) { current.bossPostureSystem = 0; }
  }  

  // MoB HP detection updates
  if(vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current) {
    if (current.SceneIndex == 41) {  
      // jiequan HP detection
      current.bossPostureSystem = vars.Helper["currentEnemyPosture"].Current; 
    } 
    else { 
      // Go through the boss HP list and store the current posture system HP value
      // GameCore -> UIMonsterHPManager -> bossHPList<UIBossHP> (destruct)
      foreach(IntPtr BossHPUI in vars.Helper["bossHPUIList"].Current) {
        IntPtr BossPosture = vars.Helper.Read<IntPtr>(BossHPUI + 0x70);
        current.bossHPBar = vars.Helper.Read<float>(BossHPUI + 0xa4);

        // UIBossHP -> PostureSystem -> _value
        current.bossPostureSystem = vars.Helper.Read<float>(BossPosture + 0x94); 

        // UIBossHP -> PostureSystem -> bindMonster (MonsterBase) -> phaseIndex
        current.bossPhase = vars.Helper.Read<int>(BossPosture + 0x30 + 0x448);
      }
    }
  }
}

reset 
{
//   if (settings["mainmenu_reset"] && (old.SceneIndex != current.SceneIndex) && current.SceneIndex == 1) { return true; }

  // Reset on retry for ILs
  if (settings["memories_reset"] && vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current && vars.Helper["YiHP"].Current <= 0) { 
    return true; 
  }
}

split {
    // Don't trigger any splits that check game flags when we're on the main menu
    // These flags could contain values from previously loaded saves, resulting in splits being triggered when starting a run
    if(current.SceneIndex != 1)
    {
      /* Split on Ability obtain (on the first triggers) */ 
      foreach (var ability in vars.abilities) {
        if(settings[ability.Value] && !vars.CompletedSplits.Contains(ability.Value)) {
          if (vars.Helper[ability.Value].Current) {
            print("splitting for: " + ability);
            vars.CompletedSplits.Add(ability.Value);
            return true;
          }
        }
      }
    
      /* Split on Game Flag being set */
      foreach (var saveFlagID in vars.FoundFlags) {
        if (settings[saveFlagID] && !vars.CompletedSplits.Contains(saveFlagID)) {
          if (vars.Helper[saveFlagID].Current) {
            print("splitting for flag: " + vars.gameFlags[saveFlagID].Item1 + " - " + vars.gameFlags[saveFlagID].Item2);
            vars.CompletedSplits.Add(saveFlagID);
            return true;
          }
        }
      }
    }

    
    /* Split on Memories of Battle Boss Kill (experimental)
      Camera LastHitHighlight is the black and white effect on kill, and its time is set to 2f when the effect goes on screen. It has a HighlightCamera.enabled property i havent seen how to obtain yet.
      This would grab that duration as the trigger and also check if the boss has less than 1 HP for certain cases where it ends at less than 0.5 HP and fully dies after the black and white */
    if(vars.mobFlagExists && vars.Helper["MemoriesOfBattleFlag"].Current) {
      if (vars.Helper["cameraHighlightTime"].Current != vars.Helper["cameraHighlightTime"].Old && vars.Helper["cameraHighlightTime"].Current > 1.95 && current.bossPostureSystem <= 1)  {
        foreach (var boss in vars.memoriesOfBattleBosses) {
          if (current.SceneIndex == vars.roomIndexes[boss.Value]) {
            if (settings[boss.Value] && !vars.CompletedSplits.Contains(boss.Value)) {
              print("splitting for: " + boss);
              vars.CompletedSplits.Add(boss.Value);
              return true;
            }
          }
        }
      }
    }

    return false;
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