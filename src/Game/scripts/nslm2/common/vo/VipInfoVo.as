package nslm2.common.vo
{
   import nslm2.utils.ServerTimer;
   import nslm2.utils.TimeUtils;
   import com.mz.core.logging.Log;
   
   public class VipInfoVo
   {
       
      
      public var qqVip:int = 0;
      
      public var isQQVip:Boolean = false;
      
      public var isQQYear:Boolean = false;
      
      public var isQQLux:Boolean = false;
      
      public var vipValid:uint;
      
      public function VipInfoVo()
      {
         super();
      }
      
      public function get curQQVip() : int
      {
         if(isQQVip)
         {
            return qqVip;
         }
         return 0;
      }
      
      public function equal(param1:VipInfoVo) : Boolean
      {
         if(qqVip != param1.qqVip)
         {
            return false;
         }
         if(isQQVip != param1.isQQVip)
         {
            return false;
         }
         if(isQQYear != param1.isQQYear)
         {
            return false;
         }
         if(isQQLux != param1.isQQLux)
         {
            return false;
         }
         if(vipValid != param1.vipValid)
         {
            return false;
         }
         return true;
      }
      
      public function clone() : VipInfoVo
      {
         var _loc1_:VipInfoVo = new VipInfoVo();
         _loc1_.qqVip = this.qqVip;
         _loc1_.isQQVip = this.isQQVip;
         _loc1_.isQQYear = this.isQQYear;
         _loc1_.isQQLux = this.isQQLux;
         _loc1_.vipValid = this.vipValid;
         return _loc1_;
      }
      
      public function get needShowValid() : Boolean
      {
         var _loc1_:uint = ServerTimer.ins.second;
         var _loc2_:uint = this.vipValid - TimeUtils.countDayToSecond(3);
         var _loc3_:uint = this.vipValid + TimeUtils.countDayToSecond(3);
         Log.info(this,"needShowValid",_loc1_,vipValid,_loc2_,_loc3_);
         if(_loc1_ >= _loc2_ && _loc1_ <= _loc3_)
         {
            return true;
         }
         return false;
      }
   }
}
