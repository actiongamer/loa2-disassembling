package nslm2.modules.scenes.ctrls
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   
   public class TreasurePieceRobNpcCtrl extends SceneDefaultFuncCtrl
   {
       
      
      public function TreasurePieceRobNpcCtrl()
      {
         super();
         autoRo = false;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc.useShadow = false;
      }
   }
}
