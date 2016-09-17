package nslm2.modules.footstones.alerts
{
   import flash.geom.Point;
   
   public class AlertMsgVo
   {
      
      public static const GROUP_DEFAULT:int = 0;
      
      public static const GROUP_VLAUE_FLOAT_EFF:int = 1;
      
      public static const GROUP_SYS_NOTICE:int = 2;
      
      public static const GROUP_PROGRESS_BAR_ADD:int = 21;
      
      public static const GROUP_NO_CHANGEY_15:int = 15;
      
      public static const GROUP_PLAYER_HEADER_STIMANA:int = 16;
      
      public static const FLOAT_MSG_AT:String = "floatMsgAt";
      
      public static const FLOAT_MSG_CENTER:String = "floatMsgCenter";
      
      public static const FLOAT_MSG_BOTTOM:String = "floatMsgBottom";
      
      public static const SIMPLE_ALERT:String = "simpleAlert";
      
      public static const SIMPLE_CONFIRM:String = "simpleConfirm";
      
      public static const ALERT_TOP:String = "alertTop";
      
      public static const CONFIRM_TOP:String = "confirmTop";
      
      public static const CHANGE_CONTENT_ARENA:String = "changeContentArena";
      
      public static const CHANGE_CONTENT_STAMINA:String = "changeContentStamina";
      
      public static const CHANGE_CONTENT_TIMES:String = "changeContent";
      
      public static const CHANGE_TITLE:String = "changeTitle";
       
      
      public var type:String;
      
      public var content;
      
      public var handler;
      
      public var handlerOther;
      
      public var showGlobalPoi:Point;
      
      public var toGlobalPoi:Point;
      
      public var scaleX:Number;
      
      public var scaleY:Number;
      
      public var group:int;
      
      public var noShowKey:String;
      
      public var noShowKey2:int;
      
      public var confirmStr:String;
      
      public var cancelStr:String;
      
      public var closeFlg:Boolean;
      
      public var vipHint:int;
      
      public var floatChangeY:int = -1;
      
      public var useBg:Boolean = true;
      
      public function AlertMsgVo(param1:*, param2:* = null, param3:* = null, param4:Point = null, param5:int = 0, param6:Point = null, param7:Number = 1, param8:Number = 1, param9:Boolean = true, param10:int = -1)
      {
         super();
         this.content = param1;
         this.handler = param2;
         this.handlerOther = param3;
         this.showGlobalPoi = param4;
         this.floatChangeY = param5;
         this.toGlobalPoi = param6;
         this.scaleX = param7;
         this.scaleY = param8;
         this.closeFlg = param9;
         this.vipHint = param10;
      }
      
      public function setCloseFlg(param1:Boolean) : AlertMsgVo
      {
         this.closeFlg = param1;
         return this;
      }
      
      public function setGroup(param1:int = 0) : AlertMsgVo
      {
         this.group = param1;
         return this;
      }
      
      public function setNoShowKey(param1:String) : AlertMsgVo
      {
         this.noShowKey = param1;
         return this;
      }
      
      public function setNoShowKey2(param1:int) : AlertMsgVo
      {
         this.noShowKey2 = param1;
         return this;
      }
      
      public function setConfirmStr(param1:String) : AlertMsgVo
      {
         this.confirmStr = param1;
         return this;
      }
      
      public function setCancelStr(param1:String) : AlertMsgVo
      {
         this.cancelStr = param1;
         return this;
      }
      
      public function setVipHint(param1:int) : AlertMsgVo
      {
         this.vipHint = param1;
         return this;
      }
      
      public function set_floatChangeY(param1:int) : AlertMsgVo
      {
         this.floatChangeY = param1;
         return this;
      }
      
      public function set_useBg(param1:Boolean) : AlertMsgVo
      {
         this.useBg = param1;
         return this;
      }
   }
}
