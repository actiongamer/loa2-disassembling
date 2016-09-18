package nslm2.modules.funnies.renZhengs.WeiXinAndPhones
{
   import game.ui.renzhengs.weiXinAndPhones.RenZhengWeiXinPanelUI;
   import com.mz.core.utils2.QRUBitmap;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.core.utils.StringUtils;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   
   public class RenZhengWeiXinPanel extends RenZhengWeiXinPanelUI
   {
       
      
      public function RenZhengWeiXinPanel()
      {
         super();
         this.switchEvents(true);
      }
      
      private function switchEvents(param1:Boolean) : void
      {
         if(param1)
         {
            RenZhengService.ins.addEventListener("EVT_GET_WEI_XIN_BIND",getBind);
            RenZhengService.ins.addEventListener("EVT_GET_WEI_XIN_GET_REWARD",getReward);
         }
         else
         {
            RenZhengService.ins.removeEventListener("EVT_GET_WEI_XIN_BIND",getBind);
            RenZhengService.ins.removeEventListener("EVT_GET_WEI_XIN_GET_REWARD",getReward);
         }
      }
      
      override public function dispose() : void
      {
         this.switchEvents(false);
         super.dispose();
      }
      
      public function init() : void
      {
         this.img_code.autoSize = true;
         this.img_code.bitmapData = QRUBitmap.createImg(ClientConfig.district,ClientConfig.playId);
         this.txt_inputPrompt.text = LocaleMgr.ins.getStr(60760007);
         this.txt_checkCodeInput.text = "";
         this.parts.push(new TextPromptBind(this.txt_checkCodeInput.textField,this.txt_inputPrompt));
         this.txt_checkCodeInput.maxChars = 30;
         this.txt_tip1.text = LocaleMgr.ins.getStr(60760009);
         this.txt_tip2.text = LocaleMgr.ins.getStr(60760011);
         refreshState();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      private function refreshState() : void
      {
         if(RenZhengService.ins.weixinInfo.alreadyget)
         {
            this.btn_get.disabled = true;
            this.btn_get.label = LocaleMgr.ins.getStr(10600041);
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(41300099);
            if(RenZhengService.ins.weixinInfo.cangetreward)
            {
               this.btn_get.disabled = false;
            }
            else
            {
               this.btn_get.disabled = true;
            }
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_get === _loc4_)
         {
            _loc3_ = StringUtils.trim(this.txt_checkCodeInput.text);
            if(_loc3_ == "")
            {
               AlertUtil.float(LocaleMgr.ins.getStr(60760007));
            }
            else
            {
               RenZhengService.ins.server_weixinGetReward();
            }
         }
      }
      
      private function getBind(param1:Event) : void
      {
         this.refreshState();
      }
      
      private function getReward(param1:Event) : void
      {
         this.refreshState();
      }
   }
}
