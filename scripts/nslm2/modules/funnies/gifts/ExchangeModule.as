package nslm2.modules.funnies.gifts
{
   import game.ui.gifts.ExchangeModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
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
   
   public class ExchangeModule extends ExchangeModuleUI
   {
       
      
      public function ExchangeModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000418);
         this.parts.push(new TextPromptBind(this.txt_search.textField,this.txt_searchPrompt));
         this.txt_searchPrompt.text = LocaleMgr.ins.getStr(999000419);
         this.btn_exchange.clickHandler = this.btn_handler;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_exchange === _loc4_)
         {
            _loc3_ = StringUtil.trim(this.txt_search.text);
            if(_loc3_)
            {
               server_activateCode(_loc3_);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000419));
            }
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
         ModuleMgr.ins.closeModule(this.moduleId);
         FloatUtil.showGetItemsDisplayPanel(_loc3_,null,null,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
