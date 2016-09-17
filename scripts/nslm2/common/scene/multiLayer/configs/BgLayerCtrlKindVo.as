package nslm2.common.scene.multiLayer.configs
{
   public class BgLayerCtrlKindVo
   {
      
      public static const CTRL_KIND_1051:int = 1051;
      
      public static const CTRL_KIND_1052:int = 1052;
      
      public static const CTRL_KIND_1053:int = 1053;
      
      public static const CTRL_KIND_1054:int = 1054;
       
      
      public var id:int;
      
      public var floatMax:int = 2;
      
      public var floatMin:int = 2;
      
      public var startDelay:int = 0;
      
      public var speed:int = -200;
      
      public function BgLayerCtrlKindVo(param1:XML)
      {
         super();
         if(param1.id.length())
         {
            this.id = param1.id;
            if(param1.floatMax.length())
            {
               this.floatMax = param1.floatMax[0];
            }
            if(param1.floatMin.length())
            {
               this.floatMin = param1.floatMin[0];
            }
            else
            {
               this.floatMin = floatMax;
            }
            if(param1.startDelay.length())
            {
               this.startDelay = param1.startDelay[0];
            }
            if(param1.speed.length())
            {
               this.speed = param1.speed[0];
            }
         }
         else
         {
            this.id = int(param1.text());
         }
      }
   }
}
