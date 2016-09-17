package nslm2.modules.cultivates.lotteryHeroModules.selectPanels
{
   import game.ui.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamondUI;
   import proto.LotteryInfoRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.LotteryReq;
   import nslm2.modules.cultivates.lotteryHeroModules.LotteryHeroVo;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.lotteryHeroModules.LHConsts;
   import nslm2.modules.foundations.AlertUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class LotteryHeroSelectDiamond extends LotteryHeroSelectDiamondUI
   {
       
      
      private var vo:LotteryInfoRes;
      
      private var box1InitX:int;
      
      public function LotteryHeroSelectDiamond()
      {
         super();
         box1InitX = this.boxCommon.box1.x;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         boxCommon.wealthNeed1.lotteryId = 2000;
         boxCommon.wealthNeed10.lotteryId = 2010;
      }
      
      public function parse(param1:LotteryInfoRes) : void
      {
         vo = param1;
         boxCommon.wealthNeed1.lotteryId = 2000;
         validateTxtFree();
      }
      
      private function validateTxtFree() : void
      {
         if(vo.oneCashFreeTimes > 0)
         {
            if(vo.oneCashCd > 0)
            {
               this.boxCommon.box1.x = this.box1InitX;
               this.boxCommon.box10.visible = true;
               this.boxCommon.wealthNeed1.visible = true;
               this.boxCommon.txt_prompt1.visible = false;
            }
            else
            {
               boxCommon.txt_prompt1.color = 458496;
               boxCommon.txt_prompt1.text = LocaleMgr.ins.getStr(11900010);
               this.boxCommon.wealthNeed1.visible = false;
               this.boxCommon.txt_prompt1.visible = true;
            }
         }
         else
         {
            boxCommon.txt_prompt1.color = 16723968;
            boxCommon.txt_prompt1.text = LocaleMgr.ins.getStr(11900009);
            this.boxCommon.wealthNeed1.visible = true;
            this.boxCommon.txt_prompt1.visible = false;
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999000072,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         vo.oneCd = 0;
         this.validateTxtFree();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         btn = param1;
         e = param2;
         var _loc4_:* = btn;
         if(this.boxCommon.btn_1 !== _loc4_)
         {
            if(this.boxCommon.btn_10 === _loc4_)
            {
               var wealthVO:WealthVo = WealthUtil.toStcCountVo(LHConsts.ins.costTypeAdvancedItem);
               if(wealthVO.showCount < 10)
               {
                  AlertUtil.comfirm(LocaleMgr.ins.getStr(999000628,[boxCommon.wealthNeed10.ref_txt_num.text]),function():void
                  {
                     if(boxCommon.wealthNeed10.isHad)
                     {
                        $lotteryHeroVo = new LotteryHeroVo(2010);
                        ObserverMgr.ins.sendNotice("msg_lottery_hero",$lotteryHeroVo);
                     }
                     else
                     {
                        WealthUtil.getPoint(boxCommon.wealthNeed10.wealthVo);
                     }
                  });
               }
               else if(this.boxCommon.wealthNeed10.isHad)
               {
                  var $lotteryHeroVo:LotteryHeroVo = new LotteryHeroVo(2010);
                  ObserverMgr.ins.sendNotice("msg_lottery_hero",$lotteryHeroVo);
               }
               else
               {
                  WealthUtil.getPoint(this.boxCommon.wealthNeed10.wealthVo);
               }
            }
         }
         else if(this.boxCommon.wealthNeed1.isHad || vo.oneCashFreeTimes > 0 && vo.oneCashCd <= 0)
         {
            $lotteryHeroVo = new LotteryHeroVo(2000);
            $lotteryHeroVo.isFree = vo.oneCashFreeTimes > 0 && vo.oneCashCd <= 0;
            ObserverMgr.ins.sendNotice("msg_lottery_hero",$lotteryHeroVo);
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
