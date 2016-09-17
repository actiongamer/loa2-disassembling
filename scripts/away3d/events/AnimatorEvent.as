package away3d.events
{
   import flash.events.Event;
   import away3d.animators.AnimatorBase;
   
   public class AnimatorEvent extends Event
   {
      
      public static const START:String = "start";
      
      public static const STOP:String = "stop";
      
      public static const CYCLE_COMPLETE:String = "cycle_complete";
      
      public static const ANIMATOR_COMPLETE:String = "animator_complete";
      
      public static const SKELETON_ADVANCE_OPERATIONAL_COMPLETE:String = "skeleton_advance_operational_complete";
      
      public static const ANIMATOR_ENTER_FRAME:String = "animator_enter_frame";
       
      
      public var activeAnimationName:String;
      
      private var _animator:AnimatorBase;
      
      public function AnimatorEvent(param1:String, param2:AnimatorBase)
      {
         super(param1,false,false);
         _animator = param2;
      }
      
      public function get animator() : AnimatorBase
      {
         return _animator;
      }
      
      override public function clone() : Event
      {
         return new AnimatorEvent(type,_animator);
      }
   }
}
