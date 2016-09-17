package nslm2.modules.funnies.arenas.rewards
{
   import game.ui.arenas.rewards.ArenaRewardModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.utils.ObjectUtils;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.customs.expands.MornExpandUtil;
   
   public class ArenaRewardModule extends ArenaRewardModuleUI
   {
      
      public static const ACT_RANK_REWARD_GET_SUCCES:String = "ACT_RANK_REWARD_GET_SUCCES";
       
      
      private var _actRewardVo:nslm2.modules.funnies.arenas.rewards.ActRewardVo;
      
      public function ArenaRewardModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         super.moduleServerStart(param1);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _actRewardVo = param1 as nslm2.modules.funnies.arenas.rewards.ActRewardVo;
         this.panelBg.titleImgId = this.moduleId;
         if(_actRewardVo.titleString)
         {
            this.panelBg.txt_titleName.text = _actRewardVo.titleString;
         }
         this.list.selectEnable = false;
         this.list.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.list.commitMeasure();
         this.txt_tip.text = _actRewardVo.tipString;
         var _loc2_:Array = _actRewardVo.list_items;
         _loc2_.sortOn("rankMin",16);
         this.list.array = _loc2_;
         this.txt_refreshTime.text = _actRewardVo.canNotGetTip;
         this.txt_refreshTime.visible = false;
         refresh();
         super.preShow(param1);
      }
      
      private function refresh() : void
      {
         if(_actRewardVo.rankStr)
         {
            this.txt_myRank.visible = true;
            this.txt_myRank.text = _actRewardVo.rankStr;
         }
         else if(_actRewardVo.yesterdayRank > 0)
         {
            this.txt_myRank.visible = true;
            this.txt_myRank.text = _actRewardVo.yesterdayRank + "";
         }
         else
         {
            this.txt_myRank.visible = true;
            this.txt_myRank.text = LocaleMgr.ins.getStr(999000020);
         }
         if(_actRewardVo.notReward)
         {
            this.txt_tip.text = _actRewardVo.canGetTip;
            btn_get.visible = false;
            txt_refreshTime.visible = true;
            return;
         }
         if(_actRewardVo.canGetReward || _actRewardVo.hasGotReward)
         {
            if(_actRewardVo.canGetReward)
            {
               this.txt_tip.text = _actRewardVo.canGetTip;
            }
            if(_actRewardVo.hasGotReward && _actRewardVo.haveGotTipTop)
            {
               this.txt_tip.text = _actRewardVo.haveGotTipTop;
            }
            this.list.cells.forEach(function(param1:ArenaRewardRender, ... rest):void
            {
               param1.haveGotReward = _actRewardVo.hasGotReward;
               param1.yesterdayRank = _actRewardVo.yesterdayRank;
            });
            var $index:int = ArrayUtil.indexOf(this.list.array,_actRewardVo.rank,getRankIndex);
            this.list.scrollTo($index);
            if(_actRewardVo.hasGotReward)
            {
               this.btn_get.label = LocaleMgr.ins.getStr(999000234);
               this.btn_get.label = LocaleMgr.ins.getStr(10700013);
               ObjectUtils.gray(this.btn_get,true);
            }
            else
            {
               this.btn_get.label = LocaleMgr.ins.getStr(999000240);
               this.btn_get.disabled = false;
               ObjectUtils.gray(this.btn_get,false);
            }
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(999000262);
            this.btn_get.buttonMode = false;
            this.btn_get.disabled = false;
            ObjectUtils.gray(this.btn_get,true);
         }
      }
      
      private function getRankIndex(param1:Array, param2:int, param3:int, param4:StcRankVo) : Boolean
      {
         return param4.checkRank(param2);
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            if(_actRewardVo.hasGotReward)
            {
               AlertUtil.float(_actRewardVo.haveGotTip);
            }
            else if(!_actRewardVo.canGetReward)
            {
               AlertUtil.float(_actRewardVo.canNotGetTip);
            }
            else
            {
               Handler.execute(_actRewardVo.getHandler);
            }
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["ACT_RANK_REWARD_GET_SUCCES"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = param1;
         if("ACT_RANK_REWARD_GET_SUCCES" === _loc6_)
         {
            _actRewardVo.hasGotReward = true;
            _loc4_ = this.list.cells.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = this.list.cells[_loc5_] as ArenaRewardRender;
               if(_loc3_.visible && _loc3_.rankVo && _loc3_.rankVo.checkRank(_actRewardVo.rank))
               {
                  new ListIconFlyEff(_loc3_.list_reward).set_autoHideFrom(false).exec();
                  _loc3_.img_get.visible = true;
                  break;
               }
               _loc5_++;
            }
            refresh();
         }
      }
   }
}
