package nslm2.common.scene.multiLayer.configs
{
   import away3d.core.base.Object3D;
   
   public class BgTransfrom3DVo
   {
       
      
      public var x2d:Number = 0;
      
      public var y2d:Number = 0;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var scaleAll:Number = 1;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var scaleZ:Number = 1;
      
      public var rotationX:Number = 0;
      
      public var rotationY:Number = 0;
      
      public var rotationZ:Number = 0;
      
      public function BgTransfrom3DVo()
      {
         super();
      }
      
      public static function setTransfrom(param1:Object3D, param2:BgTransfrom3DVo) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(param2 == null)
         {
            return;
         }
         var _loc5_:Array = ["x","y","z","rotationX","rotationY","rotationZ","scaleAll","scaleX","scaleY","scaleZ"];
         var _loc4_:int = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = _loc5_[_loc6_];
            if(isNaN(param2[_loc3_]) == false)
            {
               param1[_loc3_] = param2[_loc3_];
            }
            _loc6_++;
         }
      }
      
      public function parse(param1:XML, param2:Boolean = false) : void
      {
         if(param1)
         {
            this.x2d = BgConfigVoUtil.parseXMLNumber(param1.x2d,NaN);
            this.y2d = BgConfigVoUtil.parseXMLNumber(param1.y2d,NaN);
            this.x = BgConfigVoUtil.parseXMLNumber(param1.x,NaN);
            this.y = BgConfigVoUtil.parseXMLNumber(param1.y,NaN);
            this.z = BgConfigVoUtil.parseXMLNumber(param1.z,NaN);
            this.scaleAll = BgConfigVoUtil.parseXMLNumber(param1.scaleAll,NaN);
            this.scaleX = BgConfigVoUtil.parseXMLNumber(param1.scaleX,NaN);
            this.scaleY = BgConfigVoUtil.parseXMLNumber(param1.scaleY,NaN);
            this.scaleZ = BgConfigVoUtil.parseXMLNumber(param1.scaleZ,NaN);
            this.rotationX = BgConfigVoUtil.parseXMLNumber(param1.rotationX,NaN);
            this.rotationY = BgConfigVoUtil.parseXMLNumber(param1.rotationY,NaN);
            this.rotationZ = BgConfigVoUtil.parseXMLNumber(param1.rotationZ,NaN);
         }
      }
   }
}
