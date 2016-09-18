package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.GetRewardPromptUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxBase;
   import flash.events.MouseEvent;
   import morn.core.components.Button;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.components.Image;
   import nslm2.modules.cultivates.lotteryHeroModules.LHConsts;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ctrls.TSM;
   
   public class GetRewardPrompt extends GetRewardPromptUI implements IObserver
   {
      
      public static const TYPE_1:int = 1;
      
      public static const TYPE_2:int = 2;
       
      
      private var tsms:TSMDict;
      
      private var treasureBox:TreasureBoxBase;
      
      private var _isShowingBox:Boolean;
      
      public function GetRewardPrompt()
      {
         tsms = new TSMDict();
         treasureBox = new TreasureBoxBase();
         super();
         this.visible = false;
         this.centerX = 0;
         this.centerY = 0;
         this.txt_prompt.text = LocaleMgr.ins.getStr(11900044);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         DisplayUtils.replaceDisplayObject(this.img_icon,treasureBox);
         this.treasureBox.addEventListener("click",img_icon_onClick);
         tsms.put(this.box_bg,new TSM(this.box_bg,0.4).addState(404,{"alpha":0}));
         tsms.put(this.img_cover,new TSM(this.img_cover,0.4).addState(404,{"alpha":0}));
         tsms.toState(404,0);
         _isShowingBox = false;
         ObserverMgr.ins.regObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_LOTTERY_HERO_GET_REWARD_PROMPT"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_LOTTERY_HERO_GET_REWARD_PROMPT" === _loc3_)
         {
            show(param2);
         }
      }
      
      private function img_icon_onClick(param1:MouseEvent) : void
      {
         hide(true);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_close === _loc3_)
         {
            hide(false);
         }
      }
      
      private function hide(param1:Boolean) : void
      {
         this.mouseEvent = false;
         this.treasureBox.vo = new TreasureBoxVo([],4);
         tsms.toState(404);
         this.treasureBox.visible = false;
         new IconFlyEff(new Image(treasureBox.img_icon.skin),this.treasureBox.img_icon,LHConsts.GET_REWARD_ICON).addHandlers(new Handler(flyOutCpl,[param1])).exec();
         if(param1)
         {
            ModuleMgr.ins.showModule(11920,new GetRewardVo(0,true));
         }
      }
      
      private function flyOutCpl(param1:Boolean) : void
      {
         this.visible = false;
         _isShowingBox = false;
      }
      
      public function show(param1:int) : void
      {
         var _loc2_:int = 0;
         this.visible = true;
         switch(int(param1) - 1)
         {
            case 0:
               _loc2_ = 11900042;
               this.txt_title.text = LocaleMgr.ins.getStr(_loc2_);
               break;
            case 1:
               _loc2_ = 11900043;
               this.txt_title.text = LocaleMgr.ins.getStr(_loc2_);
         }
         if(_isShowingBox == false)
         {
            _isShowingBox = true;
            this.treasureBox.visible = false;
            this.treasureBox.vo = new TreasureBoxVo([],2);
            new IconFlyEff(new Image(treasureBox.img_icon.skin),LHConsts.GET_REWARD_ICON,this.treasureBox.img_icon).addHandlers(flyCpl).exec();
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(_loc2_));
         }
      }
      
      protected function flyCpl() : void
      {
         this.mouseEvent = true;
         this.treasureBox.visible = true;
         tsms.toState(0);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
