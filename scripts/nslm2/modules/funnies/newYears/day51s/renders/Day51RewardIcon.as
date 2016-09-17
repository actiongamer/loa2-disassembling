package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51RewardIconUI;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import nslm2.modules.funnies.newYears.day51s.services.Day51DigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.StaticMineSweepRewardItemModel;
   import nslm2.utils.WealthUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   
   public class Day51RewardIcon extends Day51RewardIconUI
   {
      
      public static const NO_SHOW_KEY0:String = "Day51RewardIcon.dig.alert0";
      
      public static const NO_SHOW_KEY:String = "Day51RewardIcon.dig.alert1";
       
      
      public function Day51RewardIcon()
      {
         super();
         this.wealthRender.showMultipleSign = true;
         this.addEventListener("click",onClick);
         this.img_lock.toolTip = LocaleMgr.ins.getStr(133550011,[this.service.priceCostWealthVo.showCount]);
         this.img_mustHaveNo.toolTip = LocaleMgr.ins.getStr(133550017);
      }
      
      public function get service() : Day51Service
      {
         return Day51Service.ins;
      }
      
      public function get vo() : Day51DigVo
      {
         return this.dataSource as Day51DigVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(vo && vo.info)
         {
            this.img_lock.visible = false;
            if(vo.info.isNumber)
            {
               this.wealthRender.dataSource = null;
               this.img_num.visible = true;
               this.img_num.value = vo.info.id;
               this.img_num.toolTip = LocaleMgr.ins.getStr(133550009,[vo.info.id]);
            }
            else
            {
               this.img_num.visible = false;
               _loc2_ = service.getRewardById(vo.info.id);
               this.wealthRender.dataSource = WealthUtil.parseCostStr(_loc2_.item);
            }
            this.buttonMode = false;
            img_mustHaveNo.visible = false;
         }
         else if(vo.mustHaveNot)
         {
            img_mustHaveNo.visible = true;
         }
         else
         {
            img_mustHaveNo.visible = false;
            this.buttonMode = true;
            this.wealthRender.dataSource = null;
            this.img_lock.visible = true;
            if(this.service.priceCostWealthVo.kind == 3)
            {
               this.img_lock.toolTip = LocaleMgr.ins.getStr(133550011,[this.service.priceCostWealthVo.showCount]);
            }
            else
            {
               this.img_lock.toolTip = LocaleMgr.ins.getStr(133550021,[this.service.priceCostWealthVo.showCount]);
            }
            this.img_num.visible = false;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(vo && vo.info == null)
         {
            if(vo.mustHaveNot)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(133550018),this.doDig0,null,"Day51RewardIcon.dig.alert0");
            }
            else
            {
               this.doDig0();
            }
         }
      }
      
      private function doDig0() : void
      {
         if(BagModel.ins.getStcCount(83230) > 0)
         {
            doDig();
         }
         else if(this.service.priceCostWealthVo.kind == 3)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(133550013,[this.service.priceCostWealthVo.showCount]),this.doDig,null,"Day51RewardIcon.dig.alert1");
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(133550023,[this.service.priceCostWealthVo.showCount]),this.doDig,null,"Day51RewardIcon.dig.alert1");
         }
      }
      
      private function doDig() : void
      {
         this.service.server_mineSweepDig(this.vo.x,this.vo.y);
      }
   }
}
