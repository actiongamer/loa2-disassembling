package nslm2.modules.battles.PeakSports.control
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   
   public class PeakSportsResControl extends SceneNpcCtrlBase
   {
       
      
      public function PeakSportsResControl()
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
            npc.visible = false;
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
