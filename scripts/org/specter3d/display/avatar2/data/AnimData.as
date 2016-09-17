package org.specter3d.display.avatar2.data
{
   public final class AnimData
   {
       
      
      private var _animName:String;
      
      private var _animUrl:String;
      
      private var _priority:int;
      
      public function AnimData(param1:String, param2:int = 0, param3:String = null)
      {
         super();
         _animName = param1;
         _priority = param2;
         _animUrl = param3;
      }
      
      public function get animName() : String
      {
         return _animName;
      }
      
      public function get animUrl() : String
      {
         return _animUrl;
      }
      
      public function set animUrl(param1:String) : void
      {
         _animUrl = param1;
      }
      
      public function get priority() : int
      {
         return _priority;
      }
   }
}
