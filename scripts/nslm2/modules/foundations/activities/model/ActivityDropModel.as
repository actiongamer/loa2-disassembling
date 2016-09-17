package nslm2.modules.foundations.activities.model
{
   import com.mz.core.utils.DictHash;
   import proto.ActivityDropStaticNotify;
   import proto.ActivityDropStaticInfo;
   import proto.ActivityDropStaticInfo.DropInfo;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.WealthUtil;
   
   public class ActivityDropModel
   {
      
      private static var _ins:nslm2.modules.foundations.activities.model.ActivityDropModel;
       
      
      public var dropDict:DictHash;
      
      public function ActivityDropModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.activities.model.ActivityDropModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.activities.model.ActivityDropModel();
         }
         return _ins;
      }
      
      public function parseDropStaticNotify(param1:ActivityDropStaticNotify) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         dropDict = new DictHash();
         if(param1)
         {
            _loc3_ = param1.info.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = param1.info[_loc4_] as ActivityDropStaticInfo;
               dropDict.put(_loc2_.moduleId,_loc2_);
               _loc4_++;
            }
         }
      }
      
      public function getActivityDropWealthArray(param1:int) : Array
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc8_:* = null;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:ActivityDropStaticInfo = dropDict.getValue(param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.info.length;
            _loc9_ = 0;
            while(_loc9_ < _loc4_)
            {
               _loc8_ = _loc3_.info[_loc9_] as DropInfo;
               _loc6_ = _loc8_.starttm;
               _loc2_ = _loc8_.endtm;
               _loc5_ = ServerTimer.ins.second;
               if(_loc5_ >= _loc6_ && _loc5_ <= _loc2_)
               {
                  _loc7_ = _loc8_.dropId;
               }
               _loc9_++;
            }
         }
         if(_loc7_ != 0)
         {
            return WealthUtil.dropGroupIDToWealthVoArr(_loc7_);
         }
         return [];
      }
   }
}
