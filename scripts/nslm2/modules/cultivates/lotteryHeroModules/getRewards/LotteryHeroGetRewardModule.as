package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.LotteryHeroGetRewardModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   import proto.HeroInfo;
   import nslm2.common.model.HeroModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.LotteryGetRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.LotteryGetRewardRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.cultivates.lotteryHeroModules.LHModel;
   
   public class LotteryHeroGetRewardModule extends LotteryHeroGetRewardModuleUI
   {
       
      
      private var txt_promptCenterY:int;
      
      private var getRewardVo:nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardVo;
      
      public function LotteryHeroGetRewardModule()
      {
         super();
         txt_promptCenterY = txt_prompt.y + txt_prompt.height / 2;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         getRewardVo = param1 as nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardVo;
         btn_getReward.commitMeasure();
         DisplayUtils.addChildFromGlobal(this.btn_getReward,this.render_cost);
         this.list_kind.changeHandler = list_kind_change;
         this.list_kind.array = [new nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardVo(1,false),new nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardVo(2,false),new nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardVo(3,false)];
         if(getRewardVo.canGet)
         {
            this.render_cost.wealthVo = WealthUtil.createWealthVo(21,0,int(DefindConsts.LOTTERY_POINT_FULL));
         }
         else
         {
            btn_return.centerX = 0;
         }
         this.list_reward.changeHandler = list_reward_change;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.pageBar.bindList(list_reward);
         this.toState1();
         super.preShow(param1);
      }
      
      private function list_kind_change(param1:int) : void
      {
         var _loc7_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = (this.list_kind.getItem(param1) as nslm2.modules.cultivates.lotteryHeroModules.getRewards.GetRewardVo).groupId;
         switch(int(_loc4_) - 1)
         {
            case 0:
               _loc7_ = DefindConsts.LOTTERY_BOX_GROUP_A;
               break;
            case 1:
               _loc7_ = DefindConsts.LOTTERY_BOX_GROUP_B;
               break;
            case 2:
               _loc7_ = DefindConsts.LOTTERY_BOX_GROUP_C;
         }
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(_loc7_);
         var _loc9_:Array = _loc5_.lotteryGetRewardHeroIdArr;
         var _loc3_:Array = [];
         var _loc6_:int = _loc9_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc6_)
         {
            _loc8_ = _loc9_[_loc10_];
            _loc3_.push(WealthUtil.createNpcVo(_loc8_));
            _loc10_++;
         }
         this.list_reward.selectedIndex = -1;
         this.list_reward.array = _loc3_;
         this.list_reward.commitMeasure();
         _loc6_ = list_reward.cells.length;
         _loc10_ = 0;
         while(_loc10_ < _loc6_)
         {
            _loc2_ = list_reward.cells[_loc10_] as GetRewardRender;
            _loc2_.canGet = getRewardVo.canGet;
            _loc10_++;
         }
         this.toState2();
      }
      
      private function toState1() : void
      {
         this.txt_prompt.text = LocaleMgr.ins.getStr(11900031);
         txt_prompt.commitMeasure();
         txt_prompt.y = txt_promptCenterY - txt_prompt.height / 2;
         this.list_spliteLine.spaceX = 160;
         this.list_spliteLine.repeatX = 2;
         this.list_spliteLine.centerX = 0;
         this.list_spliteLine.visible = true;
         this.list_kind.visible = true;
         this.list_reward.visible = false;
         this.btn_return.visible = false;
         this.btn_getReward.visible = false;
         this.pageBar.visible = false;
      }
      
      private function toState2() : void
      {
         this.pageBar.pageTo(0,false);
         if(getRewardVo.canGet)
         {
            this.txt_prompt.text = LocaleMgr.ins.getStr(11900038);
         }
         else
         {
            this.txt_prompt.text = LocaleMgr.ins.getStr(11900039);
         }
         txt_prompt.commitMeasure();
         txt_prompt.y = txt_promptCenterY - txt_prompt.height / 2;
         if(this.list_reward.length > 1)
         {
            this.list_spliteLine.spaceX = 120;
            this.list_spliteLine.repeatX = 3;
            this.list_spliteLine.centerX = 0;
         }
         else
         {
            this.list_spliteLine.visible = false;
         }
         this.list_kind.visible = false;
         this.list_reward.visible = true;
         this.btn_return.visible = true;
         this.btn_getReward.visible = this.getRewardVo.canGet;
         this.pageBar.visible = true;
      }
      
      private function list_reward_change(param1:int) : void
      {
         if(!this.getRewardVo.canGet)
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(300007201));
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_return !== _loc4_)
         {
            if(this.btn_getReward === _loc4_)
            {
               if(EnvConfig.ins.showDevModule && param2.altKey)
               {
                  _loc3_ = new HeroInfo();
                  _loc3_.baseInfo = HeroModel.ins.playerHero.baseInfo;
                  _loc3_.prop = HeroModel.ins.playerHero.prop;
                  _loc3_.items = HeroModel.ins.playerHero.items;
                  ObserverMgr.ins.sendNotice("MSG_LOTTERY_HERO_GET_REWARD",[_loc3_]);
               }
               else if(this.getRewardVo.canGet)
               {
                  if(this.list_reward.selectedIndex == -1)
                  {
                     AlertUtil.floatErr(LocaleMgr.ins.getStr(11900040));
                  }
                  else
                  {
                     lotteryGetReward((this.list_reward.selectedItem as WealthVo).sid);
                  }
               }
               else
               {
                  ModuleMgr.ins.closeModule(this.moduleId);
               }
            }
         }
         else
         {
            toState1();
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("MSG_LOTTERY_HERO_GET_REWARD_CLOSE");
         super.preClose(param1);
      }
      
      public function lotteryGetReward(param1:uint) : void
      {
         var _loc2_:LotteryGetRewardReq = new LotteryGetRewardReq();
         _loc2_.heroid = param1;
         ServerEngine.ins.send(7200,_loc2_,server_getReward);
      }
      
      private function server_getReward(param1:LotteryGetRewardRes, param2:ServerEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_LOTTERY_HERO_GET_REWARD",[param2.dataNotifyCacheVo.playerDataNotify.addHeroes[0] as HeroInfo]);
         LHModel.ins.panelInfo.point = LHModel.ins.panelInfo.point - int(DefindConsts.LOTTERY_POINT_FULL);
         ObserverMgr.ins.sendNotice("MSG_LOTTERY_HERO_CHANGE_MAGIC_POINT",null);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
