package nslm2.common.scene.multiLayer.configs
{
   import away3d.entities.Entity;
   
   public class BgTargetConfigVoBase
   {
       
      
      public var scripts:Vector.<nslm2.common.scene.multiLayer.configs.BgScriptVo>;
      
      public var renderLayer:int;
      
      public function BgTargetConfigVoBase()
      {
         super();
      }
      
      public function parse(param1:XML) : void
      {
         renderLayer = BgConfigVoUtil.parseXMLInt(param1.renderLayer,Entity.ALL_LAYER);
         parseScript(param1);
      }
      
      public function parseScript(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _loc2_ = param1.script.length();
         if(_loc2_)
         {
            scripts = new Vector.<nslm2.common.scene.multiLayer.configs.BgScriptVo>();
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = new nslm2.common.scene.multiLayer.configs.BgScriptVo();
               _loc3_.parse(param1.script[_loc4_]);
               this.scripts.push(_loc3_);
               _loc4_++;
            }
         }
      }
   }
}
