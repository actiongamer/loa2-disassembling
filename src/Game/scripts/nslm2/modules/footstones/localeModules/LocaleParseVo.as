package nslm2.modules.footstones.localeModules
{
   import morn.core.utils.NumberUtil;
   
   public class LocaleParseVo
   {
      
      public static const ARR:String = "arr";
      
      public static const STYLE:String = "style";
      
      public static const INDEX:String = "index";
      
      public static const WEALTHVO:String = "wealthVo";
       
      
      public var oriStr1:String;
      
      public var index:int = -1;
      
      public var style:int = 0;
      
      public var key:String;
      
      public var param:String;
      
      private var _paramArr:Array;
      
      public function LocaleParseVo(param1:String)
      {
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         super();
         this.oriStr1 = param1;
         var _loc5_:String = param1.substring(2,param1.length - 1);
         var _loc9_:Array = _loc5_.split("|");
         var _loc7_:int = _loc9_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_ = _loc9_[_loc8_];
            _loc2_ = _loc4_.indexOf(":");
            if(_loc2_ == -1)
            {
               _loc2_ = _loc4_.length;
            }
            _loc6_ = _loc4_.substr(0,_loc2_);
            if(NumberUtil.isNumber(_loc6_) && _loc2_ == _loc4_.length)
            {
               this.index = int(_loc6_);
            }
            else
            {
               _loc3_ = _loc4_.split(":");
               var _loc10_:* = _loc3_[0];
               if("index" !== _loc10_)
               {
                  if("style" !== _loc10_)
                  {
                     if("arr" !== _loc10_)
                     {
                        this.key = _loc6_;
                        this.param = _loc4_.substr(_loc2_ + 1,_loc4_.length);
                     }
                     else
                     {
                        this.key = "arr";
                        this.param = _loc4_.substr(_loc2_ + 1,_loc4_.length);
                     }
                  }
                  else
                  {
                     this.style = _loc3_[1];
                  }
               }
               else
               {
                  this.index = _loc3_[1];
               }
            }
            _loc8_++;
         }
      }
      
      public function get paramArr() : Array
      {
         if(_paramArr == null)
         {
            _paramArr = param.split(":");
         }
         return _paramArr;
      }
   }
}
