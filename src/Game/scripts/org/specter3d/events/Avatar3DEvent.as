package org.specter3d.events
{
   public class Avatar3DEvent extends BaseEvent
   {
      
      public static const HEDER_Y_CHANGE:String = "HEDER_Y_CHANGE";
      
      public static const MAT_LOAD_CPL:String = "MAT_LOAD_CPL";
      
      public static const AVATAR_INIT_COMPLETE:String = "avatar_init_complete";
      
      public static const AVATAR_ANIM_COMPLETE:String = "avatar_anim_complete";
      
      public static const AVATAR_ANIM_ALL_COMPLETE:String = "avatar_anim_all_complete";
      
      public static const REPLACE_AVATAR_COMPLETE:String = "replace_avatar_complete";
      
      public static const AVATAR_TRIGGER:String = "avatar_trigger";
      
      public static const AVATAR_UPDATE_SCALE:String = "avatar_update_scale";
      
      public static const BOUND_FIXED:String = "bound_fixed";
       
      
      public function Avatar3DEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
      }
   }
}
