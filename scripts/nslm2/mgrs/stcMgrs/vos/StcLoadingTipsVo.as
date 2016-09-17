package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class StcLoadingTipsVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_loading_tips";
       
      
      public var vipMin:int;
      
      public var vipMax:int;
      
      public var lvMin:int;
      
      public var lvMax:int;
      
      public var triggerMin:uint;
      
      public var triggerMax:uint;
      
      public var content:String;
      
      public var id:int;
      
      public var vip:String;
      
      public var lv:String;
      
      public var textid:int;
      
      public var trigger:String;
      
      public var weight:int;
      
      public function StcLoadingTipsVo()
      {
         super();
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:Array = vip.split("|");
         this.vipMin = _loc3_[0];
         this.vipMax = _loc3_[1];
         var _loc1_:Array = lv.split("|");
         this.lvMin = _loc1_[0];
         this.lvMax = _loc1_[1];
         if(StringUtils.isNull(trigger) == false)
         {
            _loc2_ = trigger.split("|");
            triggerMin = _loc2_[0];
            triggerMax = _loc2_[1];
         }
         else
         {
            triggerMin = 0;
            triggerMax = 2147483647;
         }
         this.content = LocaleMgr.ins.getStr(this.textid);
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         vip = param1[1];
         lv = param1[2];
         textid = param1[3];
         trigger = param1[4];
         weight = param1[5];
      }
   }
}
