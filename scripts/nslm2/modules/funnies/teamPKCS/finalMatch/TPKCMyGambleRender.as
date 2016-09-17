package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.championship.comp.GambleRecordListRenderUI;
   import proto.CteamArenaFinalBetInfo;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CteamArenaFinalBetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.CTeamInfo;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import proto.CteamArenaFinalTeamRes;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.TextFieldUtil;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollMediator;
   
   public class TPKCMyGambleRender extends GambleRecordListRenderUI
   {
       
      
      private var _data:CteamArenaFinalBetInfo;
      
      private var _team:CTeamInfo;
      
      public function TPKCMyGambleRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         parts.push(new RollMediator(this,rollHandler));
         img_selected.visible = false;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_get !== _loc2_)
         {
            if(btn_see === _loc2_)
            {
               seeTeamvs();
            }
         }
         else
         {
            getGambleReward();
         }
      }
      
      private function seeTeamvs() : void
      {
         ObserverMgr.ins.sendNotice("OPT_TPKC_SEE_TEAM_FROM_MY_BET",_data);
      }
      
      private function getGambleReward() : void
      {
         var _loc1_:CteamArenaFinalBetRewardReq = new CteamArenaFinalBetRewardReq();
         _loc1_.id = _data.index;
         ServerEngine.ins.send(5415,_loc1_,getRwdCallBack);
      }
      
      private function getRwdCallBack() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41210045));
         _data.reward = true;
         dataSource = _data;
         ObserverMgr.ins.sendNotice("OPT_TPKC_GET_GAMBLE_REWARD_SUCCESS");
      }
      
      private function getTeamInfoByTeamId(param1:UInt64) : void
      {
         var _loc2_:CteamArenaFinalTeamRes = TPKCModel.ins.finalRes;
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_.team;
         for each(var _loc3_ in _loc2_.team)
         {
            if(Uint64Util.equal(_loc3_.id,param1))
            {
               _team = _loc3_;
               break;
            }
         }
      }
      
      private function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc5_:* = null;
         .super.dataSource = param1;
         _data = param1 as CteamArenaFinalBetInfo;
         if(_data)
         {
            getTeamInfoByTeamId(_data.team);
            _loc6_ = TPKConst.indexToPhase(TPKConst.sIdToCId(_data.index));
            _loc4_ = LocaleMgr.ins.getStr(TPKConst.titARr[_loc6_]);
            _loc3_ = String(DefindConsts.CROSS_GROUP_CHIPIN_COST).split(":");
            this.txt_content.text = LocaleMgr.ins.getStr(50800087,[_loc4_,TextFieldUtil.htmlText2(TPKConst.getDistName(_team.op,_team.dist,_team.name),16723968),_loc3_[2]]);
            this.btn_see.label = LocaleMgr.ins.getStr(50400404);
            this.btn_get.label = LocaleMgr.ins.getStr(50400405);
            this.img_title.visible = false;
            this.img_title_txt.visible = false;
            _loc2_ = model.isBetWin(_data);
            if(!_data.reward && _loc2_ == 1)
            {
               this.btn_get.disabled = false;
            }
            else
            {
               if(_data.reward)
               {
                  this.btn_get.label = LocaleMgr.ins.getStr(10600041);
               }
               this.btn_get.disabled = true;
            }
            if(_loc2_ > 0)
            {
               this.img_title.visible = false;
               this.img_title_txt.visible = true;
               if(_loc2_ == 1)
               {
                  img_title_txt.text = LocaleMgr.ins.getStr(999900259);
                  img_title_txt.style = "渐变绿";
               }
               else
               {
                  img_title_txt.text = LocaleMgr.ins.getStr(999900258);
                  img_title_txt.style = "渐变红";
               }
            }
            _loc5_ = String(DefindConsts.CROSS_GROUP_CHIPIN_ODDS).split("|");
            txt_reward.text = LocaleMgr.ins.getStr(50800088,[int(_loc3_[2]) * int(_loc5_[_loc6_]) + int(_loc3_[2])]);
         }
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         img_selected.visible = param1;
      }
   }
}
