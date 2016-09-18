package nslm2.modules.battles.PeakSports.scene
{
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsSceneTopPanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import proto.BkGameStageInfoNotify;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import proto.BkGameTeamInfo;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import proto.BkStagePlayerInfo;
   import proto.BkGameTeamBuff;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import proto.BkKillRankInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.PeakSports.model.PeakFlagModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class PeakSportsSceneTopPanel extends PeakSportsSceneTopPanelUI
   {
       
      
      private var _textCDCtrlS2:TextCDCtrlS2;
      
      private var _notify:BkGameStageInfoNotify;
      
      private var _temp:int;
      
      public function PeakSportsSceneTopPanel()
      {
         super();
         buffBox1.toolTip = LocaleMgr.ins.getStr(999600037);
         buffBox2.toolTip = LocaleMgr.ins.getStr(999600037);
      }
      
      public function show(param1:BkGameStageInfoNotify) : void
      {
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         _notify = param1;
         updataStep();
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.stop();
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         if(_textCDCtrlS2 == null)
         {
            var _loc10_:* = new TextCDCtrlS2(timeTxt,textCDFormat,textCDCpl);
            this._textCDCtrlS2 = _loc10_;
            this.parts.push(_loc10_);
            _textCDCtrlS2.start(param1.startStamp + PeakSportsTempType.battleTime + int(PeakSportsTempType.BK_WAITING_TIME));
         }
         _loc9_ = 0;
         while(_loc9_ < param1.teamInfos.length)
         {
            _loc6_ = param1.teamInfos[_loc9_] as BkGameTeamInfo;
            if(_loc6_)
            {
               if(_loc6_.side == 1)
               {
                  leftNumTxt.text = _loc6_.resNum + "/" + PeakSportsTempType.resLimit;
                  leftTxt.text = _loc6_.playerNum + "/" + 6;
               }
               else if(_loc6_.side == 2)
               {
                  rightNumTxt.text = _loc6_.resNum + "/" + PeakSportsTempType.resLimit;
                  rightTxt.text = _loc6_.playerNum + "/" + 6;
               }
            }
            _loc9_++;
         }
         var _loc8_:BkStagePlayerInfo = PeakSportsModel.ins.currentBkStagePlayerInfo;
         if(_loc8_.side == 1)
         {
            myNameTxt.x = 73;
            myNameTxt.align = "left";
         }
         else
         {
            myNameTxt.x = 481;
            myNameTxt.align = "right";
         }
         myNameTxt.text = _loc8_.playerInfo.baseInfo.name;
         if(param1.teamBuff1 && param1.teamBuff1.length > 0)
         {
            buffBox1.visible = true;
            _loc9_ = 0;
            while(_loc9_ < param1.teamBuff1.length)
            {
               _loc5_ = param1.teamBuff1[_loc9_] as BkGameTeamBuff;
               if(_loc5_)
               {
                  fogTimeTxt1.text = TimeUtils.hisColonAddZero2(_loc5_.expireStamp - ServerTimer.ins.second);
               }
               _loc9_++;
            }
         }
         else
         {
            buffBox1.visible = false;
         }
         _loc5_ = null;
         if(param1.teamBuff2 && param1.teamBuff2.length > 0)
         {
            buffBox2.visible = true;
            _loc9_ = 0;
            while(_loc9_ < param1.teamBuff2.length)
            {
               _loc5_ = param1.teamBuff2[_loc9_] as BkGameTeamBuff;
               if(_loc5_)
               {
                  fogTimeTxt2.text = TimeUtils.hisColonAddZero2(_loc5_.expireStamp - ServerTimer.ins.second);
               }
               _loc9_++;
            }
         }
         else
         {
            buffBox2.visible = false;
         }
         var _loc3_:BkKillRankInfo = param1.killRank1[0];
         var _loc4_:BkKillRankInfo = param1.killRank2[0];
         if(_loc3_ && _loc4_)
         {
            if(_loc3_.killNum >= _loc4_.killNum)
            {
               if(_loc3_.killNum != _loc4_.killNum)
               {
                  _loc7_ = _loc3_;
               }
            }
            else
            {
               _loc7_ = _loc4_;
            }
         }
         else
         {
            if(_loc3_ == null && _loc4_ == null)
            {
               firstKillPlayerTxt.text = "";
               return;
            }
            if(_loc3_)
            {
               _loc7_ = _loc3_;
               §§push(_loc7_);
            }
            else
            {
               _loc7_ = _loc4_;
               §§push(_loc7_);
            }
            §§pop();
         }
         if(_loc7_ != null)
         {
            _loc2_ = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(_loc7_.playerId)) as BkStagePlayerInfo;
            if(_loc2_)
            {
               firstKillPlayerTxt.text = LocaleMgr.ins.getStr(999600133,["S" + _loc2_.playerInfo.baseInfo.dist % 10000,_loc2_.playerInfo.baseInfo.name,_loc7_.killNum]);
            }
         }
      }
      
      public function updataStep() : void
      {
         var _loc1_:uint = PeakFlagModel.ins.bkGameStageInfoNotify.startStamp + int(PeakSportsTempType.BK_WAITING_TIME) + PeakSportsTempType.battleTime - PeakSportsTempType.dieModelTime;
         if(ServerTimer.ins.second > _loc1_)
         {
            titleTxt.text = LocaleMgr.ins.getStr("999600105");
            titleTxt.style = "渐变红";
         }
         else
         {
            titleTxt.text = LocaleMgr.ins.getStr("999600100");
            titleTxt.style = "渐变橙";
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         var _loc2_:int = param1 - PeakSportsTempType.dieModelTime;
         if(_temp != _loc2_)
         {
            _temp = _loc2_;
            if(_loc2_ - 60 == 0)
            {
               ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",LocaleMgr.ins.getStr(999600031));
            }
            else if(_loc2_ - 30 == 0)
            {
               ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",LocaleMgr.ins.getStr(999600032));
            }
            else if(_loc2_ - 10 == 0)
            {
               ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",LocaleMgr.ins.getStr(999600033));
            }
         }
         param1 = param1 < 0?0:param1;
         return LocaleMgr.ins.getStr(999600107) + TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCDCpl() : void
      {
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.stop();
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         timeTxt.text = LocaleMgr.ins.getStr(999600107) + "00:00";
      }
   }
}
