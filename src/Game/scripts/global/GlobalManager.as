package global
{
   import com.mz.core.utils.DictHash;
   
   public class GlobalManager
   {
      
      public static var publishDic:DictHash = new DictHash();
      
      public static var mornDic:DictHash = new DictHash();
      
      public static var hasGlobalSwfDic:DictHash = new DictHash();
       
      
      public function GlobalManager()
      {
         super();
      }
      
      public static function checkPublishGolbal(param1:String) : Boolean
      {
         if(publishDic == null)
         {
            return false;
         }
         if(publishDic.containsKey(param1))
         {
            return true;
         }
         return false;
      }
      
      public static function addPublishGlobalData(param1:Array) : void
      {
         var _loc2_:StcUiPublishVo = new StcUiPublishVo();
         _loc2_.parse(param1);
         publishDic.put(_loc2_.path_3,_loc2_);
      }
      
      public static function checkMornUIGolbal(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(mornDic == null)
         {
            return param1;
         }
         if(mornDic.containsKey(param1.slice(4)))
         {
            _loc2_ = (mornDic.getValue(param1.slice(4)) as StcUiMornVo).name.split(".");
            _loc4_ = _loc2_[_loc2_.length - 1];
            _loc3_ = (mornDic.getValue(param1.slice(4)) as StcUiMornVo).path_22.split(".");
            _loc3_[0] = _loc3_[0] + "_" + App.language;
            return _loc4_ + "." + _loc3_.join(".");
         }
         return param1;
      }
      
      public static function addMornGlobalData(param1:Array) : void
      {
         var _loc3_:StcUiMornVo = new StcUiMornVo();
         _loc3_.parse(param1);
         mornDic.put(_loc3_.path_22,_loc3_);
         var _loc2_:Array = _loc3_.path_22.split(".");
         hasGlobalSwfDic.put(_loc2_[0],_loc2_[0]);
      }
      
      public static function getgameIdPath(param1:String) : String
      {
         var _loc2_:* = param1;
         if(param1 == "167")
         {
            _loc2_ = "162";
         }
         if(param1 == "186")
         {
            _loc2_ = "160";
         }
         return _loc2_;
      }
   }
}
