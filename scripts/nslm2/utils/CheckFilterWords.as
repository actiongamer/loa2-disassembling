package nslm2.utils
{
   import flash.utils.Dictionary;
   import com.mz.core.logging.Log;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSensitiveWordVo;
   
   public class CheckFilterWords
   {
      
      public static const TYPE_CHAT:String = "typeChat";
      
      public static const TYPE_BUGLE:String = "typeBugle";
      
      public static const TYPE_NICKNAME:String = "typeNickname";
      
      private static var _ins:nslm2.utils.CheckFilterWords;
       
      
      private var ChatList:Dictionary;
      
      private var escChars:Array;
      
      private var dirtyWordArray:Dictionary;
      
      public function CheckFilterWords()
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super();
         ChatList = new Dictionary();
         var _loc1_:Array = StcMgr.ins.getSensitiveWordTable().array;
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc5_];
            _loc3_ = __replaceRegExpKeywords(_loc2_.word);
            ChatList[_loc3_] = _loc2_.word.replace(/./g,"*");
            _loc5_++;
         }
         escChars = [];
         escChars["<"] = "&lt;";
         escChars[">"] = "&gt;";
         escChars["\'"] = "&apos;";
         escChars["\""] = "&quot;";
         escChars["&"] = "&amp;";
         dirtyWordArray = ChatList;
      }
      
      public static function get ins() : nslm2.utils.CheckFilterWords
      {
         if(_ins == null)
         {
            _ins = new nslm2.utils.CheckFilterWords();
         }
         return _ins;
      }
      
      public function filterWord_bak(param1:String) : String
      {
         return param1;
      }
      
      public function filter(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = this.dirtyWordArray;
         for(var _loc2_ in this.dirtyWordArray)
         {
            _loc4_ = param1;
            param1 = param1.replace(new RegExp(_loc2_,"g"),dirtyWordArray[_loc2_]);
            if(_loc4_ != param1)
            {
               Log.debug(this,"is not equip",_loc4_,param1,_loc2_,dirtyWordArray[_loc2_]);
            }
         }
         return param1;
      }
      
      private function __replaceRegExpKeywords(param1:String) : String
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Array = [".","*","+","?","(",")","[","]","|"];
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = "\\" + _loc3_[_loc5_];
            param1 = param1.replace(new RegExp(_loc2_,"g"),_loc2_);
            _loc5_++;
         }
         return param1;
      }
   }
}
