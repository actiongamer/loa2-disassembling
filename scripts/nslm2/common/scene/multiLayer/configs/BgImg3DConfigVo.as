package nslm2.common.scene.multiLayer.configs
{
   public class BgImg3DConfigVo extends BgTargetConfigVoBase
   {
       
      
      public var id:int;
      
      public var imgKind:String;
      
      public var oriWidth:int;
      
      public var oriHeight:int;
      
      public var offsetX:int;
      
      public var offsetY:int;
      
      public var transfrom3D:nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
      
      public function BgImg3DConfigVo()
      {
         super();
      }
      
      public function get isAlpha() : Boolean
      {
         return this.imgKind == "png";
      }
      
      override public function parse(param1:XML) : void
      {
         super.parse(param1);
         this.id = param1.id;
         this.imgKind = String(param1.imgKind);
         this.oriWidth = param1.oriWidth;
         this.oriHeight = param1.oriHeight;
         this.offsetX = param1.offsetX;
         this.offsetY = param1.offsetY;
         var _loc2_:XMLList = param1.transfrom3d;
         if(_loc2_ && _loc2_.length() > 0)
         {
            transfrom3D = new nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo();
            transfrom3D.parse(_loc2_[0]);
         }
      }
   }
}
