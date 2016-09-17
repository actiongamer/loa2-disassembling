package nslm2.mgrs.uiFades
{
   import com.mz.core.logging.Log;
   import com.greensock.easing.Back;
   import com.greensock.easing.Bounce;
   import com.greensock.easing.Circ;
   import com.greensock.easing.Cubic;
   import com.greensock.easing.Elastic;
   import com.greensock.easing.Expo;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quad;
   import com.greensock.easing.Quart;
   import com.greensock.easing.Quint;
   import com.greensock.easing.Sine;
   import com.greensock.easing.SlowMo;
   
   public class TweenEaseConsts
   {
      
      private static var easeLib:Object;
       
      
      public function TweenEaseConsts()
      {
         super();
      }
      
      public static function getEaseByStr(param1:String) : *
      {
         if(param1.indexOf(".") == -1)
         {
            Log.fatal(TweenEaseConsts,"错误的缓动名称",param1);
            return null;
         }
         if(easeLib == null)
         {
            easeLib = {};
            easeLib["Back"] = Back;
            easeLib["Bounce"] = Bounce;
            easeLib["Circ"] = Circ;
            easeLib["Cubic"] = Cubic;
            easeLib["Elastic"] = Elastic;
            easeLib["Expo"] = Expo;
            easeLib["Linear"] = Linear;
            easeLib["Quad"] = Quad;
            easeLib["Quart"] = Quart;
            easeLib["Quint"] = Quint;
            easeLib["Sine"] = Sine;
            easeLib["SlowMo"] = SlowMo;
         }
         var _loc2_:Array = param1.split(".");
         if(easeLib.hasOwnProperty(_loc2_[0]) == false || easeLib[_loc2_[0]].hasOwnProperty(_loc2_[1]) == false)
         {
            Log.fatal(TweenEaseConsts,"错误的缓动名称",param1);
            Log.fatal(TweenEaseConsts,"错误的缓动名称",param1);
            return null;
         }
         return easeLib[_loc2_[0]][_loc2_[1]];
      }
   }
}
