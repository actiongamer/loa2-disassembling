package nslm2.modules.funnies.xunleiGifts.render
{
   import game.ui.xunleiGiftModule.render.XunleiLvlUpGiftRenderUI;
   import nslm2.modules.funnies.xunleiGifts.services.XunLeiGiftService;
   
   public class XunleiLvlUpGiftRender extends XunleiLvlUpGiftRenderUI
   {
       
      
      public function XunleiLvlUpGiftRender()
      {
         super();
         switchEventListeners(true);
      }
      
      public function get service() : XunLeiGiftService
      {
         return XunLeiGiftService.ins;
      }
      
      public function get lv() : int
      {
         return this.dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1 as int;
         if(lv)
         {
            list_gift.dataSource = service.vipLvStcRewardArr[lv - 1];
            if(this.lv == 0)
            {
               this.box_share.visible = true;
               this.box_level.visible = false;
            }
            else
            {
               this.box_share.visible = false;
               this.box_level.visible = true;
               this.clip_level.value = this.lv;
            }
            img_cur.visible = XunLeiGiftService.ins.info.viplevel == this.lv;
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
