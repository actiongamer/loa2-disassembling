package nslm2.modules.logModules
{
   import game.ui.logModules.LogViewUI;
   import morn.core.components.CheckBox;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import flash.system.System;
   import com.mz.core.utils.LocalData;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import com.mz.core.logging.LogConsts;
   import flash.text.TextFormat;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class LogView extends LogViewUI
   {
      
      public static const LOAC_FILTER_KEYS:String = "LogView.LOAC_FILTER_KEYS";
      
      public static const LOACL_UPLOW:String = "LogView.LOACL_UPLOW";
      
      public static const LOACL_ONLYCLASS:String = "LogView.LOACL_ONLYCLASS";
      
      public static const LOACL_SCROLL_LOCK:String = "LogView.LOACL_SCROLL_LOCK";
       
      
      private var logKindCbArr:Vector.<CheckBox>;
      
      public var LCAPPENDER:String;
      
      private var logLevelArr:Vector.<int>;
      
      private var logArr:Array;
      
      private var colorLib:Object;
      
      private var logShowCount:int = 0;
      
      private var filterKeyArr:Array;
      
      private var _paused:Boolean;
      
      public function LogView()
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         logKindCbArr = new Vector.<CheckBox>();
         logLevelArr = new Vector.<int>();
         logArr = [];
         colorLib = {};
         filterKeyArr = [];
         super();
         LCAPPENDER = ReflectUtil.getShortClassName(LCAppender);
         var _loc3_:int = 5;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            _loc2_ = new CheckBox("png.comp.checkbox");
            _loc2_.x = this.cb_upLow.x + 85 + _loc4_ * 60;
            switch(int(_loc4_))
            {
               case 0:
                  _loc1_ = 1;
                  break;
               case 1:
                  _loc1_ = 2;
                  break;
               case 2:
                  _loc1_ = 4;
                  break;
               case 3:
                  _loc1_ = 8;
                  break;
               case 4:
                  _loc1_ = 16;
            }
            logLevelArr.push(_loc1_);
            _loc2_.tag = _loc1_;
            _loc2_.label = LogConsts.levelToString(_loc1_);
            _loc2_.selected = true;
            _loc2_.clickHandler = logKindCb_handler;
            this.addChildAt(_loc2_,0);
            logKindCbArr.push(_loc2_);
            _loc4_--;
         }
         this.txt_log.text = "";
         this.txt_log.isHtml = false;
         this.txt_log.scrollBar.dragContentEnabled = false;
         this.txt_count.text = "0/0";
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_filterKey.textField.addEventListener("change",txt_filterKey_onChange);
         this.txt_filterKey.text = LocalData.insTools.load("LogView.LOAC_FILTER_KEYS","");
         this.cb_onlyClass.selected = LocalData.insTools.load("LogView.LOACL_ONLYCLASS",false);
         this.cb_upLow.selected = LocalData.insTools.load("LogView.LOACL_UPLOW",false);
         this.cb_scrollLock.selected = LocalData.insTools.load("LogView.LOACL_SCROLL_LOCK",false);
         this.resetFilterKeyArr();
      }
      
      private function logKindCb_handler(param1:CheckBox) : void
      {
         if(param1.selected)
         {
            if(logLevelArr.indexOf(param1.tag as int) == -1)
            {
               logLevelArr.push(param1.tag);
            }
         }
         else
         {
            ArrayUtil.removeItem(this.logLevelArr,param1.tag as int);
         }
         this.refresh();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_clearSearch !== _loc3_)
         {
            if(this.btn_clear !== _loc3_)
            {
               if(this.cb_onlyClass !== _loc3_)
               {
                  if(this.cb_upLow !== _loc3_)
                  {
                     if(this.btn_pause !== _loc3_)
                     {
                        if(this.cb_scrollLock === _loc3_)
                        {
                           LocalData.insTools.save("LogView.LOACL_SCROLL_LOCK",cb_scrollLock.selected);
                        }
                     }
                     else if(param2.altKey)
                     {
                        System.setClipboard(this.txt_log.textField.htmlText);
                     }
                     else
                     {
                        this.paused = !this.paused;
                     }
                  }
               }
               this.resetFilterKeyArr();
            }
            else
            {
               this.logArr = [];
               this.refresh();
            }
         }
         else
         {
            this.txt_filterKey.text = "";
            resetFilterKeyArr();
         }
      }
      
      private function txt_filterKey_onChange(param1:Event) : void
      {
         TweenLite.killDelayedCallsTo(this.resetFilterKeyArr);
         TweenLite.delayedCall(1,resetFilterKeyArr,null,false);
      }
      
      private function onFilter() : void
      {
      }
      
      public function log(param1:int, param2:String, param3:Array) : void
      {
         if(this.paused)
         {
            return;
         }
         var _loc5_:int = logArr.length;
         if(_loc5_ >= 1000)
         {
            logArr.splice(0,200);
            logShowCount = logShowCount - 200;
            _loc5_ = _loc5_ - 200;
         }
         var _loc4_:LogVo = new LogVo();
         _loc4_.level = param1;
         _loc4_.className = param2;
         _loc4_.params = param3.join(" ");
         logArr.push(_loc4_);
         appendLog(_loc4_);
         if(cb_scrollLock.selected == false)
         {
            this.txt_log.scrollTo(this.txt_log.maxScrollV);
         }
         this.txt_count.text = logShowCount + "/" + (_loc5_ + 1);
      }
      
      private function getLogColor(param1:int, param2:String) : uint
      {
         if(colorLib.hasOwnProperty(param2))
         {
            return colorLib[param2];
         }
         return LogConsts.levelColor(param1);
      }
      
      private function appendLog(param1:LogVo) : void
      {
         if(filterVo(param1) == false)
         {
            return;
         }
         if(filterLogKind(param1.level) == false)
         {
            return;
         }
         var _loc2_:uint = getLogColor(param1.level,param1.className);
         var _loc3_:String = param1.params;
         this.txt_log.textField.defaultTextFormat = new TextFormat(null,null,_loc2_,false);
         this.txt_log.textField.appendText(_loc3_ + "[" + LogConsts.levelToString(param1.level) + "]" + " " + param1.className + "\n");
         logShowCount = Number(logShowCount) + 1;
      }
      
      private function filterVo(param1:LogVo) : Boolean
      {
         if(this.cb_onlyClass.selected)
         {
            return filter(param1.className);
         }
         return filter(param1.className + " " + param1.params);
      }
      
      private function resetFilterKeyArr() : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:String = this.txt_filterKey.text;
         if(cb_upLow.selected == false)
         {
            _loc4_ = _loc4_.toLowerCase();
         }
         this.filterKeyArr = [];
         var _loc1_:Array = _loc4_.split(" ");
         var _loc3_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = _loc1_[_loc5_];
            if(_loc2_)
            {
               filterKeyArr.push(_loc2_);
            }
            _loc5_++;
         }
         this.refresh();
      }
      
      private function filter(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(param1.indexOf(LCAPPENDER) == 0)
         {
            return true;
         }
         if(cb_upLow.selected == false)
         {
            param1 = param1.toLowerCase();
         }
         var _loc3_:int = filterKeyArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = filterKeyArr[_loc4_];
            if(param1.indexOf(_loc2_) == -1)
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      private function filterLogKind(param1:int) : Boolean
      {
         if(logLevelArr.indexOf(param1) > -1)
         {
            return true;
         }
         return false;
      }
      
      private function refresh() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         this.logShowCount = 0;
         this.txt_log.textField.text = "";
         var _loc2_:int = logArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = logArr[_loc3_];
            this.appendLog(_loc1_);
            _loc3_++;
         }
         if(cb_scrollLock.selected == false)
         {
            this.txt_log.scrollTo(this.txt_log.maxScrollV);
         }
         this.txt_count.text = logShowCount + "/" + _loc2_;
         LocalData.insTools.save("LogView.LOAC_FILTER_KEYS",this.txt_filterKey.text);
         LocalData.insTools.save("LogView.LOACL_ONLYCLASS",this.cb_onlyClass.selected);
         LocalData.insTools.save("LogView.LOACL_UPLOW",this.cb_upLow.selected);
      }
      
      public function get paused() : Boolean
      {
         return _paused;
      }
      
      public function set paused(param1:Boolean) : void
      {
         _paused = param1;
         this.btn_pause.label = !!_paused?"恢复":"暂停";
      }
   }
}
