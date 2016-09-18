package nslm2.modules.bag
{
   import game.ui.lotteryHeroModules.getRewards.LotteryHeroGetRewardModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardRender;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   
   public class UseHeroSelectBoxView extends LotteryHeroGetRewardModuleUI
   {
       
      
      private var _vo:nslm2.modules.bag.UseHeroSelectBoxViewVo;
      
      private var heroIndex:int = -1;
      
      private var _multiUseAlert:Label;
      
      public function UseHeroSelectBoxView()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         this.list_kind.visible = false;
         this.render_cost.visible = false;
         _vo = param1 as nslm2.modules.bag.UseHeroSelectBoxViewVo;
         if(_vo.count > 1)
         {
            _multiUseAlert = new Label();
            _multiUseAlert.style = "普通说明";
            _multiUseAlert.x = 31;
            _multiUseAlert.y = 41;
            _multiUseAlert.text = LocaleMgr.ins.getStr(41500950,[_vo.count,TextFieldUtil.htmlText2(_vo.wealthVo.showName,ColorLib.qualityColor(_vo.wealthVo.quality))]) + "\n" + LocaleMgr.ins.getStr(41500951);
            this.addChild(_multiUseAlert);
         }
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(_vo.wealthVo.stcItemVo.name);
         var _loc3_:Array = [];
         var _loc4_:int = _vo.wealthVo.stcItemVo.extend_1.split("|").length;
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            _loc6_ = _vo.wealthVo.stcItemVo.extend_1.split("|")[_loc8_];
            _loc2_ = _vo.wealthVo.stcItemVo.extend_2.split("|")[_loc8_];
            if(int(_vo.wealthVo.stcItemVo.extend_3) == 30)
            {
               _loc3_.push(WealthUtil.createNpcVo(_loc6_));
            }
            else if(int(_vo.wealthVo.stcItemVo.extend_3) == 20)
            {
               _loc3_.push(WealthUtil.createItemVo(_loc6_,_loc2_));
            }
            _loc8_++;
         }
         this.list_reward.selectedIndex = heroIndex;
         this.list_reward.repeatX = _loc4_;
         this.list_reward.dataSource = _loc3_;
         this.list_reward.commitMeasure();
         this.list_spliteLine.spaceX = 120;
         this.list_spliteLine.repeatX = this.list_reward.length - 1;
         this.list_spliteLine.centerX = 0;
         this.pageBar.visible = false;
         if(_loc4_ == 3)
         {
            _loc5_ = this.img_bg.width - this.list_reward.width - 30;
            this.panelBg.width = this.panelBg.width - _loc5_;
            this.img_bgInner1.width = this.img_bgInner1.width - _loc5_;
            this.img_bg.width = this.list_reward.width + 30;
            this.list_reward.centerX = this.list_reward.centerX - _loc5_ / 2;
            this.list_spliteLine.centerX = this.list_spliteLine.centerX - _loc5_ / 2;
            this.btn_return.centerX = this.btn_return.centerX - _loc5_ / 2;
            this.btn_getReward.x = this.btn_getReward.x - _loc5_ / 2;
            this.x = this.x + _loc5_ / 2;
         }
         else if(_loc4_ > 4)
         {
            this.list_reward.repeatX = 4;
            this.list_spliteLine.repeatX = 3;
            this.pageBar.bindList(this.list_reward);
            this.pageBar.visible = true;
         }
         this.list_reward.changeHandler = list_reward_change;
         this.btn_return.visible = true;
         this.btn_getReward.visible = true;
         this.btn_getReward.labelMargin = "0";
         this.btn_getReward.clickHandler = get_reward;
         this.btn_return.clickHandler = close_module;
         this.txt_prompt.text = "";
         var _loc10_:int = 0;
         var _loc9_:* = list_reward.cells;
         for each(var _loc7_ in list_reward.cells)
         {
            _loc7_.txt_group.visible = true;
            _loc7_.img_group.visible = true;
         }
         super.preShow(param1);
      }
      
      private function close_module() : void
      {
         ModuleMgr.ins.closeModule(11921);
      }
      
      private function get_reward() : void
      {
         if(heroIndex == -1)
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(11900040));
         }
         else
         {
            new UseItemTask(_vo.wealthVo.item.id,_vo.wealthVo.item.itemId,_vo.count,true,heroIndex).addHandlers(_vo.cplHandler,this.errHandler,null,_vo.startHandler).exec();
         }
      }
      
      private function errHandler(param1:UseItemTask) : void
      {
         if(param1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10000020,[_vo.wealthVo.stcItemVo.need_level]));
         }
      }
      
      private function list_reward_change(param1:int) : void
      {
         heroIndex = param1;
      }
   }
}
