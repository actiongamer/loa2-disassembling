package nslm2.modules.battles.PeakSports.control
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.miniMaps.MiniMapNpcVisibleVo;
   
   public class PeakSportsRebornPointControl extends SceneNpcCtrlBase
   {
       
      
      public function PeakSportsRebornPointControl()
      {
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         needScaleScene = false;
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId,false);
         if(this.npc)
         {
            npc.visible = false;
         }
         ObserverMgr.ins.sendNotice("msg_npc_visible",new MiniMapNpcVisibleVo(this.npcRelationId,true));
      }
   }
}
