package nslm2.modules.footstones.resGetPoints
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.StcLackFieldValueFatal;
   import nslm2.common.vo.WealthVo;
   
   public class ResGetPointModuleParam
   {
      
      public static const PRE_ID_WEALTH:int = 1000;
       
      
      private var _lessId:int;
      
      public var errMsgLanCode:int;
      
      public var errMsg:String;
      
      public var wealthKind:int;
      
      public var sid:int;
      
      public var needNum:int;
      
      public var iconUrl:String;
      
      public var quality:int;
      
      public var name:String;
      
      public var count:int;
      
      public var need:int;
      
      public var clickHandler;
      
      public function ResGetPointModuleParam()
      {
         super();
      }
      
      public function get lessId() : int
      {
         var _loc1_:int = 0;
         if(_lessId)
         {
            return _lessId;
         }
         if(wealthKind == 20)
         {
            _loc1_ = StcMgr.ins.getItemVo(sid).get_point;
            if(_loc1_ == 0)
            {
               new StcLackFieldValueFatal(this,"static_item","get_point",sid);
            }
            return _loc1_;
         }
         return 1000 + wealthKind;
      }
      
      public function initBySpecial(param1:String, param2:int, param3:String, param4:int, param5:int, param6:*) : ResGetPointModuleParam
      {
         this.iconUrl = param1;
         this.quality = param2;
         this.name = param3;
         this.count = param4;
         this.need = param5;
         this.clickHandler = param6;
         return this;
      }
      
      public function initByLessId(param1:int) : ResGetPointModuleParam
      {
         _lessId = param1;
         return this;
      }
      
      public function initByWealthVo(param1:WealthVo) : ResGetPointModuleParam
      {
         wealthKind = param1.kind;
         sid = param1.sid;
         needNum = param1.count;
         return this;
      }
      
      public function initByWealth(param1:int, param2:int = 0, param3:int = 0) : ResGetPointModuleParam
      {
         wealthKind = param1;
         sid = param2;
         needNum = param3;
         return this;
      }
   }
}
