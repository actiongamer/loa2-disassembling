package nslm2.modules.scenes.ctrls
{
   import flash.geom.Point;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   
   public class SceneNpcDeCtrl extends SceneNpcCtrlBase
   {
       
      
      public var func_pos2d:Point;
      
      public function SceneNpcDeCtrl()
      {
         super();
         this.autoRo = true;
         this.needScaleScene = false;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId);
         this.npc.useShadow = false;
         this.npc.buttonMode = false;
         this.npc.overMethodEnabled = false;
      }
   }
}
