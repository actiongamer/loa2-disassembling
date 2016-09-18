package nslm2.modules.scenes.ctrls
{
   import flash.geom.Point;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class SceneDefaultFuncCtrl extends SceneNpcCtrlBase
   {
       
      
      public var func_pos2d:Point;
      
      public function SceneDefaultFuncCtrl()
      {
         super();
         this.autoRo = true;
         this.needScaleScene = false;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId);
         if(this.npc)
         {
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
         ModuleMgr.ins.showOrCloseModule(this.npcRelationVo.mount_func);
      }
   }
}
