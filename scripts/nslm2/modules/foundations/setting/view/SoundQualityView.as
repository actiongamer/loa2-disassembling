package nslm2.modules.foundations.setting.view
{
   import game.ui.settingModule.view.SoundQualityViewUI;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class SoundQualityView extends SoundQualityViewUI
   {
       
      
      private var soundSetting:Array;
      
      public function SoundQualityView()
      {
         soundSetting = SettingModel.ins.getAllSound().slice();
         super();
         soundQualityL.text = LocaleMgr.ins.getStr(10900036);
         mainVolumeL.text = LocaleMgr.ins.getStr(10900037);
         backVolumeL.text = LocaleMgr.ins.getStr(10900038);
         battleVolumeL.text = LocaleMgr.ins.getStr(10900039);
         systemVolumeL.text = LocaleMgr.ins.getStr(10900040);
         uiVolumeL.text = LocaleMgr.ins.getStr(10900041);
         dialogVolumeL.text = LocaleMgr.ins.getStr(10900042);
         soundQualityLow.label = LocaleMgr.ins.getStr(10900013);
         soundQualityMid.label = LocaleMgr.ins.getStr(10900014);
         soundQualityHigh.label = LocaleMgr.ins.getStr(10900015);
         simpleSetting.text = LocaleMgr.ins.getStr(10900005);
         detailSetting.text = LocaleMgr.ins.getStr(10900010);
         refresh();
         soundQuality.addEventListener("change",onChanged);
         mainVolume.addEventListener("change",onChanged);
         backVolume.addEventListener("change",onChanged);
         battleVolume.addEventListener("change",onChanged);
         systemVolume.addEventListener("change",onChanged);
         uiVolume.addEventListener("change",onChanged);
         dialogVolume.addEventListener("change",onChanged);
      }
      
      public function resetSetting(param1:Array) : void
      {
         refresh(param1.slice(11,18));
      }
      
      public function refresh(param1:Array = null) : void
      {
         if(!param1)
         {
            param1 = SettingModel.ins.getAllSound();
         }
         soundQuality.selectedIndex = param1[0];
         mainVolume.value = param1[1];
         mainVolValue.text = param1[1];
         backVolume.value = param1[2];
         backVolValue.text = param1[2];
         battleVolume.value = param1[3];
         battleVolValue.text = param1[3];
         systemVolume.value = param1[4];
         systemVolValue.text = param1[4];
         uiVolume.value = param1[5];
         uiVolValue.text = param1[5];
         dialogVolume.value = param1[6];
         dialogVolValue.text = param1[6];
      }
      
      private function onChanged(param1:Event) : void
      {
         var _loc2_:* = param1.target;
         if(soundQuality !== _loc2_)
         {
            if(mainVolume !== _loc2_)
            {
               if(backVolume !== _loc2_)
               {
                  if(battleVolume !== _loc2_)
                  {
                     if(systemVolume !== _loc2_)
                     {
                        if(uiVolume !== _loc2_)
                        {
                           if(dialogVolume === _loc2_)
                           {
                              SettingModel.ins.dialogVolume = dialogVolume.value;
                              dialogVolValue.text = dialogVolume.value.toString();
                           }
                        }
                        else
                        {
                           SettingModel.ins.uiVolume = uiVolume.value;
                           uiVolValue.text = uiVolume.value.toString();
                        }
                     }
                     else
                     {
                        SettingModel.ins.systemVolume = systemVolume.value;
                        systemVolValue.text = systemVolume.value.toString();
                     }
                  }
                  else
                  {
                     SettingModel.ins.battleVolume = battleVolume.value;
                     battleVolValue.text = battleVolume.value.toString();
                  }
               }
               else
               {
                  SettingModel.ins.backVolume = backVolume.value;
                  backVolValue.text = backVolume.value.toString();
               }
            }
            else
            {
               SettingModel.ins.mainVolume = mainVolume.value;
               mainVolValue.text = mainVolume.value.toString();
            }
         }
         else
         {
            SettingModel.ins.soundQuality = soundQuality.selectedIndex;
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
      }
   }
}
