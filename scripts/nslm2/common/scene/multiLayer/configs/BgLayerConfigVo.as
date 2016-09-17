package nslm2.common.scene.multiLayer.configs
{
   public class BgLayerConfigVo
   {
      
      public static const KIND_NORMAL:int = 1;
      
      public static const KIND_ELEVATOR:int = 2;
      
      public static const KIND_BOSS:int = 3;
       
      
      public var mapId:int;
      
      public var index:int;
      
      public var kind:int;
      
      public var subSceneIndexArr:Array;
      
      public var layerZ:int;
      
      public var renderLayer:int;
      
      public var blendMode:String;
      
      public var speedRate:Number;
      
      public var ctrlKindVec:Vector.<nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo>;
      
      public var comment:String;
      
      public var tileImg:nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
      
      public var img3d:nslm2.common.scene.multiLayer.configs.BgImg3DConfigVo;
      
      public var effect:nslm2.common.scene.multiLayer.configs.BgEffectConfigVo;
      
      public var model3d:nslm2.common.scene.multiLayer.configs.BgModel3DVo;
      
      public var extraLayer:nslm2.common.scene.multiLayer.configs.BgExtraLayer;
      
      public var transfrom3D:nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
      
      public var isMain:Boolean = false;
      
      public function BgLayerConfigVo()
      {
         super();
      }
      
      public function parse(param1:XML, param2:Boolean) : void
      {
         var _loc9_:int = 0;
         var _loc12_:int = 0;
         var _loc4_:* = null;
         this.comment = param1.comment;
         if(this.comment == null)
         {
            this.comment = "";
         }
         if(param1.isMain.length())
         {
            this.isMain = Boolean(param1.isMain);
         }
         this.kind = param1.kind;
         _loc9_ = param1.ctrlKind.length();
         if(_loc9_)
         {
            ctrlKindVec = new Vector.<nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo>();
            _loc12_ = 0;
            while(_loc12_ < _loc9_)
            {
               this.ctrlKindVec.push(new nslm2.common.scene.multiLayer.configs.BgLayerCtrlKindVo(param1.ctrlKind[_loc12_]));
               _loc12_++;
            }
         }
         this.blendMode = param1.blendMode;
         if(kind == 0)
         {
            kind = 1;
         }
         var _loc7_:XMLList = param1.transfrom3d;
         if(_loc7_ && _loc7_.length() > 0)
         {
            transfrom3D = new nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo();
            transfrom3D.parse(_loc7_[0]);
         }
         this.layerZ = param1.layerZ;
         var _loc10_:String = param1.subSceneIndex;
         if(_loc10_)
         {
            subSceneIndexArr = _loc10_.split(",");
         }
         else
         {
            subSceneIndexArr = [1,2,3,4,5,6,7,8,9];
         }
         var _loc11_:XMLList = param1.model3d;
         if(_loc11_ && _loc11_.length() > 0)
         {
            model3d = new nslm2.common.scene.multiLayer.configs.BgModel3DVo();
            model3d.parse(_loc11_[0]);
         }
         this.speedRate = BgConfigVoUtil.parseXMLNumber(param1.speedRate,1);
         var _loc3_:XMLList = param1.img;
         if(_loc3_ && _loc3_.length() > 0)
         {
            tileImg = new nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo();
            tileImg.parse(_loc3_[0]);
         }
         var _loc8_:XMLList = param1.extraLayer;
         if(_loc8_ && _loc8_.length() > 0)
         {
            this.extraLayer = new nslm2.common.scene.multiLayer.configs.BgExtraLayer();
            extraLayer.parse(_loc8_[0]);
         }
         var _loc6_:XMLList = param1.img3d;
         if(_loc6_ && _loc6_.length() > 0)
         {
            img3d = new nslm2.common.scene.multiLayer.configs.BgImg3DConfigVo();
            img3d.parse(_loc6_[0]);
         }
         var _loc5_:XMLList = param1.effect;
         if(_loc5_ && _loc5_.length() > 0)
         {
            _loc4_ = new nslm2.common.scene.multiLayer.configs.BgEffectConfigVo();
            _loc4_.parse(_loc5_[0]);
            effect = _loc4_;
         }
      }
   }
}
