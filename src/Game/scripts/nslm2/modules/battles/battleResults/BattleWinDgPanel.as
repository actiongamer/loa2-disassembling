package nslm2.modules.battles.battleResults
{
   import game.ui.battleResults.BattleWinDgPanelUI;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import com.greensock.TimelineLite;
   import com.greensock.easing.Linear;
   
   public class BattleWinDgPanel extends BattleWinDgPanelUI implements IBattleWinPanel
   {
       
      
      private var configVo:nslm2.modules.battles.battleResults.BattleResultConfigVo;
      
      private var showAwardList:Boolean = false;
      
      private var showItemList:Boolean = false;
      
      private var activityDoubleTip:ActivityDoubleTip;
      
      public function BattleWinDgPanel()
      {
         super();
         var _loc1_:int = 0;
         this.centerY = _loc1_;
         this.centerX = _loc1_;
      }
      
      public function init(param1:nslm2.modules.battles.battleResults.BattleResultConfigVo) : void
      {
         this.configVo = param1;
         this.box_mainPanel.alpha = 0;
         var _loc2_:Array = WealthUtil.rewardArrToWealthVoArr(param1.resVo.dropItems.concat());
         var _loc5_:Array = [];
         var _loc4_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            if(_loc3_.kind == 20)
            {
               _loc5_.push(_loc3_);
            }
            else
            {
               _loc4_.push(_loc3_);
            }
         }
         if(_loc5_.length > 0)
         {
            this.list_item.dataSource = _loc5_;
            showItemList = true;
         }
         else
         {
            this.list_item.dataSource = [];
         }
         if(this.configVo.resVo.addExp > 0)
         {
            _loc4_.push(WealthUtil.createWealthVo(10,0,this.configVo.resVo.addExp));
         }
         if(this.configVo.resVo.gold > 0)
         {
            _loc4_.push(WealthUtil.createWealthVo(1,0,this.configVo.resVo.gold));
         }
         if(this.configVo.resVo.shenyuanStar > 0)
         {
            _loc4_.push(WealthUtil.createWealthVo(4444,0,this.configVo.resVo.shenyuanStar));
         }
         if(_loc4_.length > 0)
         {
            this.list_award.dataSource = _loc4_;
            showAwardList = true;
         }
         else
         {
            this.list_award.dataSource = [];
         }
         switch(int(this.configVo.resVo.star) - 1)
         {
            case 0:
               this.txt_desc.text = LocaleMgr.ins.getStr(40210001);
               break;
            case 1:
               this.txt_desc.text = LocaleMgr.ins.getStr(40210002);
               break;
            case 2:
               this.txt_desc.text = LocaleMgr.ins.getStr(40210003);
         }
         if(showItemList && !showAwardList)
         {
            txt_item.y = 350;
            list_item.y = 350;
         }
         else if(!showItemList && showAwardList)
         {
            txt_award.y = 350;
            list_award.y = 350;
         }
         if(BattleResultGlobel.ins.doubleId > 0 && ActivityModel.ins.have(BattleResultGlobel.ins.doubleId))
         {
            activityDoubleTip = new ActivityDoubleTip();
            this.addChild(activityDoubleTip);
            activityDoubleTip.x = 110 + (showItemList || showAwardList?24:0);
            activityDoubleTip.y = 151 + (showItemList && showAwardList?115:Number(showItemList || showAwardList?56:0));
            activityDoubleTip.visible = false;
         }
         txt_desc.visible = false;
         txt_award.visible = false;
         img_line.visible = false;
         txt_item.visible = false;
         txt_tip.visible = false;
      }
      
      public function play() : void
      {
         showMainInfo();
         this.fadeIn();
      }
      
      private function showMainInfo() : void
      {
         var _loc1_:TimelineLite = new TimelineLite();
         var _loc2_:* = 0;
         _loc1_.to(box_mainPanel,0.2,{
            "alpha":1,
            "ease":Linear.easeNone
         },0.1 + _loc2_);
         _loc1_.from(this.big_bg,0.1,{
            "scaleY":0,
            "ease":Linear.easeNone
         },0.3 + _loc2_);
         if(this.configVo.resVo.star > 0)
         {
            _loc1_.from(this.txt_desc,0.4,{"alpha":0},"+=0.2");
            txt_desc.visible = true;
         }
         if(this.showAwardList)
         {
            _loc1_.from(this.txt_award,0.2,{"alpha":0},"+=0.2");
            txt_award.visible = true;
         }
         if(this.showAwardList && this.showItemList)
         {
            _loc1_.from(this.img_line,0.2,{"scaleX":0},"+=0.2");
            img_line.visible = true;
         }
         if(this.showItemList)
         {
            _loc1_.from(this.txt_item,0.1,{"alpha":0},"+=0.2");
            txt_item.visible = true;
         }
         _loc1_.from(this.box_btns,0.1,{
            "alpha":0,
            "y":this.box_btns.y - 10
         },"+=0.2");
         _loc1_.call(setCountDown,null,"+=0.1");
      }
      
      override public function dispose() : void
      {
         if(activityDoubleTip)
         {
            activityDoubleTip.dispose();
            activityDoubleTip = null;
         }
         super.dispose();
      }
      
      private function setCountDown() : void
      {
         this.box_btns.dataSource = this.configVo;
         if(activityDoubleTip)
         {
            activityDoubleTip.visible = true;
         }
      }
   }
}
