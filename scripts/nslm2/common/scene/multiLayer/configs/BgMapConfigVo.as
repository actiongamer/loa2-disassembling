package nslm2.common.scene.multiLayer.configs
{
   import flash.geom.Point;
   
   public class BgMapConfigVo
   {
       
      
      public var initX:int = 0;
      
      public var mapId:int;
      
      public var pathMaskCount:int;
      
      public var subSceneRate:Number;
      
      public var kind:int;
      
      public var ctrlKind:nslm2.common.scene.multiLayer.configs.BgCtrlKindVo;
      
      public var bgLayerConfigArr:Vector.<nslm2.common.scene.multiLayer.configs.BgLayerConfigVo>;
      
      public var pathLayer:nslm2.common.scene.multiLayer.configs.BgLayerConfigVo;
      
      public var isDeadFall:int;
      
      public var sceneSize:Point;
      
      private var _mainLayerVo:nslm2.common.scene.multiLayer.configs.BgLayerConfigVo;
      
      public function BgMapConfigVo(param1:int)
      {
         super();
         this.mapId = param1;
      }
      
      public function parse(param1:XML, param2:Boolean) : void
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         initX = BgConfigVoUtil.parseXMLInt(param1.scene.initX,0);
         pathMaskCount = BgConfigVoUtil.parseXMLInt(param1.scene.pathMaskCount,1);
         subSceneRate = param1.scene.subSceneRate;
         var _loc4_:XMLList = param1.scene.ctrlKind;
         if(_loc4_ && _loc4_.length() > 0)
         {
            this.ctrlKind = new nslm2.common.scene.multiLayer.configs.BgCtrlKindVo(_loc4_[0]);
         }
         this.kind = int(param1.scene.kind);
         if(this.kind == 0)
         {
            this.kind = 1;
         }
         bgLayerConfigArr = new Vector.<nslm2.common.scene.multiLayer.configs.BgLayerConfigVo>();
         var _loc6_:int = param1.layer.length();
         this.isDeadFall = param1.scene.isDeadFall;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1.layer[_loc7_];
            _loc3_ = new nslm2.common.scene.multiLayer.configs.BgLayerConfigVo();
            _loc3_.mapId = this.mapId;
            _loc3_.index = _loc7_;
            _loc3_.parse(_loc5_,param2);
            if(_loc3_.isMain)
            {
               _mainLayerVo = _loc3_;
            }
            bgLayerConfigArr.push(_loc3_);
            pathLayer = _loc3_;
            _loc7_++;
         }
         if(param1.scene.sceneWidth.length())
         {
            sceneSize = new Point(int(param1.scene.sceneWidth[0]),int(param1.scene.sceneHeight[0]));
         }
         else if(_mainLayerVo)
         {
            sceneSize = new Point(_mainLayerVo.tileImg.oriWidth,mainLayerVo.tileImg.oriHeight);
         }
      }
      
      public function get mainLayerVo() : nslm2.common.scene.multiLayer.configs.BgLayerConfigVo
      {
         return _mainLayerVo;
      }
   }
}
