package nslm2.common.ctrls
{
   import morn.core.utils.ObjectUtils;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   
   public class TSM
   {
      
      public static const S0:int = 0;
      
      public static const S1:int = 1;
      
      public static const S2:int = 2;
      
      public static const S3:int = 3;
      
      public static const S4:int = 4;
      
      public static const S5:int = 5;
      
      public static const S404:int = 404;
      
      public static const SHOW:int = 33;
      
      public static const HIDE:int = 44;
       
      
      public var target;
      
      public var stateLib:Object;
      
      public var defaultDuration:Number;
      
      public var copyAllVars:Boolean;
      
      public var defaultEase;
      
      public function TSM(param1:*, param2:Number, param3:Boolean = true)
      {
         stateLib = {};
         super();
         target = param1;
         defaultDuration = param2;
         copyAllVars = param3;
      }
      
      public function set_defaultEase(param1:*) : TSM
      {
         this.defaultEase = param1;
         return this;
      }
      
      public function addState(param1:*, param2:Object) : TSM
      {
         var _loc4_:* = null;
         if(stateLib[0] == null)
         {
            stateLib[0] = {};
         }
         var _loc7_:int = 0;
         var _loc6_:* = param2;
         for(var _loc5_ in param2)
         {
            stateLib[0][_loc5_] = target[_loc5_];
         }
         if(copyAllVars)
         {
            _loc4_ = stateLib[0];
            var _loc9_:int = 0;
            var _loc8_:* = stateLib;
            for each(var _loc3_ in stateLib)
            {
               if(_loc3_ != _loc4_)
               {
                  _copyVars(_loc4_,_loc3_);
               }
            }
         }
         stateLib[param1] = param2;
         return this;
      }
      
      public function copyState(param1:*, param2:* = 0) : TSM
      {
         var _loc3_:Object = {};
         _copyVars(stateLib[param2],_loc3_);
         stateLib[param1] = _loc3_;
         return this;
      }
      
      private function _copyVars(param1:Object, param2:Object) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            if(param2.hasOwnProperty(_loc3_) == false)
            {
               param2[_loc3_] = param1[_loc3_];
            }
         }
      }
      
      public function toState(param1:* = 0, param2:Number = NaN, param3:Object = null, param4:* = null) : void
      {
         var _loc5_:* = null;
         if(isNaN(param2))
         {
            param2 = this.defaultDuration;
         }
         _loc5_ = ObjectUtils.clone(this.stateLib[param1]);
         if(param3)
         {
            _copyVars(param3,_loc5_);
         }
         if(this.defaultEase && _loc5_.hasOwnProperty("ease") == false)
         {
            _loc5_["ease"] = this.defaultEase;
         }
         _loc5_["onComplete"] = toStateCpl;
         _loc5_["onCompleteParams"] = [param1,param2,param3,param4];
         TweenLite.to(target,param2,_loc5_);
      }
      
      private function toStateCpl(param1:* = 0, param2:Number = NaN, param3:Object = null, param4:* = null) : void
      {
         if(param4 != null)
         {
            Handler.execute(param4,[param1,param2,param3]);
         }
      }
   }
}
