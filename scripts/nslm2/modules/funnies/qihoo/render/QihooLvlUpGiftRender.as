package nslm2.modules.funnies.qihoo.render
{
   import game.ui.qihooModule.render.QihooLvlUpGiftRenderUI;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.qihoo.QihooService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class QihooLvlUpGiftRender extends QihooLvlUpGiftRenderUI
   {
       
      
      public function QihooLvlUpGiftRender()
      {
         super();
         this.btn_get.clickHandler = this.btn_clickHandler;
         switchEventListeners(true);
      }
      
      public function get lv() : int
      {
         return this.dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1 as int;
         list_gift.dataSource = WealthUtil.costStrToArr(DefindConsts.getQIHOO_LVUP(this.lv));
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
         refreshBtn();
      }
      
      private function refreshBtn() : void
      {
         if(QihooService.ins.hadGet(lv))
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10700013);
            this.btn_get.disabled = true;
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10700007);
            this.btn_get.disabled = false;
         }
      }
      
      private function btn_clickHandler() : void
      {
         QihooService.ins.server_privilegeWeiShiCheck(this.lv);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            QihooService.ins.addEventListener("EVT_getReward",onServiceGetReward);
         }
         else
         {
            QihooService.ins.removeEventListener("EVT_getReward",onServiceGetReward);
         }
      }
      
      private function onServiceGetReward(... rest) : void
      {
         this.refreshBtn();
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
