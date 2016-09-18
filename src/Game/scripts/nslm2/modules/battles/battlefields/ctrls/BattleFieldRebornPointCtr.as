package nslm2.modules.battles.battlefields.ctrls
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.miniMaps.MiniMapNpcVisibleVo;
   
   public class BattleFieldRebornPointCtr extends SceneNpcCtrlBase
   {
       
      
      public function BattleFieldRebornPointCtr()
      {
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         var _loc2_:* = null;
         super.init(param1);
         needScaleScene = false;
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId,false);
         if(this.npc)
         {
            _loc2_ = StcMgr.ins.getStageNpcRelationVo(npcRelationId);
            npc.addEventListener("unitMouseTrigger",npc_onMouse);
         }
         ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
      }
   }
}
