package nslm2.modules.funnies.playerTitles.render
{
   import game.ui.playerTitle.render.PlayerTitlesRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcTitleVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PlayerTitlesRender extends PlayerTitlesRenderUI
   {
       
      
      public function PlayerTitlesRender()
      {
         super();
      }
      
      public function get vo() : StcTitleVo
      {
         return this.dataSource as StcTitleVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.vo)
         {
            label_title.text = LocaleMgr.ins.getStr(vo.titlename);
         }
      }
   }
}
