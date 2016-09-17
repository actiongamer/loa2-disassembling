package nslm2.modules.fightPlayer
{
   import org.specter3d.display.avatar2.AvatarBody3D;
   import org.specter3d.display.avatar2.Avatar3D;
   
   public class AvatarEquipBody3D extends AvatarBody3D
   {
       
      
      public var data;
      
      private var _waitBinding:Vector.<Avatar3D>;
      
      public function AvatarEquipBody3D()
      {
         _waitBinding = new Vector.<Avatar3D>();
         super();
      }
      
      public function addBindingPart(param1:Avatar3D) : void
      {
         _waitBinding.push(param1);
      }
      
      override public function set isAllowBinding(param1:Boolean) : void
      {
         var _loc2_:* = null;
         .super.isAllowBinding = param1;
         if(_waitBinding != null)
         {
            while(_waitBinding.length)
            {
               _loc2_ = _waitBinding.pop();
               bindingAvatar(_loc2_.avtType,_loc2_);
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _waitBinding && _loc1_;
         _waitBinding = null;
      }
   }
}
