package nslm2.common.scene.multiLayer.configs
{
   public class BgEffectConfigVo extends BgTargetConfigVoBase
   {
       
      
      public var kind:int;
      
      public var effId:int;
      
      public var startDelay:int;
      
      public var loopDelay:int;
      
      public var playSpeed:int;
      
      public var battling:int;
      
      public var shake:int;
      
      public var transfrom3D:nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
      
      public function BgEffectConfigVo()
      {
         super();
      }
      
      override public function parse(param1:XML) : void
      {
         super.parse(param1);
         kind = param1.kind;
         battling = param1.battling;
         effId = param1.effId;
         shake = param1.shake;
         startDelay = param1.startDelay;
         loopDelay = param1.loopDelay;
         var _loc2_:XMLList = param1.transfrom3d;
         if(_loc2_ && _loc2_.length() > 0)
         {
            transfrom3D = new nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo();
            transfrom3D.parse(_loc2_[0]);
         }
         playSpeed = param1.playSpeed;
         if(playSpeed == 0)
         {
            playSpeed = 100;
         }
      }
      
      public function get isNormalEff3D() : Boolean
      {
         return this.kind == 5 || this.kind == 0;
      }
   }
}
