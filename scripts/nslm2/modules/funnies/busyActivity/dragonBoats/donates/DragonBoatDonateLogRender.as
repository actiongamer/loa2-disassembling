package nslm2.modules.funnies.busyActivity.dragonBoats.donates
{
   import game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateLogRenderUI;
   import proto.DragonBoatDonatePanelRes.DonateLog;
   import proto.PlayerBaseInfo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class DragonBoatDonateLogRender extends DragonBoatDonateLogRenderUI
   {
       
      
      public function DragonBoatDonateLogRender()
      {
         super();
      }
      
      public function get vo() : DonateLog
      {
         return this.dataSource as DonateLog;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(vo)
         {
            _loc2_ = vo.donateId;
            if(_loc2_ == null)
            {
               _loc2_ = PlayerModel.ins.playerBaseInfo;
            }
            this.txt_content.text = LocaleMgr.ins.getStr(0,[_loc2_,vo.donatedId,vo.itemId,vo.count,vo.score]);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
