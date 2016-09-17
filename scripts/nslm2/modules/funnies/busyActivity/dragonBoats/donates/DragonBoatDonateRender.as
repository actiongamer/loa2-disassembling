package nslm2.modules.funnies.busyActivity.dragonBoats.donates
{
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRenderUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.DragonBoatDonatePanelRes.DonateInfo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import morn.customs.expands.MornExpandUtil;
   
   public class DragonBoatDonateRender extends DragonBoatDonateRenderUI
   {
       
      
      public function DragonBoatDonateRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_request === _loc3_)
         {
            ModuleMgr.ins.showModule(13384,this.vo,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      public function get vo() : DonateInfo
      {
         return this.dataSource as DonateInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.render_item.wealthVo = WealthUtil.createStcItemVo(vo.itemId,1);
            this.txt_player_name.text = LinkUtils.playerNameByPlayerBaseInfo(vo.id);
            this.txt_count.text = vo.donatedNum + "/" + DragonBoatService.ins.stcModel.priceMode.donatedLimit;
         }
      }
   }
}
