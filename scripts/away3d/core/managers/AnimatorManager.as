package away3d.core.managers
{
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.utils.getTimer;
   import org.specter3d.context.AppGlobalContext;
   import com.mz.core.logging.Log;
   
   public class AnimatorManager
   {
       
      
      private var _broadcaster:Sprite;
      
      private var animatorList:Dictionary;
      
      private var _isRendering:Boolean;
      
      private var _time:int;
      
      private var _delta_time:int;
      
      public function AnimatorManager(param1:Boolean = false)
      {
         _broadcaster = new Sprite();
         super();
         _time = getTimer();
         _isRendering = param1;
         animatorList = new Dictionary();
         if(!_broadcaster.hasEventListener("enterFrame"))
         {
            _broadcaster.addEventListener("enterFrame",onEnterFrame);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc3_:int = getTimer();
         _delta_time = _loc3_ - _time;
         var _loc5_:int = 0;
         var _loc4_:* = animatorList;
         for each(var _loc2_ in animatorList)
         {
            _loc2_.update(_loc3_,_delta_time);
         }
         _isRendering && AppGlobalContext.hasParseFrameLimited && AppGlobalContext.stage3d.startRendering();
         _time = _loc3_;
      }
      
      public function register(param1:IAnimatorUpdate) : void
      {
         if(param1)
         {
            animatorList[param1] = param1;
         }
      }
      
      public function unregister(param1:IAnimatorUpdate) : void
      {
         animatorList[param1] = null;
      }
      
      public function get deltaTime() : int
      {
         return _delta_time;
      }
      
      public function clearAll() : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = undefined;
         var _loc1_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = animatorList;
         for(var _loc4_ in animatorList)
         {
            _loc1_.push(_loc4_);
         }
         var _loc3_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = _loc1_[_loc5_];
            animatorList[_loc2_] = null;
            delete animatorList[_loc2_];
            if(_loc2_.hasOwnProperty("dispose") && (_loc2_["dispose"] as Function).length == 0)
            {
               try
               {
                  _loc2_["dispose"]();
               }
               catch(err:Error)
               {
                  Log.warn(this,"dispose报错",_loc2_);
               }
            }
            else
            {
               Log.warn(this,"无法dispose的对象",_loc2_);
            }
            _loc5_++;
         }
      }
   }
}
