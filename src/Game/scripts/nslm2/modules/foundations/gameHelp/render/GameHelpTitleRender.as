package nslm2.modules.foundations.gameHelp.render
{
   import game.ui.gameHelpModule.render.GameHelpTitleRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GameHelpTitleRender extends GameHelpTitleRenderUI
   {
       
      
      public function GameHelpTitleRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:int = param1 as int;
         this.label.text = LocaleMgr.ins.getStr(_loc2_);
         this.labelhl.text = LocaleMgr.ins.getStr(_loc2_);
      }
   }
}
