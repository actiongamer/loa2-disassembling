package nslm2.modules.battles.battle
{
   public class GameObject
   {
       
      
      protected var _isFreeze:Boolean = false;
      
      private var _frameTime:Number = 0;
      
      public function GameObject()
      {
         super();
      }
      
      public function startup() : void
      {
         gm.addGameObject(this);
      }
      
      public function shutdown() : void
      {
         gm.removeGameObject(this);
      }
      
      protected function get gm() : GameObjectManager
      {
         return GameObjectManager.Instance;
      }
      
      public function setFreeze(param1:Boolean) : void
      {
         _isFreeze = param1;
      }
      
      public function enterFrame(param1:Number) : void
      {
         if(_isFreeze)
         {
            return;
         }
      }
   }
}
