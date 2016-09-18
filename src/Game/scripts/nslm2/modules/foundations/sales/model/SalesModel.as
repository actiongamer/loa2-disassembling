package nslm2.modules.foundations.sales.model
{
   import proto.generalWalfareInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class SalesModel
   {
      
      private static var _ins:nslm2.modules.foundations.sales.model.SalesModel;
       
      
      public var currentvalue:int;
      
      public var maxvalue:int = 2;
      
      public var itemsArr:Array;
      
      public var lastresettime:int;
      
      public var nextresettime:int;
      
      public var alreadybuy:Array;
      
      public var allcount:int;
      
      public var alreadyget:Array;
      
      public var canrecharge:Boolean = false;
      
      public var limittime:uint;
      
      public var recharge:uint;
      
      public var getList:Array;
      
      public var cangetBenefit:Boolean;
      
      public var showHint:Boolean;
      
      public function SalesModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.sales.model.SalesModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.sales.model.SalesModel();
         }
         return _ins;
      }
      
      public function showOrHideRedPoint1() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         cangetBenefit = false;
         if(getList != null)
         {
            _loc1_ = 0;
            while(_loc1_ < getList.length)
            {
               _loc2_ = getList[_loc1_] as generalWalfareInfo;
               if(_loc2_ && _loc2_.status == 3)
               {
                  cangetBenefit = true;
                  break;
               }
               _loc1_++;
            }
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60540,cangetBenefit));
         }
         return cangetBenefit;
      }
   }
}
