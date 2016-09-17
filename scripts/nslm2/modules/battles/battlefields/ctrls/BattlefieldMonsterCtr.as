package nslm2.modules.battles.battlefields.ctrls
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import flash.events.Event;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.battles.battlefields.model.BattlefieldCrystalModel;
   import proto.BgStageResInfo;
   import nslm2.modules.battles.battlefields.model.BattleFlagModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.miniMaps.MiniMapNpcVisibleVo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import nslm2.modules.battles.battlefields.service.BattlefieldFlagService;
   import proto.BgFightNpcRes;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.AlertUtil;
   
   public class BattlefieldMonsterCtr extends SceneNpcCtrlBase
   {
       
      
      private var monsterNpcGroupId:int;
      
      public function BattlefieldMonsterCtr()
      {
         super();
         switchEventListeners(true);
         needScaleScene = false;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId,true);
         if(this.npc)
         {
            npc.action = "std_2";
            npc.actStd = "std_2";
            npc.box3D2.rotationY = -90;
            npc.addEventListener("unitMouseClick",npc_onMouse);
            npc.addEventListener("unitMouseOver",avatar_mouseOver3D);
            npc.addEventListener("unitMouseOut",avatar_mouseOut3D);
            npc.mousePriority = 2;
            npc.overMethodEnabled = false;
         }
         initStatus();
      }
      
      protected function avatar_mouseOver3D(param1:Event) : void
      {
         MouseIconManager.ins.addMouseFor3D(this.npc);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      protected function avatar_mouseOut3D(param1:Event) : void
      {
         MouseIconManager.changeMouseCursor("auto");
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      private function initStatus() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            _loc1_ = BattlefieldCrystalModel.ins.getStageResInfo(this.npcRelationId);
         }
         else
         {
            _loc1_ = BattleFlagModel.ins.getStageResInfo(this.npcRelationId);
         }
         switch(int(_loc1_.status))
         {
            case 0:
               this.npc.visible = false;
               ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,false));
               break;
            case 1:
               _loc2_ = StcMgr.ins.getNpcGroupVo(_loc1_.npcGroupId);
               monsterNpcGroupId = _loc1_.npcGroupId;
               if(npc.stcNpcId != _loc2_.display_npc)
               {
                  this.npc.initByStcNpcId(_loc2_.display_npc,true);
               }
               ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
               this.npc.visible = true;
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("MSG_MONSTER_DIE",onMonsterDie);
            BattlefieldMsgs.ins.addEventListener("msg_moster_reset",onMonsterReset);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("MSG_MONSTER_DIE",onMonsterDie);
            BattlefieldMsgs.ins.removeEventListener("msg_moster_reset",onMonsterReset);
         }
      }
      
      override protected function npc_onMouse(... rest) : void
      {
         var _loc2_:* = null;
         if(BattlefieldModel.ins.isDied)
         {
            return;
         }
         if(BattlefieldUtil.canClickTarget(this.npc.pos2d))
         {
            runHandler();
         }
         else
         {
            _loc2_ = MathUtil.nextPoint(this.npc.pos2d,MathUtil.roWith2Point(npc.pos2d,scene.playerHero.pos2d),100);
            scene.playerHero.runTo(_loc2_.x,_loc2_.y,runHandler);
         }
      }
      
      override protected function runHandler() : void
      {
         BattleFlagModel.ins.crtKillMonster = monsterNpcGroupId;
         BattlefieldFlagService.ins.killMonster(this.npcRelationVo.id,fightHandler);
      }
      
      private function fightHandler(param1:BgFightNpcRes) : void
      {
         var _loc5_:BgFightNotify = new BgFightNotify();
         var _loc6_:FastBattleData = new FastBattleData();
         _loc5_.attacker = param1.attacker;
         _loc5_.target = param1.target;
         if(param1.isWin)
         {
            _loc5_.winnerId = param1.attacker.playerId;
         }
         else
         {
            _loc5_.winnerId = param1.target.playerId;
         }
         var _loc4_:FastBattlePlayerData = new FastBattlePlayerData();
         var _loc7_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc4_.name = PlayerModel.ins.playerInfo.name;
         _loc4_.level = PlayerModel.ins.level;
         _loc4_.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
         _loc4_.playerId = PlayerModel.ins.playerInfo.id;
         _loc4_.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         _loc4_.miliRank = PlayerModel.ins.playerInfo.militaryrank;
         _loc4_.sideKillNpcNum = BattleFlagModel.ins.getKillMonsterNum(BattlefieldModel.ins.currentBgStagePlayerInfo.side);
         _loc4_.side = 1;
         var _loc3_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(this.npcRelationId);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(_loc3_.display_npc);
         var _loc8_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(BattleFlagModel.ins.crtKillMonster);
         var _loc9_:StcNpcVo = StcMgr.ins.getNpcVo(_loc8_.display_npc);
         _loc7_.npcID = _loc9_.id;
         _loc7_.level = _loc9_.level;
         _loc7_.name = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc2_.name),ColorLib.qualityColor(_loc2_.quality));
         _loc7_.side = 2;
         _loc7_.fightValue = param1.npcAbility;
         _loc6_.fightData = _loc5_;
         _loc6_.leftPlayerData = _loc4_;
         _loc6_.rightPlayerData = _loc7_;
         _loc6_.winCallBack = new Handler(winHandler);
         ModuleMgr.ins.closeModule(50509);
         ModuleMgr.ins.showModule(50509,_loc6_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function winHandler() : void
      {
         BattleFlagModel.ins.addKillMonsterHornor();
      }
      
      protected function onMonsterReset(param1:MzEvent) : void
      {
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         var _loc2_:Array = param1.data as Array;
         var _loc4_:int = _loc2_[0];
         var _loc5_:int = _loc2_[1];
         if(this.npcRelationId == _loc4_)
         {
            this.npc.visible = true;
            _loc6_ = StcMgr.ins.getNpcGroupVo(_loc5_);
            monsterNpcGroupId = _loc5_;
            if(npc.stcNpcId != _loc6_.display_npc)
            {
               this.npc.initByStcNpcId(_loc6_.display_npc,true);
            }
            _loc3_ = npc && !npc.visible;
            AlertUtil.float(LocaleMgr.ins.getStr(50500176,[LocaleMgr.ins.getStr(this.npcRelationVo.name)]));
            ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
         }
      }
      
      protected function onMonsterDie(param1:MzEvent) : void
      {
         var _loc2_:int = param1.data as int;
         if(this.npcRelationId == _loc2_)
         {
            this.npc.visible = false;
            ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,false));
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
