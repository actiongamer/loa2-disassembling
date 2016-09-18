package morn.core.handlers
{
   import com.mz.core.errors.ArgClassError;
   
   public class Handler
   {
      
      public static const METHOD:String = "method";
      
      public static const ARGS:String = "args";
       
      
      public var method:Function;
      
      public var args:Array;
      
      public function Handler(param1:Function = null, param2:Array = null)
      {
         super();
         this.method = param1;
         this.args = param2;
      }
      
      public static function executeAndReturn(param1:*, param2:* = null) : *
      {
         var _loc3_:* = null;
         if(param1 is Function)
         {
            if(param2)
            {
               _loc3_ = param2.concat();
               return (param1 as Function).apply(null,_loc3_.splice(0,(param1 as Function).length));
            }
            return (param1 as Function).apply(null,null);
         }
         if(param1 is Handler)
         {
            return (param1 as Handler).executeWith(param2);
         }
         throw new ArgClassError(param1,[Function,Handler]);
      }
      
      public static function execute(param1:*, param2:* = null) : void
      {
         var _loc3_:* = null;
         if(param1 is Function)
         {
            if(param2)
            {
               _loc3_ = param2.concat();
               (param1 as Function).apply(null,_loc3_.splice(0,(param1 as Function).length));
            }
            else
            {
               (param1 as Function).apply(null,null);
            }
         }
         else if(param1 is Handler)
         {
            (param1 as Handler).executeWith(param2);
         }
         else if(param1 is HandlerList)
         {
            (param1 as HandlerList).apply(null,param2);
         }
         else
         {
            throw new ArgClassError(param1,[Function,Handler,HandlerList]);
         }
      }
      
      public function execute() : void
      {
         var _loc1_:* = null;
         if(args)
         {
            _loc1_ = args.concat();
            method.apply(null,_loc1_.splice(0,method.length));
         }
         else
         {
            method.apply(null,null);
         }
      }
      
      public function executeWith(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return execute();
         }
         if(method != null)
         {
            _loc2_ = !!args?args.concat(param1):param1.concat();
            method.apply(null,_loc2_.splice(0,method.length));
         }
      }
   }
}
