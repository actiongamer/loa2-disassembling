package nslm2.modules.funnies.teamPKCS
{
   import game.ui.teamPKCS.TeamPKCModuleUI;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CteamArenaStateRes;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import morn.core.components.View;
   import nslm2.modules.funnies.teamPKCS.invite.TPKCInviteScene;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.funnies.teamPKCS.preMatch.TPKCpreScene;
   import proto.CteamArenaFinalTeamRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalScene;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   
   public class TeamPKCModule extends TeamPKCModuleUI
   {
       
      
      private var _scene3D;
      
      private var currView:View;
      
      public function TeamPKCModule()
      {
         super();
         TeamGuajiService.ins.initTeamType(17);
         this.box_rule.visible = false;
         this.box_time.visible = false;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["OPT_TPKC_OPEN_RANK_REWARD","OPT_TPKC_ENTER_LAST_FINAL_VIEW","OPT_TPKC_BACK_TO_INVITEMODE"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_TPKC_OPEN_RANK_REWARD" !== _loc3_)
         {
            if("OPT_TPKC_ENTER_LAST_FINAL_VIEW" !== _loc3_)
            {
               if("OPT_TPKC_BACK_TO_INVITEMODE" === _loc3_)
               {
                  inviteMode();
               }
            }
            else
            {
               finalMode(true);
            }
         }
         else
         {
            treasureBox_onClick(null);
         }
      }
      
      private function treasureBox_onClick(param1:MouseEvent) : void
      {
         var _loc2_:ActRewardVo = new ActRewardVo();
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",16);
         _loc3_.sortOn("id",16);
         _loc2_.list_items = _loc3_;
         _loc2_.hideTxtRank = true;
         ModuleMgr.ins.showModule(42009,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(model.isActDay)
         {
            ServerEngine.ins.send(5408,null,onStateRet);
            model.outActDay = false;
         }
         else
         {
            model.outActDay = true;
            moduleServerCpl();
         }
      }
      
      private function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      private function onStateRet(param1:CteamArenaStateRes, param2:*) : void
      {
         model.stateRes = param1;
         moduleServerCpl();
      }
      
      private function onErr() : void
      {
      }
      
      override public function preShow(param1:Object = null) : void
      {
         SoundMgr.ins.playBackSound("map_kfzb");
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10400);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
         if(model.outActDay)
         {
            model.inviteState = 0;
            inviteMode();
         }
         else
         {
            model.inviteState = 0;
            if(model.stateRes.state == 2)
            {
               if(model.isInviteDay)
               {
                  model.inviteState = 1;
                  inviteMode();
               }
               else if(model.isPreDay)
               {
                  preMode();
               }
               else if(model.isFinalDay || model.isHalfDay)
               {
                  finalMode();
               }
               else
               {
                  model.inviteState = 0;
                  inviteMode();
               }
            }
            else if(model.isInviteDay)
            {
               model.inviteState = 2;
               inviteMode();
            }
            else if(model.isPreDay)
            {
               model.inviteState = 3;
               inviteMode();
            }
            else if(model.isFinalDay || model.isHalfDay)
            {
               finalMode();
            }
            else
            {
               inviteMode();
            }
         }
         super.preShow(param1);
      }
      
      private function inviteMode() : void
      {
         if(currView)
         {
            currView.dispose();
         }
         currView = new TPKCInviteScene();
         addChild(currView);
         var _loc1_:Array = [42014,42008,42009,42010,42013,42006].reverse();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc1_,[],true,false));
      }
      
      private function preMode() : void
      {
         if(currView)
         {
            currView.dispose();
         }
         currView = new TPKCpreScene();
         addChild(currView);
      }
      
      private function finalMode(param1:Boolean = false) : void
      {
         lookMode = param1;
         onTeamInfoRet = function(param1:CteamArenaFinalTeamRes):void
         {
            model.finalRes = param1;
            if(param1 && param1.team.length > 0)
            {
               enterFinal();
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(50800111));
            }
         };
         enterFinal = function():void
         {
            if(currView)
            {
               currView.dispose();
            }
            currView = new TPKCFinalScene(lookMode);
            addChild(currView);
            var _loc1_:Array = [42014,42008,42009,42006,42010].reverse();
            ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(_loc1_,[],true,false));
         };
         ServerEngine.ins.send(5413,null,onTeamInfoRet);
      }
      
      override public function dispose() : void
      {
         if(currView)
         {
            currView.dispose();
         }
         super.dispose();
      }
   }
}
