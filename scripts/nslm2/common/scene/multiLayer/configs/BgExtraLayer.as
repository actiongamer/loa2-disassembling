package nslm2.common.scene.multiLayer.configs
{
   public class BgExtraLayer
   {
       
      
      public var offsetX:int;
      
      public var offsetY:int;
      
      public var transfrom3D:nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
      
      public function BgExtraLayer()
      {
         super();
      }
      
      public function parse(param1:XML) : void
      {
         this.offsetX = param1.offsetX;
         this.offsetY = param1.offsetY;
         var _loc2_:XMLList = param1.transfrom3d;
         if(_loc2_ && _loc2_.length() > 0)
         {
            transfrom3D = new nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo();
            transfrom3D.parse(_loc2_[0],false);
         }
      }
   }
}
