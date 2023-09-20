// Ideally for v3.3.3 on Steam, untested on other places yet

state("evansremains","v3_3_3"){
    // bool startCond: 0x08D518, 0xC;
    int startCond: 0x0895F4, 0x0;
    int mapNumber: 0x125390, 0x0;
    int meetAurelio: 0x117970, 0x64;
}

init { 
    vars.picnic = 0; 
}

startup {
    settings.Add("cloverroom", false, "Split on entering Clover Flashbacks");
    settings.Add("menureset", false, "Reset on Main Menu");
    settings.Add("aurelio", false, "Split on meeting Aurelio");
}

start {
    // return (startCond);
    if (current.startCond > old.startCond) {
        return true;
    }
}

reset { 
    if (settings["menureset"] && old.mapNumber == 1 && current.mapNumber == 2) { 
        return true;
    }
}

/* Level codes:
1 = Loading Screen
2 = Intro credits
4 = Main Menu
5 - Area 1 - Beach
6 - Beach Outro
7 - Area 9 - Evan Beach
8 - Area 2 - Lake
9 - Area 3 - City
10 - Area 4 - Pillars
11 - Area 5 - Garden
12 - Area 6 - Towers / Clover RIP
13 - Area 7 - Water Treatment Plant
14 - Area 8 - Flowers
15 - Clover Flashbacks
16 - Clover Village
20 - Dysis' Room
*/



split {
    if (old.mapNumber < 5) { return false; } // skips splitting if coming from any non-story map (aka continue mostly)
    
    if (current.mapNumber > old.mapNumber) {
        // avoid splitting on going from game to main menu
        if (current.mapNumber <= 4) { return false; } // loading screen
        
        // avoid splitting when starting a new game so it doesnt instasplit
        if (current.mapNumber == 5) { return false; } // level 1

        // skips splitting when entering Dysis or Clover cutscenes (unless setting for clover flashback)
        if (current.mapNumber == 15) { 
                if (!settings["cloverroom"]) { return false; }
                    return true;
            } // evan clover cutscene
        
        // dont split on dysis room cutscenes
        if (current.mapNumber == 20) { return false; } // dysis room

        return true;
    }

    if (current.mapNumber < old.mapNumber) {
        // splits after evan and clover flashbacks
        if (old.mapNumber == 15) {
            if (current.mapNumber == 11) {
                if (vars.picnic == 1) { return false; } // to avoid splitting on picnic cutscene after clover memories lv5
                vars.picnic = 1;
                return true; 
            } 
            return true;
        } 

        // dont split on dysis room cutscenes
        if (old.mapNumber == 20) { return false; }
    }

    if (settings["aurelio"]) {
        if (current.mapNumber == 13 && current.meetAurelio == 32 && old.meetAurelio == 0) {
            return true;
        }
    }
}