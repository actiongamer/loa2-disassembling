package nslm2.modules.scenes.commons
{
   import proto.ScenePlayerInfo;
   import com.mz.core.event.ChangeValueEvent;
   import away3d.containers.ObjectContainer3D;
   
   public class ScenePlayer3D extends SceneUnit3D
   {
       
      
      public var playerInfo:ScenePlayerInfo;
      
      private var _pet:nslm2.modules.scenes.commons.ScenePet3D;
      
      public function ScenePlayer3D(param1:ObjectContainer3D = null)
      {
         super(param1);
      }
      
      public function get pet() : nslm2.modules.scenes.commons.ScenePet3D
      {
         return _pet;
      }
      
      public function set pet(param1:nslm2.modules.scenes.commons.ScenePet3D) : void
      {
         if(_pet != param1)
         {
            _pet = param1;
            if(_pet != null)
            {
               _pet.visible = getVisibleList("VISIBLE_KEY_DEFAULT");
            }
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         if(pet)
         {
            pet.visible = param1;
         }
      }
      
      override public function set showByLimite(param1:Boolean) : void
      {
         .super.showByLimite = param1;
         if(pet)
         {
            this.pet.showByLimite = param1;
         }
      }
      
      override protected function validatePos() : void
      {
         var _loc1_:Boolean = SceneModel.ins.findPathMed.isAlpha(this.pos2d);
         this.alpha = !!_loc1_?0.5:1;
         super.validatePos();
         this.dispatchEvent(new ChangeValueEvent(this.pos2d.clone()));
      }
      
      override public function dispose() : void
      {
         if(pet != null)
         {
            pet.dispose();
            pet = null;
         }
         super.dispose();
      }
   }
}
