package nslm2.common.scene.multiLayer.configs
{
   public class BgScriptVo
   {
       
      
      public var id:int;
      
      public var x:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var y:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var z:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var max:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var min:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var w:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var h:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var top:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var left:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var right:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var bottom:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var speed:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var duration:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var delay:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var loop:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var aimX:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public var aimY:nslm2.common.scene.multiLayer.configs.BgScriptValue;
      
      public function BgScriptVo()
      {
         super();
      }
      
      public static function parseValue(param1:XMLList) : nslm2.common.scene.multiLayer.configs.BgScriptValue
      {
         var _loc2_:* = null;
         if(param1.length() > 0)
         {
            _loc2_ = new nslm2.common.scene.multiLayer.configs.BgScriptValue();
            _loc2_.parse(param1[0]);
            return _loc2_;
         }
         return null;
      }
      
      public function parse(param1:XML) : void
      {
         id = param1.id;
         x = parseValue(param1.x);
         y = parseValue(param1.y);
         z = parseValue(param1.z);
         max = parseValue(param1.max);
         min = parseValue(param1.min);
         w = parseValue(param1.w);
         h = parseValue(param1.h);
         top = parseValue(param1.top);
         left = parseValue(param1.left);
         right = parseValue(param1.right);
         bottom = parseValue(param1.bottom);
         speed = parseValue(param1.speed);
         delay = parseValue(param1.delay);
         loop = parseValue(param1.loop);
         aimX = parseValue(param1.aimX);
         aimY = parseValue(param1.aimY);
      }
   }
}
