package nslm2.modules.foundations.setting.view
{
   import game.ui.settingModule.view.GraphicQualityViewUI;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GraphicQualityView extends GraphicQualityViewUI
   {
       
      
      private var setMod:SettingModel;
      
      public function GraphicQualityView()
      {
         setMod = SettingModel.ins;
         super();
         gameQuality.text = LocaleMgr.ins.getStr(10900006);
         resoRatioL.text = LocaleMgr.ins.getStr(10900011);
         animeQualityL.text = LocaleMgr.ins.getStr(10900012);
         peopleNumL.text = LocaleMgr.ins.getStr(10900016);
         antiAliasL.text = LocaleMgr.ins.getStr(10900017);
         otherPlayersL.text = LocaleMgr.ins.getStr(10900020);
         deathFlashL.text = LocaleMgr.ins.getStr(10900023);
         sceneSpecEffectL.text = LocaleMgr.ins.getStr(10900024);
         otherSpecEffectL.text = LocaleMgr.ins.getStr(10900025);
         otherTitleL.text = LocaleMgr.ins.getStr(10900026);
         npcDisplayL.text = LocaleMgr.ins.getStr(10900027);
         animeQualityLow.label = LocaleMgr.ins.getStr(10900013);
         animeQualityMid.label = LocaleMgr.ins.getStr(10900014);
         animeQualityHigh.label = LocaleMgr.ins.getStr(10900015);
         antiAliasN.label = LocaleMgr.ins.getStr(10900019);
         antiAliasY.label = LocaleMgr.ins.getStr(10900018);
         otherPlayersN.label = LocaleMgr.ins.getStr(10900022);
         otherPlayersY.label = LocaleMgr.ins.getStr(10900021);
         npcDisplayN.label = LocaleMgr.ins.getStr(10900029);
         npcDisplayY.label = LocaleMgr.ins.getStr(10900021);
         smooth.text = LocaleMgr.ins.getStr(10900007);
         balanced.text = LocaleMgr.ins.getStr(10900008);
         high.text = LocaleMgr.ins.getStr(10900009);
         deathFlashN.label = LocaleMgr.ins.getStr(10900019);
         deathFlashY.label = LocaleMgr.ins.getStr(10900018);
         sceneSpecEffectN.label = LocaleMgr.ins.getStr(10900019);
         sceneSpecEffectY.label = LocaleMgr.ins.getStr(10900018);
         otherSpecEffectN.label = LocaleMgr.ins.getStr(10900019);
         otherSpecEffectY.label = LocaleMgr.ins.getStr(10900018);
         otherTitleN.label = LocaleMgr.ins.getStr(10900019);
         otherTitleY.label = LocaleMgr.ins.getStr(10900018);
         simpleSetting.text = LocaleMgr.ins.getStr(10900005);
         detailSetting.text = LocaleMgr.ins.getStr(10900010);
         refresh();
         presetSetting.addEventListener("change",onChanged);
         resoRatio.selectHandler = onComboSelect;
         animeQuality.addEventListener("change",onChanged);
         peopleNum.addEventListener("change",onChanged);
         antiAlias.addEventListener("change",onChanged);
         otherPlayers.addEventListener("change",onChanged);
         npcDisplay.addEventListener("change",onChanged);
         deathFlash.addEventListener("change",onChanged);
         sceneSpecEffect.addEventListener("change",onChanged);
         otherSpecEffect.addEventListener("change",onChanged);
         otherTitle.addEventListener("change",onChanged);
         npcDisplay.visible = false;
         npcDisplayL.visible = false;
      }
      
      public function resetSetting(param1:Array) : void
      {
         refresh(param1.slice(0,11));
      }
      
      public function refresh(param1:Array = null) : void
      {
         if(!param1)
         {
            param1 = SettingModel.ins.getAllGraphic();
         }
         presetSetting.value = param1[0];
         resoRatio.selectedIndex = param1[1];
         resoRatio.selectedLabel = resoRatio.labels.split(",")[param1[1]] as String;
         animeQuality.selectedIndex = param1[2];
         peopleNum.selectedIndex = param1[3];
         antiAlias.selectedIndex = param1[4];
         otherPlayers.selectedIndex = param1[5];
         deathFlash.selectedIndex = param1[6];
         sceneSpecEffect.selectedIndex = param1[7];
         otherSpecEffect.selectedIndex = param1[8];
         otherTitle.selectedIndex = param1[9];
         npcDisplay.selectedIndex = param1[10];
      }
      
      private function onComboSelect(param1:int) : void
      {
         setMod.resoRatio = resoRatio.selectedIndex;
         switch(int(resoRatio.selectedIndex))
         {
            case 0:
               break;
            case 1:
               stage.stageWidth = (resoRatio.labels.split(",")[1] as String).split("*")[0];
               stage.stageHeight = (resoRatio.labels.split(",")[1] as String).split("*")[1];
               break;
            case 2:
               stage.stageWidth = (resoRatio.labels.split(",")[2] as String).split("*")[0];
               stage.stageHeight = (resoRatio.labels.split(",")[2] as String).split("*")[1];
               break;
            case 3:
               stage.stageWidth = (resoRatio.labels.split(",")[3] as String).split("*")[0];
               stage.stageHeight = (resoRatio.labels.split(",")[3] as String).split("*")[1];
               break;
            case 4:
               stage.stageWidth = (resoRatio.labels.split(",")[4] as String).split("*")[0];
               stage.stageHeight = (resoRatio.labels.split(",")[4] as String).split("*")[1];
         }
      }
      
      public function onChanged(param1:Event) : void
      {
         var _loc2_:* = param1.target;
         if(presetSetting !== _loc2_)
         {
            if(resoRatio !== _loc2_)
            {
               if(animeQuality !== _loc2_)
               {
                  if(peopleNum !== _loc2_)
                  {
                     if(antiAlias !== _loc2_)
                     {
                        if(otherPlayers !== _loc2_)
                        {
                           if(deathFlash !== _loc2_)
                           {
                              if(sceneSpecEffect !== _loc2_)
                              {
                                 if(otherSpecEffect !== _loc2_)
                                 {
                                    if(otherTitle !== _loc2_)
                                    {
                                       if(npcDisplay === _loc2_)
                                       {
                                          setMod.npcDisplay = 0;
                                       }
                                    }
                                    else
                                    {
                                       setMod.otherTitle = otherTitle.selectedIndex;
                                    }
                                 }
                                 else
                                 {
                                    setMod.otherSpecEffect = otherSpecEffect.selectedIndex;
                                 }
                              }
                              else
                              {
                                 setMod.sceneSpecEffect = sceneSpecEffect.selectedIndex;
                              }
                           }
                           else
                           {
                              setMod.deathFlash = deathFlash.selectedIndex;
                           }
                        }
                        else
                        {
                           setMod.otherPlayers = otherPlayers.selectedIndex;
                        }
                     }
                     else
                     {
                        setMod.antiAlias = antiAlias.selectedIndex;
                     }
                  }
                  else
                  {
                     setMod.peopleNum = peopleNum.selectedIndex;
                  }
               }
               else
               {
                  setMod.animeQuality = animeQuality.selectedIndex;
                  switch(int(setMod.animeQuality))
                  {
                     case 0:
                        stage.quality = "low";
                        break;
                     case 1:
                        stage.quality = "medium";
                        break;
                     case 2:
                        stage.quality = "best";
                  }
               }
            }
            else
            {
               setMod.resoRatio = resoRatio.selectedIndex;
               switch(int(resoRatio.selectedIndex))
               {
                  case 0:
                     break;
                  case 1:
                     stage.stageWidth = (resoRatio.labels.split(",")[1] as String).split("*")[0];
                     stage.stageHeight = (resoRatio.labels.split(",")[1] as String).split("*")[1];
                     break;
                  case 2:
                     stage.stageWidth = (resoRatio.labels.split(",")[2] as String).split("*")[0];
                     stage.stageHeight = (resoRatio.labels.split(",")[2] as String).split("*")[1];
                     break;
                  case 3:
                     stage.stageWidth = (resoRatio.labels.split(",")[3] as String).split("*")[0];
                     stage.stageHeight = (resoRatio.labels.split(",")[3] as String).split("*")[1];
                     break;
                  case 4:
                     stage.stageWidth = (resoRatio.labels.split(",")[4] as String).split("*")[0];
                     stage.stageHeight = (resoRatio.labels.split(",")[4] as String).split("*")[1];
               }
            }
         }
         else
         {
            _loc2_ = presetSetting.value;
            if(0 !== _loc2_)
            {
               if(1 !== _loc2_)
               {
                  if(2 === _loc2_)
                  {
                     setMod.graphicQuality = 2;
                     setMod.animeQuality = 2;
                     setMod.peopleNum = 2;
                     setMod.antiAlias = 0;
                     setMod.otherPlayers = 0;
                     setMod.deathFlash = 0;
                     setMod.sceneSpecEffect = 0;
                     setMod.otherSpecEffect = 0;
                     setMod.otherTitle = 0;
                     setMod.npcDisplay = 0;
                     refresh();
                  }
               }
               else
               {
                  setMod.graphicQuality = 1;
                  setMod.animeQuality = 1;
                  setMod.peopleNum = 1;
                  setMod.antiAlias = 0;
                  setMod.otherPlayers = 0;
                  setMod.deathFlash = 0;
                  setMod.sceneSpecEffect = 0;
                  setMod.otherSpecEffect = 0;
                  setMod.otherTitle = 0;
                  setMod.npcDisplay = 0;
                  refresh();
               }
            }
            else
            {
               setMod.graphicQuality = 0;
               setMod.animeQuality = 0;
               setMod.peopleNum = 0;
               setMod.antiAlias = 1;
               setMod.otherPlayers = 1;
               setMod.deathFlash = 1;
               setMod.sceneSpecEffect = 1;
               setMod.otherSpecEffect = 1;
               setMod.otherTitle = 1;
               setMod.npcDisplay = 0;
               refresh();
            }
         }
      }
   }
}
