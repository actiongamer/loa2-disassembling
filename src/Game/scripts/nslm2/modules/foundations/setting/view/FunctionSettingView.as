package nslm2.modules.foundations.setting.view
{
   import game.ui.settingModule.view.FunctionSettingViewUI;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import nslm2.modules.foundations.setting.vo.RefuseVo;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.mz.core.event.ChangeValueEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FunctionSettingView extends FunctionSettingViewUI
   {
       
      
      private var arr:Array;
      
      public function FunctionSettingView()
      {
         arr = [];
         super();
         refresh();
         refuseAll.label = LocaleMgr.ins.getStr(10900043);
         simpleSetting.text = LocaleMgr.ins.getStr(10900005);
         detailSetting.text = LocaleMgr.ins.getStr(10900010);
         refuseAll.addEventListener("click",onCheckClick);
         list_function.addEventListener("changeValue",onCheckClick);
      }
      
      public function resetSetting(param1:Array) : void
      {
         refresh(param1.slice(18,25));
      }
      
      public function refresh(param1:Array = null) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            param1 = SettingModel.ins.getAllFunction();
         }
         refuseAll.selected = param1[0];
         var _loc3_:int = 0;
         arr = [];
         while(_loc3_ < 6)
         {
            _loc2_ = new RefuseVo();
            _loc2_.id = 10900044 + _loc3_;
            _loc2_.selected = param1[_loc3_ + 1];
            arr.push(_loc2_);
            _loc3_++;
         }
         list_function.dataSource = arr;
      }
      
      private function onCheckClick(param1:Event) : void
      {
         var _loc2_:* = false;
         var _loc4_:SettingModel = SettingModel.ins;
         if(param1 as MouseEvent)
         {
            if(refuseAll.selected)
            {
               _loc4_.refuseAll = refuseAll.selected;
               _loc4_.refuseFriend = true;
               _loc4_.refuseStranger = true;
               _loc4_.refuseGuilt = true;
               _loc4_.refuseAllPeople = true;
               _loc4_.refusePVP = true;
               _loc4_.refuseStrangerMail = true;
               var _loc7_:* = 0;
               var _loc6_:* = arr;
               for each(var _loc5_ in arr)
               {
                  _loc5_.selected = true;
               }
            }
            else
            {
               _loc4_.refuseAll = refuseAll.selected;
               _loc4_.refuseFriend = false;
               _loc4_.refuseStranger = false;
               _loc4_.refuseGuilt = false;
               _loc4_.refuseAllPeople = false;
               _loc4_.refusePVP = false;
               _loc4_.refuseStrangerMail = false;
               var _loc9_:int = 0;
               var _loc8_:* = arr;
               for each(var _loc3_ in arr)
               {
                  _loc3_.selected = false;
               }
            }
            list_function.dataSource = arr;
         }
         else if(param1 as ChangeValueEvent)
         {
            _loc2_ = !(list_function.dataSource[ChangeValueEvent(param1).newValue] as RefuseVo).selected;
            _loc7_ = ChangeValueEvent(param1).newValue;
            if(0 !== _loc7_)
            {
               if(1 !== _loc7_)
               {
                  if(2 !== _loc7_)
                  {
                     if(3 !== _loc7_)
                     {
                        if(4 !== _loc7_)
                        {
                           if(5 === _loc7_)
                           {
                              _loc4_.refuseStrangerMail = _loc2_;
                           }
                        }
                        else
                        {
                           _loc4_.refusePVP = _loc2_;
                        }
                     }
                     else
                     {
                        _loc4_.refuseAllPeople = _loc2_;
                     }
                  }
                  else
                  {
                     _loc4_.refuseGuilt = _loc2_;
                  }
               }
               else
               {
                  _loc4_.refuseStranger = _loc2_;
               }
            }
            else
            {
               _loc4_.refuseFriend = _loc2_;
            }
            if(!_loc2_)
            {
               refuseAll.selected = false;
               _loc4_.refuseAll = refuseAll.selected;
            }
            if(_loc4_.refuseFriend && _loc4_.refuseStranger && _loc4_.refuseGuilt && _loc4_.refuseAllPeople && _loc4_.refusePVP && _loc4_.refuseStrangerMail)
            {
               refuseAll.selected = true;
               _loc4_.refuseAll = refuseAll.selected;
            }
         }
      }
   }
}
