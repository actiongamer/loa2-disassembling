package nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob
{
   import game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangRenderUI;
   
   public class PvPSaodangRender extends PvPSaoDangRenderUI
   {
       
      
      private var _mainRender:nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob.PvPSaodangMainRender;
      
      public function PvPSaodangRender()
      {
         _mainRender = new nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob.PvPSaodangMainRender();
         super();
         this.addChild(_mainRender);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _mainRender.dataSource = param1;
         .super.dataSource = param1;
      }
   }
}
