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
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.miniMaps.MiniMapNpcVisibleVo;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import proto.BgGatherReq;
   import nslm2.modules.battles.battlefields.service.BattlefieldCrystalService;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class BattlefieldResCtrl extends SceneNpcCtrlBase
   {
       
      
      public function BattlefieldResCtrl()
      {
         super();
         switchEventListeners(true);
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId,false);
         if(this.npc)
         {
            npc.addEventListener("unitMouseClick",npc_onMouse);
            npc.addEventListener("unitMouseOver",avatar_mouseOver3D);
            npc.addEventListener("unitMouseOut",avatar_mouseOut3D);
            npc.mousePriority = 2;
            npc.overMethodEnabled = false;
         }
         if(this.npcRelationVo.display_npc % 100 == 2)
         {
            this.npc.useShadow = false;
         }
         initStatus();
      }
      
      protected function avatar_mouseOver3D(param1:Event) : void
      {
         MouseIconManager.ins.addMouseFor3D(this.npc);
         MouseIconManager.changeMouseCursor("hammer");
      }
      
      protected function avatar_mouseOut3D(param1:Event) : void
      {
         MouseIconManager.changeMouseCursor("auto");
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      private function initStatus() : void
      {
         var _loc1_:* = null;
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
               this.npc.visible = true;
               ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgCryMineDryUp",onMineDryUp);
            BattlefieldMsgs.ins.addEventListener("msgCryMineReset",onMineReset);
            BattlefieldMsgs.ins.addEventListener("msg_flag_picked_up",onFlagPickdUp);
            BattlefieldMsgs.ins.addEventListener("msg_flag_reset",onFlagReset);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msg_flag_picked_up",onFlagPickdUp);
            BattlefieldMsgs.ins.removeEventListener("msg_flag_reset",onFlagReset);
            BattlefieldMsgs.ins.removeEventListener("msgCryMineDryUp",onMineDryUp);
            BattlefieldMsgs.ins.removeEventListener("msgCryMineReset",onMineReset);
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
         var _loc1_:BgGatherReq = new BgGatherReq();
         _loc1_.id = this.npcRelationVo.id;
         BattlefieldCrystalService.ins.gather(_loc1_);
      }
      
      private function onMineDryUp(param1:MzEvent) : void
      {
         var _loc2_:int = param1.data as int;
         if(this.npcRelationId == _loc2_)
         {
            this.npc.visible = false;
            AlertUtil.float(LocaleMgr.ins.getStr(50500083,[LocaleMgr.ins.getStr(this.npcRelationVo.name)]));
            ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,false));
         }
      }
      
      private function onMineReset(param1:MzEvent) : void
      {
         var _loc2_:int = param1.data as int;
         if(this.npcRelationId == _loc2_)
         {
            this.npc.visible = true;
            AlertUtil.float(LocaleMgr.ins.getStr(50500082,[LocaleMgr.ins.getStr(this.npcRelationVo.name)]));
            ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
         }
      }
      
      protected function onFlagReset(param1:MzEvent) : void
      {
         var _loc2_:int = param1.data as int;
         if(this.npcRelationId == _loc2_)
         {
            this.npc.visible = true;
            AlertUtil.float(LocaleMgr.ins.getStr(50500147,[LocaleMgr.ins.getStr(this.npcRelationVo.name)]));
            ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
         }
      }
      
      protected function onFlagPickdUp(param1:MzEvent) : void
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
