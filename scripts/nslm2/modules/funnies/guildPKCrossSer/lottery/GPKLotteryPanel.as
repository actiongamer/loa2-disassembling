package nslm2.modules.funnies.guildPKCrossSer.lottery
{
   import game.ui.guildPKCrossSer.GPKLotteryPanelUI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class GPKLotteryPanel extends GPKLotteryPanelUI
   {
       
      
      private var logStr:String = "";
      
      public function GPKLotteryPanel()
      {
         super();
         this.img_bg.skin = UrlLib.gpkcUrl("img_lottery_bg.png");
         this.img_title.skin = UrlLib.gpkcUrl("img_lottery_title.png");
         this.btn_close.clickHandler = closeHandler;
         this.panel_item.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         var _loc1_:int = 0;
         this.box_item.y = _loc1_;
         this.box_item.x = _loc1_;
         this.panel_item.addChild(this.box_item);
         test();
      }
      
      private function test() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 100)
         {
            logStr = logStr + "asdfbaaaaaaaaaa\n";
            _loc1_++;
         }
         this.txt_log.text = logStr;
      }
      
      private function closeHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
