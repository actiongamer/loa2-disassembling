package nslm2.modules.foundations.vip.render
{
   import game.ui.vipModule.render.VipGiftRenderUI;
   import nslm2.common.vo.WealthVo;
   
   public class VipGiftRender extends VipGiftRenderUI
   {
       
      
      private var _data:WealthVo;
      
      public function VipGiftRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as WealthVo;
         this.mouseEnabled = true;
         this.mouseChildren = true;
      }
   }
}
