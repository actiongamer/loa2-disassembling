package nslm2.modules.footstones.alerts
{
   import morn.customs.components.TopModuleView;
   import morn.core.components.Label;
   import nslm2.modules.foundations.alerts.views.SimpleStrMsg;
   import flash.geom.Point;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import com.mz.core.utils.ArrayUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class FloadMsgModule extends TopModuleView
   {
       
      
      private var ui:Label;
      
      private var msgLib:Object;
      
      public function FloadMsgModule()
      {
         msgLib = {};
         super();
         this.mouseEvent = false;
         MornExpandUtil.setLayout(this);
      }
      
      private function getMsgList(param1:String, param2:int) : Array
      {
         if(msgLib.hasOwnProperty(param1) == false)
         {
            msgLib[param1] = [];
         }
         if(msgLib[param1].hasOwnProperty(param2) == false)
         {
            msgLib[param1][param2] = [];
         }
         return msgLib[param1][param2];
      }
      
      private function getLastMsg(param1:String, param2:int) : SimpleStrMsg
      {
         var _loc3_:Array = getMsgList(param1,param2);
         return _loc3_[_loc3_.length - 1];
      }
      
      override public function getFocusNotices() : Array
      {
         return ["floatMsgAt","floatMsgCenter","floatMsgBottom","simpleAlert","alertTop","simpleConfirm"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:Boolean = false;
         var _loc6_:Boolean = false;
         _loc3_ = param2 as AlertMsgVo;
         var _loc8_:* = param1;
         if("floatMsgAt" !== _loc8_)
         {
            if("floatMsgCenter" !== _loc8_)
            {
               if("floatMsgBottom" !== _loc8_)
               {
                  if("simpleAlert" !== _loc8_)
                  {
                     if("simpleConfirm" !== _loc8_)
                     {
                        if("alertTop" === _loc8_)
                        {
                           _loc3_.type = param1;
                           if(_loc3_.noShowKey || _loc3_.noShowKey2)
                           {
                              if(_loc3_.noShowKey)
                              {
                                 _loc4_ = LocalData.insCurPlayer.load("NO_SHOW_KEY_" + _loc3_.noShowKey,false);
                              }
                              else
                              {
                                 _loc6_ = SettingModel.ins.getHintById(10900052 + _loc3_.noShowKey2);
                              }
                              if(_loc4_ || !_loc6_)
                              {
                                 if(_loc3_.handler)
                                 {
                                    Handler.execute(_loc3_.handler);
                                 }
                              }
                              else
                              {
                                 this.preShowCpl();
                              }
                           }
                           ModuleMgr.ins.closeModule(10102);
                           ModuleMgr.ins.showModule(10102,_loc3_);
                        }
                     }
                  }
                  _loc3_.type = param1;
                  if(_loc3_.noShowKey || _loc3_.noShowKey2)
                  {
                     if(_loc3_.noShowKey)
                     {
                        _loc4_ = LocalData.insCurPlayer.load("NO_SHOW_KEY_" + _loc3_.noShowKey,false);
                     }
                     else
                     {
                        _loc6_ = SettingModel.ins.getHintById(10900052 + _loc3_.noShowKey2);
                     }
                     if(_loc4_)
                     {
                        if(_loc3_.handler)
                        {
                           Handler.execute(_loc3_.handler);
                        }
                     }
                     else
                     {
                        this.preShowCpl();
                     }
                  }
                  ModuleMgr.ins.closeModule(10100);
                  ModuleMgr.ins.showModule(10100,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
               }
               else
               {
                  _loc5_ = new SimpleStrMsg(_loc3_);
                  _loc5_.centerX = 0;
                  _loc5_.y = this.height - 200;
                  _loc5_.scaleX = _loc3_.scaleX;
                  _loc5_.scaleY = _loc3_.scaleY;
                  this.addChild(_loc5_);
                  addMsg(param1,_loc5_);
               }
            }
            else
            {
               _loc5_ = new SimpleStrMsg(_loc3_);
               _loc5_.centerX = 0;
               _loc5_.y = this.height / 2;
               _loc5_.scaleX = _loc3_.scaleX;
               _loc5_.scaleY = _loc3_.scaleY;
               this.addChild(_loc5_);
               addMsg(param1,_loc5_);
            }
         }
         else
         {
            _loc5_ = new SimpleStrMsg(_loc3_);
            _loc7_ = this.globalToLocal(_loc3_.showGlobalPoi);
            _loc5_.x = _loc7_.x;
            _loc5_.y = _loc7_.y;
            _loc5_.scaleX = _loc3_.scaleX;
            _loc5_.scaleY = _loc3_.scaleY;
            _loc5_.x = _loc5_.x - _loc5_.width / 2;
            this.addChild(_loc5_);
            addMsg(param1,_loc5_);
         }
      }
      
      private function addMsg(param1:String, param2:SimpleStrMsg) : void
      {
         var _loc3_:SimpleStrMsg = this.getLastMsg(param1,param2.vo.group);
         param2.float_type = param1;
         if(_loc3_ && _loc3_.isEnd == false)
         {
            if(_loc3_.y + _loc3_.height > param2.y)
            {
               _loc3_.toUp(param2.y);
            }
         }
         param2.lastMsg = _loc3_;
         this.getMsgList(param2.float_type,param2.vo.group).push(param2);
         param2.addEventListener("dispose",msg_onDispose);
         param2.fadeIn();
      }
      
      private function msg_onDispose(param1:Event) : void
      {
         var _loc2_:SimpleStrMsg = param1.currentTarget as SimpleStrMsg;
         _loc2_.removeEventListener("dispose",msg_onDispose);
         ArrayUtil.removeItem(this.getMsgList(_loc2_.float_type,_loc2_.vo.group),_loc2_);
      }
   }
}
