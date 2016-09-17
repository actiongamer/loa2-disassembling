package nslm2.modules.funnies.playerTitles.render
{
   import game.ui.playerTitle.render.PlayerTitleListRenderUI;
   import nslm2.modules.funnies.playerTitles.vo.PlayerTitleListVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PlayerTitleListRender extends PlayerTitleListRenderUI
   {
       
      
      public function PlayerTitleListRender()
      {
         super();
      }
      
      public function get vo() : PlayerTitleListVo
      {
         return this.dataSource as PlayerTitleListVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.vo)
         {
            label_listTitle.text = LocaleMgr.ins.getStr(30400100 + vo.kind);
         }
      }
   }
}
