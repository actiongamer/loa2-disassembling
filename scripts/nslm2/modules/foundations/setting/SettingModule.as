package nslm2.modules.foundations.setting
{
   import game.ui.settingModule.settingModuleUI;
   import morn.core.components.ViewStack;
   import morn.core.components.Button;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import nslm2.modules.foundations.setting.service.SettingService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.SystemSettingData;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.setting.view.GraphicQualityView;
   import nslm2.modules.foundations.setting.view.SoundQualityView;
   import nslm2.modules.foundations.setting.view.FunctionSettingView;
   import morn.customs.expands.MornExpandUtil;
   
   public class SettingModule extends settingModuleUI
   {
      
      public static const USER_SETTING:String = "User_SETTING";
       
      
      private var vs:ViewStack;
      
      private var prevSetting:Array;
      
      public function SettingModule()
      {
         super();
         prevSetting = SettingModel.ins.getAllSettings().concat();
         tabBar.labels = LocaleMgr.ins.getStr(10900001) + "," + LocaleMgr.ins.getStr(10900002);
         defaultSetting.label = LocaleMgr.ins.getStr(10900030);
         saveSetting.label = LocaleMgr.ins.getStr(10900031);
         this.panelBg.titleImgId = 10900000 - 9100000;
         vs = new ViewStack();
         vs.x = 36;
         vs.y = 86;
         addChild(vs);
         vs.subViewClasses = [GraphicQualityView,SoundQualityView,FunctionSettingView];
         vs.selectedIndex = 0;
         tabBar.selectHandler = selectHandler;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
      }
      
      private function selectHandler(param1:int) : void
      {
         vs.selectedIndex = tabBar.selectedIndex;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc8_:* = param1;
         if(saveSetting !== _loc8_)
         {
            if(defaultSetting === _loc8_)
            {
               _loc8_ = 0;
               var _loc7_:* = vs.items;
               for each(var _loc3_ in vs.items)
               {
                  _loc3_.resetSetting(SettingModel.ins.defaultSetting);
               }
               SettingModel.ins.setAllSettings(SettingModel.ins.defaultSetting,true);
               _loc5_ = SettingModel.ins.defaultSetting;
               _loc4_ = 0;
               while(_loc4_ < SettingModel.ins.getAllSettings().length)
               {
                  _loc2_.push(createSystemData(7 + _loc4_,_loc5_[_loc4_]));
                  _loc4_++;
               }
               SettingService.ins.saveAll(_loc2_);
               AlertUtil.float(LocaleMgr.ins.getStr(10900035));
            }
         }
         else
         {
            _loc5_ = SettingModel.ins.getAllSettings();
            prevSetting = _loc5_;
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc2_.push(createSystemData(7 + _loc6_,_loc5_[_loc6_]));
               _loc6_++;
            }
            SettingService.ins.saveAll(_loc2_);
            AlertUtil.float(LocaleMgr.ins.getStr(10900034));
         }
      }
      
      private function createSystemData(param1:int, param2:String) : SystemSettingData
      {
         var _loc3_:SystemSettingData = new SystemSettingData();
         _loc3_.id = param1;
         _loc3_.s = param2;
         return _loc3_;
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(!compareSetting(prevSetting,SettingModel.ins.getAllSettings()))
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(10900032),saveHandlerYes,saveHanderNo);
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function compareSetting(param1:Array, param2:Array) : Boolean
      {
         var _loc5_:int = 0;
         if(param1 == param2)
         {
            return true;
         }
         var _loc4_:int = param1.length;
         var _loc3_:int = param1.length;
         if(_loc4_ != _loc3_)
         {
            return false;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            if(param1[_loc5_] != param2[_loc5_])
            {
               return false;
            }
            _loc5_++;
         }
         return true;
      }
      
      protected function saveHandlerYes() : void
      {
         SettingModel.ins.setAllSettings(prevSetting,true);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      protected function saveHanderNo() : void
      {
      }
   }
}
