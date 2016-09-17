package nslm2.mgrs.stcMgrs
{
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import morn.core.utils.StringUtils;
   import com.mz.core.logging.Log;
   
   public class StcCheck
   {
       
      
      public function StcCheck()
      {
         super();
      }
      
      public function check() : void
      {
         this.checkStcModel();
      }
      
      public function checkStcModel() : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc1_:Array = StcMgr.ins.getModelTable().array;
         var _loc3_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _loc1_[_loc5_];
            if(StringUtils.isNull(_loc4_.extra))
            {
               try
               {
                  _loc2_ = JSON.parse(_loc4_.extra);
               }
               catch($err:Error)
               {
                  Log.warn(this,"static_model","extra json解析错误",_loc4_.id);
               }
            }
            _loc5_++;
         }
      }
   }
}
