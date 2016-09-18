package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.MiniMapLineRenderUI;
   import proto.ShowLineStateRes.LineState;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class MiniMapLineRender extends MiniMapLineRenderUI
   {
       
      
      public function MiniMapLineRender()
      {
         super();
      }
      
      public function get lineState() : LineState
      {
         return this.dataSource as LineState;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.lineState)
         {
            this.img_icon.index = this.lineState.state;
            this.txt_line.text = LocaleMgr.ins.getStr(999000314,[this.lineState.id]);
         }
      }
   }
}
