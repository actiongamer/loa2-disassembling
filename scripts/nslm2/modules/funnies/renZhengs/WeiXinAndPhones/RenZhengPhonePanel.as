package nslm2.modules.funnies.renZhengs.WeiXinAndPhones
{
   import game.ui.renzhengs.weiXinAndPhones.RenZhengPhonePanelUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.core.utils.StringUtils;
   import nslm2.modules.foundations.AlertUtil;
   import flash.events.Event;
   
   public class RenZhengPhonePanel extends RenZhengPhonePanelUI
   {
       
      
      private var cbCtrl:TextCDCtrl;
      
      private var btnGetEff:BmcSpriteSheet;
      
      public function RenZhengPhonePanel()
      {
         super();
         this.switchEvents(true);
      }
      
      private function switchEvents(param1:Boolean) : void
      {
         if(param1)
         {
            RenZhengService.ins.addEventListener("EVT_GET_PHONE_BIND",getPhoneBind);
            RenZhengService.ins.addEventListener("EVT_GET_PHONE_GET_REWARD",getPhoneReward);
         }
         else
         {
            RenZhengService.ins.removeEventListener("EVT_GET_PHONE_BIND",getPhoneBind);
            RenZhengService.ins.removeEventListener("EVT_GET_PHONE_GET_REWARD",getPhoneReward);
         }
      }
      
      override public function dispose() : void
      {
         if(cbCtrl)
         {
            cbCtrl.stop();
            cbCtrl = null;
         }
         this.switchEvents(false);
         super.dispose();
      }
      
      public function init() : void
      {
         this.txt_phoneLab.text = LocaleMgr.ins.getStr(60760003);
         this.txt_checkCodeLab.text = LocaleMgr.ins.getStr(60760004);
         this.txt_phonePrompt.text = LocaleMgr.ins.getStr(60760005);
         this.txt_checkCodePrompt.text = LocaleMgr.ins.getStr(60760007);
         this.txt_phoneInput.text = RenZhengService.ins.phoneNum;
         this.txt_checkCodeInput.text = "";
         this.parts.push(new TextPromptBind(this.txt_phoneInput.textField,this.txt_phonePrompt));
         this.parts.push(new TextPromptBind(this.txt_checkCodeInput.textField,this.txt_checkCodePrompt));
         this.txt_phoneInput.maxChars = 20;
         this.txt_checkCodeInput.maxChars = 30;
         this.btn_getCheckCode.label = LocaleMgr.ins.getStr(60760006);
         this.txt_tip1.text = LocaleMgr.ins.getStr(60760008);
         refreshState();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.cbCtrl = new TextCDCtrl(this.btn_getCheckCode.btnLabel,textCDFormat,textCdCpl);
      }
      
      private function refreshState() : void
      {
         var _loc1_:* = null;
         if(RenZhengService.ins.mobileBindInfoData.binded == false)
         {
            this.btn_getCheckCode.disabled = false;
            if(btnGetEff)
            {
               btnGetEff.visible = false;
            }
            this.btn_get.disabled = false;
            this.btn_get.label = LocaleMgr.ins.getStr(60760013);
         }
         else
         {
            this.btn_getCheckCode.disabled = true;
            if(RenZhengService.ins.mobileBindInfoData.cangetreward)
            {
               if(btnGetEff == null)
               {
                  _loc1_ = new BmcSpriteSheet();
                  btnGetEff = new BmcSpriteSheet();
                  _loc1_.init(115002,1,"all",true);
                  this.addChild(_loc1_);
                  _loc1_.x = btn_get.x - 9;
                  _loc1_.y = btn_get.y - 10;
               }
               else
               {
                  btnGetEff.visible = true;
               }
               this.btn_get.disabled = false;
               this.btn_get.label = LocaleMgr.ins.getStr(41300099);
            }
            else
            {
               if(btnGetEff)
               {
                  btnGetEff.visible = false;
               }
               this.btn_get.disabled = true;
               this.btn_get.label = LocaleMgr.ins.getStr(10600041);
            }
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(60760014,[param1]);
      }
      
      private function textCdCpl() : void
      {
         this.btn_getCheckCode.label = LocaleMgr.ins.getStr(60760006);
         this.btn_getCheckCode.disabled = false;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_getCheckCode !== _loc3_)
         {
            if(this.btn_get === _loc3_)
            {
               if(RenZhengService.ins.mobileBindInfoData.binded == false)
               {
                  if(checkPhoneInput() && checkCodeInput())
                  {
                     RenZhengService.ins.server_mobileCheck(StringUtils.trim(this.txt_checkCodeInput.text));
                  }
               }
               else
               {
                  RenZhengService.ins.server_mobileCheckGetReward();
               }
            }
         }
         else if(checkPhoneInput())
         {
            RenZhengService.ins.phoneNum = StringUtils.trim(this.txt_phoneInput.text);
            RenZhengService.ins.server_mobileCheckGetCode(RenZhengService.ins.phoneNum,getCodeHandler);
         }
      }
      
      private function checkPhoneInput() : Boolean
      {
         var _loc1_:String = StringUtils.trim(this.txt_phoneInput.text);
         if(_loc1_ == "")
         {
            AlertUtil.float(LocaleMgr.ins.getStr(60760005));
            return false;
         }
         return true;
      }
      
      private function checkCodeInput() : Boolean
      {
         var _loc1_:String = StringUtils.trim(this.txt_checkCodeInput.text);
         if(_loc1_ == "")
         {
            AlertUtil.float(LocaleMgr.ins.getStr(60760007));
            return false;
         }
         return true;
      }
      
      private function getCodeHandler() : void
      {
         this.btn_getCheckCode.disabled = true;
         this.cbCtrl.start(60);
      }
      
      private function getPhoneBind(param1:Event) : void
      {
         if(cbCtrl)
         {
            this.cbCtrl.stop();
         }
         this.btn_getCheckCode.label = LocaleMgr.ins.getStr(60760006);
         this.refreshState();
      }
      
      private function getPhoneReward(param1:Event) : void
      {
         this.refreshState();
      }
   }
}
