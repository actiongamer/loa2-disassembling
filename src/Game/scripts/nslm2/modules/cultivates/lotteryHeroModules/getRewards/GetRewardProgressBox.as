package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressBoxUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxBase;
   import flash.events.Event;
   import nslm2.modules.cultivates.lotteryHeroModules.LHModel;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.lotteryHeroModules.LHConsts;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   
   public class GetRewardProgressBox extends GetRewardProgressBoxUI implements IObserver
   {
       
      
      private var breathFilter:GlowFilterBreathCtrl;
      
      private var treasureBox:TreasureBoxBase;
      
      private var _magicPoint:int = 0;
      
      public function GetRewardProgressBox()
      {
         treasureBox = new TreasureBoxBase();
         super();
         LHConsts.GET_REWARD_ICON = this.treasureBox.img_icon;
         this.progressBar_value.mouseEnabled = false;
         DisplayUtils.replaceDisplayObject(this.img_icon,treasureBox);
         this.treasureBox.toolTip = LocaleMgr.ins.getStr(11900034);
         var _loc1_:* = new GlowFilterBreathCtrl(FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(5))).addHandler(breath_cb);
         this.breathFilter = _loc1_;
         this.parts.push(_loc1_);
         this.treasureBox.addEventListener("click",onClick);
         ObserverMgr.ins.regObserver(this);
         this.wealth0.showMultipleSign = true;
         this.wealth1.showMultipleSign = true;
         this.wealth2.showMultipleSign = true;
         this.wealth0.wealthVo = WealthUtil.toStcCountVo(LHConsts.ins.costTypeNormal);
         this.wealth1.wealthVo = WealthUtil.toStcCountVo(LHConsts.ins.costTypeAdvancedItem);
         this.wealth2.wealthVo = WealthUtil.toStcCountVo(LHConsts.ins.costTypeAdvancedDiamond);
      }
      
      public function get progressBar_magic() : GetRewardProgressBar
      {
         return this.progressBar_magicUI as GetRewardProgressBar;
      }
      
      private function onClick(param1:Event) : void
      {
         if(LHModel.ins.canGetReward)
         {
            this.treasureBox.vo = new TreasureBoxVo([],4);
         }
         ModuleMgr.ins.showModule(11920,new GetRewardVo(0,LHModel.ins.canGetReward));
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function refreshMagicPoint(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = LHModel.ins.panelInfo.point - _magicPoint;
            if(_loc2_ > 0)
            {
               AlertUtil.showPropChangeTip(LocaleMgr.ins.getStr(11900041),_loc2_,floatCpl,DisplayUtils.globarCenter(this.progressBar_value),null);
            }
            else
            {
               showMagicPoint();
            }
         }
         else
         {
            showMagicPoint();
         }
      }
      
      private function floatCpl() : void
      {
         this.showMagicPoint();
      }
      
      private function showMagicPoint() : void
      {
         _magicPoint = LHModel.ins.panelInfo.point;
         this.progressBar_value.text = _magicPoint + "/" + DefindConsts.LOTTERY_POINT_FULL;
         this.progressBar_magic.value = _magicPoint;
         if(LHModel.ins.canGetReward)
         {
            this.treasureBox.vo = new TreasureBoxVo([],2);
         }
         else
         {
            this.treasureBox.vo = new TreasureBoxVo([],1);
         }
      }
      
      private function breath_cb(param1:Array) : void
      {
         if(LHModel.ins.canGetReward)
         {
            this.progressBar_magic.filters = param1;
         }
         else
         {
            this.progressBar_magic.filters = [];
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_LOTTERY_HERO_CHANGE_MAGIC_POINT","MSG_LOTTERY_HERO_GET_REWARD_CLOSE","MSG_GM_CMD"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_GM_CMD" !== _loc3_)
         {
            if("MSG_LOTTERY_HERO_GET_REWARD_CLOSE" !== _loc3_)
            {
               if("MSG_LOTTERY_HERO_CHANGE_MAGIC_POINT" === _loc3_)
               {
                  this.refreshMagicPoint();
               }
            }
            else if(LHModel.ins.canGetReward)
            {
               this.treasureBox.vo = new TreasureBoxVo([],2);
            }
            else
            {
               this.treasureBox.vo = new TreasureBoxVo([],1);
            }
         }
         else if(param2[0] == "pm")
         {
            LHModel.ins.panelInfo.point = param2[1];
            showMagicPoint();
         }
      }
   }
}
