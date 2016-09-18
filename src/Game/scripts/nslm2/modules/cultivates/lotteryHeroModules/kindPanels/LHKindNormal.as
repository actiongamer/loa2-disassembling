package nslm2.modules.cultivates.lotteryHeroModules.kindPanels
{
   import game.ui.lotteryHeroModules.kindPanels.LHKindNormalUI;
   import proto.LotteryInfoRes;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.lotteryHeroModules.selectPanels.LotteryHeroSelectNormal;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.lotteryHeroModules.LHConsts;
   import nslm2.utils.TimeUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class LHKindNormal extends LHKindNormalUI
   {
       
      
      private var vo:LotteryInfoRes;
      
      private var textCDCtrl:TextCDCtrl;
      
      public function LHKindNormal()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
      }
      
      public function parse(param1:LotteryInfoRes) : void
      {
         vo = param1;
         initNormal();
      }
      
      private function initNormal() : void
      {
         if(textCDCtrl == null)
         {
            textCDCtrl = new TextCDCtrl(this.txt_prompt,textCDFormat,txtCDCtrl_cpl);
         }
         this.txt_desc.text = LocaleMgr.ins.getStr(11900002);
         if(vo.oneCd > 0)
         {
            textCDCtrl.start(vo.oneCd);
            this.txt_prompt.color = 16723968;
            this.imgRenPoint.visible = false;
            this.txt_prompt.visible = true;
         }
         else
         {
            textCDCtrl.stop();
            if(vo.oneFreeTimes > 0)
            {
               this.txt_prompt.color = 458496;
               this.txt_prompt.text = LocaleMgr.ins.getStr(11900007,[vo.oneFreeTimes,3]);
               this.txt_prompt.visible = false;
               this.imgRenPoint.visible = true;
            }
            else
            {
               this.txt_prompt.color = 16723968;
               this.txt_prompt.text = LocaleMgr.ins.getStr(11900009);
               this.txt_prompt.visible = true;
               this.imgRenPoint.visible = false;
            }
         }
         (this.renderSelect as LotteryHeroSelectNormal).parse(vo);
         if(PlayerModel.ins.getCountByWealthVo(LHConsts.ins.costTypeNormal) > 0)
         {
            this.imgRenPoint.visible = true;
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(11900008,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         vo.oneCd = 0;
         this.initNormal();
      }
   }
}
