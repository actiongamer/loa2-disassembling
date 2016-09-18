package nslm2.modules.scenes.ctrls
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class SceneChapterCtrl extends SceneNpcCtrlBase
   {
       
      
      public function SceneChapterCtrl()
      {
         super();
         this.autoRo = false;
         this.needScaleScene = false;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         var _loc2_:* = null;
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId);
         if(this.npc)
         {
            _loc2_ = StcMgr.ins.getStageNpcRelationVo(npcRelationId);
            npc.addEventListener("unitMouseTrigger",npc_onMouse);
         }
      }
      
      override protected function runHandler() : void
      {
         super.runHandler();
         this.enter();
      }
      
      private function enter() : void
      {
         ModuleMgr.ins.popLayer.closeAll();
         ModuleMgr.ins.showOrCloseModule(40400);
      }
   }
}
