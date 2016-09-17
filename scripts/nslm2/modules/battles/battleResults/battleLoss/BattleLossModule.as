package nslm2.modules.battles.battleResults.battleLoss
{
   import game.ui.battleResults.BattleLossModuleUI;
   import com.mz.core.components.comp2d.BlackRim;
   import flash.display.MovieClip;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import com.mz.core.configs.ClientConfig;
   import com.greensock.TimelineLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.handlers.Handler;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   
   public class BattleLossModule extends BattleLossModuleUI
   {
      
      private static const INIT_MODULE_ARR:Array = [11900,30500,30600];
      
      private static const PANEL_WIDTH:int = 788;
       
      
      private const NOREWARD_PROGRESS_Y:Number = 201;
      
      private var _rim:BlackRim;
      
      private var _mc:MovieClip;
      
      private var configVo:BattleResultConfigVo;
      
      private var activityDoubleTip:ActivityDoubleTip;
      
      public function BattleLossModule()
      {
         super();
         this.moduleFadeInType = 0;
         _mc = ResMgr.ins.getRes("effect2d/battle/lossLogo.swf");
         _mc.gotoAndStop(1);
         var _loc2_:int = 1;
         _mc.scaleY = _loc2_;
         _mc.scaleX = _loc2_;
         _mc.x = (this.width - _mc.width) / 2;
         _mc.y = (this.height - _mc.height) / 2 - 100;
         this.addChild(_mc);
         var _loc1_:Array = moduleArr;
         this.list_fun.dataSource = _loc1_;
         this.list_fun.repeatX = _loc1_.length;
         this.list_fun.commitMeasure();
         this.list_fun.x = 788 - this.list_fun.width >> 1;
         this.list_fun.selectHandler = listSelected;
         this.render_btns.alpha = 0;
         this.render_btns.y = 239;
      }
      
      private function get moduleArr() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = INIT_MODULE_ARR;
         for each(var _loc2_ in INIT_MODULE_ARR)
         {
            if(FuncOpenAutoCtrl.checkOpen(_loc2_) == true)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      private function listSelected(param1:int) : void
      {
         BattleLossExitMgr.ins.needOpenModuleId = moduleArr[param1];
         exit();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         configVo = param1 as BattleResultConfigVo;
         var _loc2_:int = 0;
         this.centerY = _loc2_;
         this.centerX = _loc2_;
         this.box_main.visible = false;
         super.preShow(param1);
      }
      
      private function initView() : void
      {
         var _loc1_:* = null;
         this.box_main.visible = true;
         if(configVo.resVo && configVo.resVo.dropItems)
         {
            _loc1_ = WealthUtil.rewardArrToWealthVoArr(configVo.resVo.dropItems.concat());
            if(_loc1_.length > 0)
            {
               if(BattleResultGlobel.ins.doubleId == 1010 && ActivityModel.ins.have(BattleResultGlobel.ins.doubleId))
               {
                  activityDoubleTip = new ActivityDoubleTip(LocaleMgr.ins.getStr(999000024));
                  this.addChild(activityDoubleTip);
                  activityDoubleTip.x = 99;
                  activityDoubleTip.y = 254;
                  activityDoubleTip.visible = false;
               }
            }
            if(this.configVo.resVo.addExp > 0)
            {
               _loc1_.push(WealthUtil.createWealthVo(10,0,this.configVo.resVo.addExp));
            }
            if(this.configVo.resVo.gold > 0)
            {
               _loc1_.push(WealthUtil.createWealthVo(1,0,this.configVo.resVo.gold));
            }
            if(this.configVo.resVo.shenyuanStar > 0)
            {
               _loc1_.push(WealthUtil.createWealthVo(4444,0,this.configVo.resVo.shenyuanStar));
            }
         }
         if(configVo.disableLossBtn)
         {
            this.list_fun.mouseEnabled = false;
            this.list_fun.mouseChildren = false;
         }
         this.render_btns.dataSource = this.configVo;
         if(_loc1_ && _loc1_.length > 0)
         {
            txt_text.y = 265;
            list_fun.y = 290;
            txt_item.visible = true;
            this.list_item.dataSource = _loc1_;
         }
         else
         {
            txt_item.visible = false;
            this.list_item.dataSource = [];
         }
         if(this.configVo.resVo && !StringUtils.isNull(this.configVo.resVo.lossAward))
         {
            txt_text.y = 265;
            list_fun.y = 290;
            txt_item.visible = true;
            txt_item.text = LocaleMgr.ins.getStr(999000025) + this.configVo.resVo.lossAward;
         }
         if(activityDoubleTip)
         {
            activityDoubleTip.visible = true;
         }
      }
      
      override public function moduleFadeIn(param1:Number = 0) : void
      {
         _rim = new BlackRim();
         _rim.hole = null;
         _rim.width = ClientConfig.SCENE_FIXED_W;
         _rim.height = ClientConfig.SCENE_FIXED_H;
         _rim.alpha = 0.7;
         _rim.draw();
         this.parent.addChildAt(_rim,0);
         var _loc3_:TimelineLite = new TimelineLite();
         _loc3_.add(TweenMax.to(_mc,1.1,{
            "frame":28,
            "ease":Linear.easeNone
         }));
         var _loc2_:Number = (this.width - _mc.width * 0.6) / 2;
         _loc3_.to(_mc,0.2,{
            "scaleX":0.6,
            "scaleY":0.6,
            "x":_loc2_,
            "y":-200,
            "ease":Linear.easeNone
         });
         _loc3_.call(initView,null,"+=0.2");
         _loc3_.from(this.box_main,0.2,{"alpha":0},"+=0.1");
         _loc3_.to(this.render_btns,0.2,{
            "y":355,
            "alpha":1
         },"+=.2");
         moduleFadeInCpl();
      }
      
      private function exit() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         Handler.execute(configVo.closeHandler);
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(this.render_btns);
         DisplayUtils.removeSelf(_rim);
         _rim = null;
         super.dispose();
      }
   }
}
