package nslm2.modules.scenes.commons
{
   public class SceneWeapon3D extends UIWeapon3D
   {
       
      
      protected var followTarget:nslm2.modules.scenes.commons.Unit3DBase;
      
      protected var _itemId:int;
      
      public function SceneWeapon3D(param1:nslm2.modules.scenes.commons.Unit3DBase, param2:int)
      {
         super();
         this.followTarget = param1;
         this.mouseEnabled = false;
         this.mouseChildren = false;
         _itemId = param2;
      }
      
      override public function dispose() : void
      {
         if(followTarget)
         {
            followTarget = null;
         }
         super.dispose();
      }
   }
}
