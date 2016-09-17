package nslm2.modules.funnies.renZhengs.WeiXinAndPhones
{
   import game.ui.renzhengs.weiXinAndPhones.RenZhengXunLeiPhonePanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import morn.core.utils.URLUtils;
   import mx.utils.StringUtil;
   import nslm2.modules.foundations.AlertUtil;
   import proto.ActivateCodeReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ActivateCodeRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.Reward;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class RenZhengXunLeiPhonePanel extends RenZhengXunLeiPhonePanelUI
   {
       
      
      public function RenZhengXunLeiPhonePanel()
      {
         super();
         this.switchEvents(true);
      }
      
      private function switchEvents(param1:Boolean) : void
      {
         if(param1)
         {
         }
      }
      
      public function init() : void
      {
         this.txt_tip0.text = LocaleMgr.ins.getStr(60765001);
         this.txt_tip1.text = LocaleMgr.ins.getStr(60765002);
         this.txt_checkCodeLab.text = LocaleMgr.ins.getStr(60760004);
         this.txt_checkCodePrompt.text = LocaleMgr.ins.getStr(60760007);
         this.txt_checkCodeInput.text = "";
         this.txt_checkCodeInput.maxChars = 30;
         this.parts.push(new TextPromptBind(this.txt_checkCodeInput.textField,this.txt_checkCodePrompt));
         this.btn_phone.label = LocaleMgr.ins.getStr(60765005);
         this.btn_get.label = LocaleMgr.ins.getStr(41300099);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      private function btn_handler(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(this.btn_phone !== _loc3_)
         {
            if(this.btn_get === _loc3_)
            {
               _loc2_ = StringUtil.trim(this.txt_checkCodeInput.text);
               if(_loc2_)
               {
                  server_activateCode(_loc2_);
               }
               else
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(999000453));
               }
            }
         }
         else
         {
            URLUtils.openWindow("http://t.cn/RU7Ifei");
         }
      }
      
      public function server_activateCode(param1:String) : void
      {
         var _loc2_:ActivateCodeReq = new ActivateCodeReq();
         _loc2_.code = param1;
         ServerEngine.ins.send(7405,_loc2_,server_activateCode_cpl);
      }
      
      private function server_activateCode_cpl(param1:ActivateCodeRes, param2:ServerEvent) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         var _loc5_:int = param1.rewards.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1.rewards[_loc6_];
            _loc3_.push(WealthUtil.rewardToVo(_loc4_));
            _loc6_++;
         }
         ModuleMgr.ins.closeModule(60765);
         FloatUtil.showGetItemsDisplayPanel(_loc3_,null,null,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
