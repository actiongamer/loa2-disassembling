package nslm2.modules.cultivates.lotteryHeroModules.kindPanels
{
   import game.ui.lotteryHeroModules.kindPanels.LHKindAdvanUI;
   import proto.LotteryInfoRes;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.lotteryHeroModules.comps.LHNextHigh;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LotteryHeroSelectDiamond;
   import nslm2.modules.cultivates.lotteryHeroModules.LHModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.TimeUtils;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import nslm2.modules.cultivates.lotteryHeroModules.LotteryHeroLightCtrl;
   
   public class LHKindAdvan extends LHKindAdvanUI
   {
       
      
      private var vo:LotteryInfoRes;
      
      private var textCDCtrl:TextCDCtrl;
      
      public function LHKindAdvan()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_ORANGE).addHandler(breath_cb));
         this.parts.push(new LotteryHeroLightCtrl(this.img_light,this.img_mask));
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.bg.filters = param1;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
      }
      
      private function get nextHighRef() : LHNextHigh
      {
         return nextHigh as LHNextHigh;
      }
      
      public function parse(param1:LotteryInfoRes) : void
      {
         vo = param1;
         initDiamond();
         this.nextHighRef.show();
      }
      
      private function initDiamond() : void
      {
         this.img_discount.visible = false;
         if(textCDCtrl == null)
         {
            textCDCtrl = new TextCDCtrl(this.txt_prompt,textCDFormat,txtCDCtrl_cpl);
         }
         this.txt_desc.text = LocaleMgr.ins.getStr(11900004);
         if(vo.oneCashCd > 0)
         {
            textCDCtrl.start(vo.oneCashCd);
            this.txt_prompt.color = 16723968;
            this.imgRenPoint.visible = false;
            this.txt_prompt.visible = true;
            showDiscount();
         }
         else
         {
            textCDCtrl.stop();
            if(vo.oneCashFreeTimes > 0)
            {
               this.txt_prompt.color = 458496;
               this.txt_prompt.text = LocaleMgr.ins.getStr(11900048);
               this.txt_prompt.visible = false;
               this.imgRenPoint.visible = true;
            }
            else
            {
               this.txt_prompt.color = 16723968;
               this.txt_prompt.text = LocaleMgr.ins.getStr(11900009);
               this.txt_prompt.visible = true;
               this.imgRenPoint.visible = false;
               showDiscount();
            }
         }
         (this.renderSelect as LotteryHeroSelectDiamond).parse(vo);
      }
      
      private function showDiscount() : void
      {
         if(LHModel.ins.discount)
         {
            this.img_discount.skin = UrlLib.discountIconRight(LHModel.ins.discount);
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(11900008,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         vo.oneCd = 0;
         this.initDiamond();
      }
   }
}
