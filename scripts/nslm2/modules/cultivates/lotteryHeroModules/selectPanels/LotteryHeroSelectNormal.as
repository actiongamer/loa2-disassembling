package nslm2.modules.cultivates.lotteryHeroModules.selectPanels
{
   import game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectNormalUI;
   import proto.LotteryInfoRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.lotteryHeroModules.LotteryHeroVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class LotteryHeroSelectNormal extends LotteryHeroSelectNormalUI
   {
       
      
      private var box1InitX:int;
      
      private var vo:LotteryInfoRes;
      
      public function LotteryHeroSelectNormal()
      {
         super();
         box1InitX = this.boxCommon.box1.x;
         this.boxCommon.txt_prompt1.text = "";
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         boxCommon.wealthNeed1.lotteryId = 1000;
         boxCommon.wealthNeed10.lotteryId = 1010;
      }
      
      public function parse(param1:LotteryInfoRes) : void
      {
         vo = param1;
         validateTxtFree();
      }
      
      private function validateTxtFree() : void
      {
         if(vo.oneFreeTimes > 0)
         {
            if(vo.oneCd > 0)
            {
               this.boxCommon.box1.x = this.box1InitX;
               this.boxCommon.box10.visible = true;
               this.boxCommon.wealthNeed1.visible = true;
               this.boxCommon.txt_prompt1.visible = false;
            }
            else
            {
               this.boxCommon.txt_prompt1.color = 458496;
               this.boxCommon.txt_prompt1.text = LocaleMgr.ins.getStr(11900007,[vo.oneFreeTimes,3]);
               this.boxCommon.txt_prompt1.visible = true;
               this.boxCommon.wealthNeed1.visible = false;
            }
         }
         else
         {
            this.boxCommon.wealthNeed1.visible = true;
            this.boxCommon.txt_prompt1.visible = false;
         }
         this.boxCommon.commitMeasure();
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(11900008,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         vo.oneCd = 0;
         this.validateTxtFree();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if(this.boxCommon.btn_1 !== _loc5_)
         {
            if(this.boxCommon.btn_10 === _loc5_)
            {
               if(this.boxCommon.wealthNeed10.isHad)
               {
                  _loc3_ = new LotteryHeroVo(1010);
                  ObserverMgr.ins.sendNotice("msg_lottery_hero",_loc3_);
               }
               else
               {
                  WealthUtil.getPoint(this.boxCommon.wealthNeed10.wealthVo);
               }
            }
         }
         else if(this.boxCommon.wealthNeed1.isHad || vo.oneFreeTimes > 0 && vo.oneCd <= 0)
         {
            _loc3_ = new LotteryHeroVo(1000);
            _loc3_.isFree = vo.oneCashFreeTimes > 0 && vo.oneCashCd <= 0;
            ObserverMgr.ins.sendNotice("msg_lottery_hero",_loc3_);
         }
         else
         {
            WealthUtil.getPoint(this.boxCommon.wealthNeed1.wealthVo);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
