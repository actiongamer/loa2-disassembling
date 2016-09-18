package morn.core.utils
{
   import morn.core.handlers.Handler;
   import com.greensock.TweenLite;
   import morn.core.handlers.HandlerList;
   import com.mz.core.errors.ArgClassError;
   
   public function DelayCall(param1:*, param2:Number = 1, param3:Boolean = true) : void
   {
      var _loc4_:int = 0;
      if(param1 is Handler)
      {
         TweenLite.delayedCall(param2,(param1 as Handler).method,(param1 as Handler).args,param3);
      }
      else if(param1 is Function)
      {
         TweenLite.delayedCall(param2,param1,null,param3);
      }
      else if(param1 is HandlerList)
      {
         TweenLite.delayedCall(param2,(param1 as HandlerList).apply,null,param3);
      }
      else
      {
         throw new ArgClassError(param1,[Function,Handler,HandlerList]);
      }
   }
}
