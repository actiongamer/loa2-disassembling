package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel2RenderUI;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import proto.SpringWelfareInfoRes.GetRewadInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpringFirecrackerRewardVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class NewYear2016_GodSubPanel2Render extends NewYear2016_GodSubPanel2RenderUI
   {
       
      
      public function NewYear2016_GodSubPanel2Render()
      {
         super();
         this.btn_get.label = LocaleMgr.ins.getStr(999000240);
         this.btn_get.clickHandler = btn_handler;
         switchEventListeners(true);
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.service.addEventListener("EVT_WELFARE_GET_REWARD",onGetReward);
         }
         else
         {
            this.service.removeEventListener("EVT_WELFARE_GET_REWARD",onGetReward);
         }
      }
      
      public function get vo() : GetRewadInfo
      {
         return this.dataSource as GetRewadInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.refreshUI();
      }
      
      private function refreshUI() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(vo)
         {
            _loc1_ = StcMgr.ins.getSpringFirecrackerRewardVo(this.vo.id);
            _loc2_ = _loc1_.num;
            this.render_wealth.wealthVo = WealthUtil.costStrToArr(_loc1_.reward)[0];
            this.txt1.text = this.render_wealth.wealthVo.showName + " x" + this.render_wealth.wealthVo.count;
            this.txt2.text = LocaleMgr.ins.getStr(13310014,[_loc2_]);
            if(vo.get == false)
            {
               this.btn_get.visible = true;
               this.img_get.visible = false;
               if(this.service.welfareInfoRes.total < _loc2_)
               {
                  this.btn_get.disabled = true;
               }
               else
               {
                  this.btn_get.disabled = false;
               }
            }
            else
            {
               this.btn_get.visible = false;
               this.img_get.visible = true;
            }
         }
      }
      
      private function btn_handler() : void
      {
         this.service.server_springGetWelfareReward(this.vo.id);
      }
      
      private function onGetReward(... rest) : void
      {
         if(this.vo)
         {
            if(this.vo.id == this.service.welfare_id)
            {
               this.dataSource = this.service.welfareInfoRes.getRew[this.listCellVo.dataIndex];
            }
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
