package nslm2.modules.funnies.teams.details
{
   import game.ui.teams.details.TeamApplySettingUI;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import com.netease.protobuf.UInt64;
   import proto.TeamSettingReq;
   import proto.TeamSetting;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.nets.sockets.ServerEngine;
   
   public class TeamApplySetting extends TeamApplySettingUI
   {
       
      
      public function TeamApplySetting(param1:TeamSetting)
      {
         super();
         this.rg.initItems();
         this.txt_tip1.text = LocaleMgr.ins.getStr(41210080) + "        " + LocaleMgr.ins.getStr(41210081);
         if(App.language == "en")
         {
            this.txt_tip2.text = LocaleMgr.ins.getStr(41210082) + "        " + LocaleMgr.ins.getStr(41210083);
            level.x = 265;
            fight.x = 265;
         }
         else
         {
            this.txt_tip2.text = LocaleMgr.ins.getStr(41210082) + "                \t    " + LocaleMgr.ins.getStr(41210083);
            level.x = 148;
            fight.x = 210;
         }
         this.txt_tip3.text = LocaleMgr.ins.getStr(41210084);
         this.txt_tip4.text = LocaleMgr.ins.getStr(41210085);
         this.level.restrict = "0-9";
         this.fight.restrict = "0-9";
         this.level.maxChars = 2;
         this.fight.maxChars = 9;
         if(param1.autoagreeall)
         {
            this.rg.selectedIndex = 2;
         }
         else if(Uint64Util.compareValue(param1.autoagreeability,Uint64Util.fromNumber(0)) > 0)
         {
            this.rg.selectedIndex = 1;
            this.fight.text = param1.autoagreeability.toString();
         }
         else if(param1.autoagreelevel > 0)
         {
            this.rg.selectedIndex = 0;
            this.level.text = param1.autoagreelevel.toString();
         }
         else
         {
            this.rg.selectedIndex = 3;
         }
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.panelBg.titleImgId = 10626;
         this.alert.contentYesHandler = yesHandler;
      }
      
      private function yesHandler() : void
      {
         var _loc1_:Number = NaN;
         switch(int(this.rg.selectedIndex))
         {
            case 0:
               if(this.level.text == "")
               {
                  ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000468)));
               }
               else
               {
                  server_TeamSetting(false,int(this.level.text),null);
               }
               break;
            case 1:
               _loc1_ = this.fight.text;
               if(_loc1_ == 0)
               {
                  ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000469)));
               }
               else
               {
                  server_TeamSetting(false,0,Uint64Util.fromNumber(_loc1_));
               }
               break;
            case 2:
               server_TeamSetting(true,0,null);
               break;
            case 3:
               server_TeamSetting(false,0,null);
         }
      }
      
      public function server_TeamSetting(param1:Boolean, param2:uint, param3:UInt64) : void
      {
         var _loc5_:TeamSettingReq = new TeamSettingReq();
         var _loc4_:TeamSetting = new TeamSetting();
         _loc5_.setting = _loc4_;
         _loc5_.setting.autoagreeall = param1;
         _loc5_.setting.autoagreeability = param3;
         _loc5_.setting.autoagreelevel = param2;
         _loc5_.kind = TeamGuajiService.ins.teamType;
         ServerEngine.ins.send(2032,_loc5_);
         ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41210086)));
         this.alert.onYes();
      }
   }
}
